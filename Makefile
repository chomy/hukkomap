LEFT=141.879854
RIGHT=141.882879
TOP=39.276548
BOTTOM=39.273445


all: hukkomap.pdf



data.osm:
	wget -O data.osm http://api.openstreetmap.org/api/0.6/map?bbox=${LEFT},${BOTTOM},${RIGHT},${TOP}

map.svg: data.osm
	xmlstarlet tr osmarender.xsl osm-map-features-z17.xml >map.svg

map.eps: map-plain.svg
	rsvg-convert -o $@ --format=ps -x 10 -y 10 $<

map-plain.svg: map.svg
	inkscape -D -T --export-plain-svg=$@ $<


hukkomap.tex: map.eps hukkomap.head hukkomap.foot
	cat hukkomap.head >hukkomap.tex
	./storedata.rb >>hukkomap.tex
	cat hukkomap.foot >> hukkomap.tex

hukkomap.dvi: hukkomap.tex
	platex $<

hukkomap.pdf: hukkomap.dvi
	dvipdfmx $<

clean:
	rm -f data.osm map-plain.svg hukkomap.pdf hukkomap.dvi map.svg hukkomap.tex map.svg map.eps *.aux *.log
