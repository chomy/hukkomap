#!/usr/bin/ruby
# -*- encoding: utf-8 -*-

require 'rexml/document'

def hasTag(e)
  e.elements.each do |el|
    if(el.name == "tag")
        return true
    end
  end
  return false
end

# node 要素がtag要素を持っているか。
# 持っていればtrue、そうでなければfalseを返却
def isAmenity(e)
  if(false == hasTag(e))
    return false
  end
  e.elements.each do |i|
    if("amenity" == i.attributes['k'])
      return true;
    end
  end
  return false
end



doc = REXML::Document.new(open("data.osm"))
doc.elements.each('osm/node') do |node|
  if(false == isAmenity(node))
    next;
  end
  
  info = Hash.new
  node.elements.each do |tag|
    if("tag" != tag.name)
      next
    end

    info[ tag.attributes['k'] ] = tag.attributes['v'] 
  end
  
  if(nil != info['name'])
    printf("%s & %s \\\\ \n", info['name'], info['contact:phone'])
  end
end
