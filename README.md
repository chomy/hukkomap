hukkomap
========
このリポジトリは、Hack4Iwate http://facebook.com/groups/hack4iwate.osm で提案されている復興店舗マップ自動生成システムのプロトタイプです。

Debian sid(unstable) で開発、試験を行っています。make すると、復興店舗マップを自動生成するために、OSMサーバからデータをダウンロードし、地図のSVGファイルを生成し、amenity タグを解析して表を生成して、TeXを使ってPDFを作成しています。

必要なパッケージは、TeXの他に、inkscape、librsvg2-bin、xmlstarlet、wget などです。

OSMのレンダリングの手順に関する情報は、http://wiki.openstreetmap.org/wiki/JA:Osmarender/Howto にあります。

なぜかTeXがちゃんと地図を埋め込んでくれないので、xmlstarletで生成したSVGをinkscapeでPSに変換し、その後にわざわざrsvgでこのベクタグラフィクスを拡大?して、EPSに変換しています。これは、本質的に XSLT を修正すれば直ると考えています。

