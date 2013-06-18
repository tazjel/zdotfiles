Usage : scrot [OPTIONS]... [FILE]
  Where FILE is the target file for the screenshot.
  If FILE is not specified, a date-stamped file will be dropped in the
  current directory.
  See man scrot for more details
  -h, --help                display this help and exit
  -v, --version             output version information and exit
  -b, --border              When selecting a window, grab wm border too
  -c, --count               show a countdown before taking the shot
  -d, --delay NUM           wait NUM seconds before taking a shot
  -e, --exec APP            run APP on the resulting screenshot
  -q, --quality NUM         Image quality (1-100) high value means
                            high size, low compression. Default: 75.
                            For lossless compression formats, like png,
                            low quality means high compression.
  -m, --multidisp           For multiple heads, grab shot from each
                            and join them together.
  -s, --select              interactively choose a window or rectangle
                            with the mouse
  -u, --focused             use the currently focused window
  -t, --thumb NUM           generate thumbnail too. NUM is the percentage
                            of the original size for the thumbnail to be,
                            or the geometry in percent, e.g. 50x60 or 80x20.
  -z, --silent              Prevent beeping

  SPECIAL STRINGS
  Both the --exec and filename parameters can take format specifiers
  that are expanded by scrot when encountered.
  There are two types of format specifier. Characters preceded by a '%'
  are interpreted by strftime(2). See man strftime for examples.
  These options may be used to refer to the current date and time.
  The second kind are internal to scrot  and are prefixed by '$'
  The following specifiers are recognised:
                  $f image path/filename (ignored when used in the filename)
                  $m thumbnail path/filename
                  $n image name (ignored when used in the filename)
                  $s image size (bytes) (ignored when used in the filename)
                  $p image pixel size
                  $w image width
                  $h image height
                  $t image format
                  $$  prints a literal '$'
                  \n prints a newline (ignored when used in the filename)
  Example:
          scrot '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/images/shots/'
          Creates a file called something like 2000-10-30_2560x1024_scrot.png
          and moves it to your images directory.

This program is free software see the file COPYING for licensing info.
Copyright Tom Gilbert 2000
Email bugs to <scrot_sucks@linuxbrit.co.uk>
