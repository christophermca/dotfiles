#! /usr/bin/env python

""" Convert values between RGB hex codes and xterm-256 color codes.

Nice long listing of all 256 colors and their codes. Useful for
developing console color themes, or even script output schemes.

Resources:
* http://en.wikipedia.org/wiki/8-bit_color
* http://en.wikipedia.org/wiki/ANSI_escape_code
* /usr/share/X11/rgb.txt

I'm not sure where this script was inspired from. I think I must have
written it from scratch, though it's been several years now.
"""

__author__    = 'Micah Elliott http://MicahElliott.com'
__version__   = '0.1'
__copyright__ = 'Copyright (C) 2011 Micah Elliott.  All rights reserved.'
__license__   = 'WTFPL http://sam.zoy.org/wtfpl/'

#---------------------------------------------------------------------

import sys, re, json, pdb
from color_lookup_table import COLOR_LOOKUP

# Private Functions
def _str2hex(hexstr):
    return int(hexstr, 16)

def _strip_hash(rgb):
    # Strip leading `#` if exists.
    if rgb.startswith('#'):
        rgb = rgb.lstrip('#')
    return rgb

def _create_dicts():
    short2rgb_dict = dict(COLOR_LOOKUP)
    rgb2short_dict = {}
    for k, v in short2rgb_dict.items():
        rgb2short_dict[v] = k
    return rgb2short_dict, short2rgb_dict


def short2rgb(short):
    print(SHORT2RGB_DICT['237'] )
    return SHORT2RGB_DICT[str(short)]

def print_all():
    """ all 256 xterm color codes.
    """
    for short, rgb in COLOR_LOOKUP:
        sys.stdout.write('\033[48;5;%sm%s:%s' % (short, short, rgb))
        sys.stdout.write("\033[0m  ")
        sys.stdout.write('\033[38;5;%sm%s:%s' % (short, short, rgb))
        sys.stdout.write("\033[0m\n")
    print("Printed all codes.")
    print("You can translate a hex or 0-255 code by providing an argument.")

def rgb2short(rgb):
    """ Find the closest xterm-256 approximation to the given RGB value.
    @param rgb: Hex code representing an RGB value, eg, 'abcdef'
    @returns: String between 0 and 255, compatible with xterm.
    >>> rgb2short('123456')
    ('23', '005f5f')
    >>> rgb2short('ffffff')
    ('231', 'ffffff')
    >>> rgb2short('0DADD6') # vimeo logo
    ('38', '00afd7')
    """
    rgb = _strip_hash(rgb)
    incs = (0x00, 0x5f, 0x87, 0xaf, 0xd7, 0xff)
    # Break 6-char RGB code into 3 integer vals.
    parts = [ int(h, 16) for h in re.split(r'(..)(..)(..)', rgb)[1:4] ]
    res = []
    for part in parts:
        i = 0
        while i < len(incs)-1:
            s, b = incs[i], incs[i+1]  # smaller, bigger
            if s <= part <= b:
                s1 = abs(s - part)
                b1 = abs(b - part)
                if s1 < b1: closest = s
                else: closest = b
                res.append(closest)
                break
            i += 1
    #'***', res
    res = ''.join([ ('%02.x' % i) for i in res ])
    equiv = RGB2SHORT_DICT[ res ]
    #'***', res, equiv
    return equiv, res

RGB2SHORT_DICT, SHORT2RGB_DICT = _create_dicts()

with open('../color_dict.json') as color_dict:
    json_data = json.load(color_dict)

def convert_hex2short(json):
    for luminence in json:
        qq = json[luminence]
        print(qq.get( 'bg' ))

        short2rgb(qq['bg'])
        #for color in json[luminence]:
        #    #print("%s: %d" % (color, json[x][color]))
        #    qq = json[luminence].keys()
        #    print(qq)
        #    short2rgb(qq)

convert_hex2short(json_data)


#---------------------------------------------------------------------

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    if len(sys.argv) == 1:
        #print_all()
        raise SystemExit
    arg = sys.argv[1]
    if len(arg) < 4 and int(arg) < 256:
        rgb = short2rgb(arg)
        sys.stdout.write('xterm color \033[38;5;%sm%s\033[0m -> RGB exact \033[38;5;%sm%s\033[0m' % (arg, arg, arg, rgb))
        sys.stdout.write("\033[0m\n")
    else:
        short, rgb = rgb2short(arg)
        sys.stdout.write('RGB %s -> xterm color approx \033[38;5;%sm%s (%s)' % (arg, short, short, rgb))
        sys.stdout.write("\033[0m\n")
