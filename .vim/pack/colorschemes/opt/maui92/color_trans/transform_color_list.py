#! /usr/bin/env python

""" Convert values between RGB hex codes and xterm-256 color codes.

Nice long listing of all 256 colors and their codes. Useful for
developing console color themes, or even script output schemes.

Resources:
* http://en.wikipedia.org/wiki/8-bit_color
* http://en.wikipedia.org/wiki/ANSI_escape_code
* /usr/share/X11/rgb.txt

"""

__author__    = 'Christopher McAdams http://github.com/christophrmca.com'
__version__   = '0.1'
__license__   = 'WTFPL http://sam.zoy.org/wtfpl/'

#---------------------------------------------------------------------

import sys, re, json, pdb, config
from color_lookup_table import COLOR_LOOKUP

# Private Functions
def _create_dicts():
    short2rgb_dict = dict(COLOR_LOOKUP)
    return short2rgb_dict


def short2rgb(short):
    return "#" + SHORT2RGB_DICT[str(short)]

SHORT2RGB_DICT = _create_dicts()

with open(config.CONFIG['raw']) as color_dict:
    json_data = json.load(color_dict)

def convert_256toHex(json_data):
    for luminence in json_data:
        converted_colors = {}

        for luminence in json_data:
            converted_colors[luminence] = {}
            for colors in json_data[luminence]:
                converted_colors[luminence][colors] = short2rgb(json_data[luminence][colors])

            with open(config.CONFIG['web'], 'w') as color_dict:
                json.dump(converted_colors, color_dict)


#---------------------------------------------------------------------

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    convert_256toHex(json_data)
