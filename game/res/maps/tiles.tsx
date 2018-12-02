<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.2" tiledversion="1.2.1" name="tiles" tilewidth="16" tileheight="16" tilecount="256" columns="16">
 <image source="../tiles/tiles.png" width="256" height="256"/>
 <tile id="32">
  <properties>
   <property name="ladder" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="33">
  <properties>
   <property name="ladder" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="34" type="spike"/>
 <tile id="49">
  <animation>
   <frame tileid="49" duration="100"/>
   <frame tileid="50" duration="100"/>
  </animation>
 </tile>
</tileset>
