# dotfile


## covert to Persian cal

#echo 2022-11-1 | pcal


## find current date

# pcal -t 



doomemacs



emacs can handle bidi text Like Persian and English well. But doomemacs not configured fot that.

Here is the fix.

enable bidi module in .doom/init.dl and place this linke in config.el and sync doom by running: doom sync

(+bidi-global-mode 1)



