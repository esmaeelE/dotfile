# dotfile

## TODO
- Use GNU stow to manage my dotfile files
- 


## covert to Persian cal
```
echo 2022-11-1 | pcal
```
## find current date

```
pcal -t 
```

## doomemacs

Emacs can handle bidi text Like Persian and English well. But DoomEmacs not configured fot that.
Here is the fix.

Enable bidi module in `.doom/init.dl` by removing ;; comment sign

place this line in `config.el`

  ```(+bidi-global-mode 1)```

Sync doom by running `doom sync`

  ```~/.config/emacs/bin/doom sync```

Run only terminal not GUI
```
emacs -nw
```

Change/Preview theme in doomemacs
```
SPC h t 
```

