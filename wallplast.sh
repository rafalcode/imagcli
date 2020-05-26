#!/bin/bash
# the last in the wallpaper section

SZSTR="500x500"
convert -size $SZSTR xc: +noise Random   \( +clone -transpose \) \
    \( +clone -sparse-color voronoi '%w,0 white 0,%h black' \) \
    -composite \
    \( +clone -rotate -90 \) +append \
    \( +clone -rotate 180 \) -append \
    \
    -virtual-pixel Tile -blur 0x5 -auto-level \
    -separate -background white \
    -compose ModulusAdd -flatten -channel R -combine +channel \
    -set colorspace HSB -colorspace RGB \
    tile_p4g.jpg

