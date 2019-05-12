# myConky

My Conky configuration.


## Preview

![(Preview)](https://github.com/Zwyx/myConky/blob/master/myConky.png)


## Requirement

You need [Conky](https://github.com/brndnmtthws/conky). It comes directly with some Linux distributions.


## Installation

Copy the content of this repository into `~/.conky/myConky/`.

In line `64` of the `~/.conky/myConky/myConky` file, replace `<ENTER_PROPER_NAME_HERE>` by your session name, so the path `/home/<ENTER_PROPER_NAME_HERE>/.conky/myConky/todo.txt` becomes correct. You cannot use `~` or `$HOME` in this particular path.

Make `todo.sh` executable:
```
chmod u+x ~/.conky/myConky/todo.sh
```

Use Conky Manager to set your new Conky configuration, or start it with
```
conky -c ~/.conky/myConky/myConky
```

If the date and time are not displayed like on the preview image, you might need to install the font present in the `fonts` directory in your system.


## Using the TO DO feature

```
~/.conky/myConky/todo.sh [option] [arguments]
	a	add		Appends arguments to the list
	r x|all	remove		Removes item number x, or all the items, from the list
	l	list		Lists all the todos with the item number
	-h	help		Display this help and exit
```

Exemple: `~/.conky/myConky/todo.sh a This is a TO DO item`


### Recommended shell aliases for TO DO

```
alias todo=~/.conky/myConky/todo.sh
alias td='~/.conky/myConky/todo.sh a'
alias tda='~/.conky/myConky/todo.sh a'
alias tdr='~/.conky/myConky/todo.sh r'
alias tdl='~/.conky/myConky/todo.sh l'
```

Exemple: `td This is a TO DO item`
