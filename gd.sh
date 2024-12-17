#!/usr/bin/env bash

# gd: goto directory

# dependencies: fzf

# Note: for this command to work properly, you must prepend it with "."
#       the user is recommended to add the alias gd=". gd" to their
#       shell rc file

[ -f ~/.gd_idx ] || set -- -u

case "$1" in
    -u)
	###
	# Replace the following example arguments to `ls -R` with
	# the subdirectories of your home directory that you want
	# `gd` to include. Make sure to include "\" characters at
	# the end of each line.
	###
	cd; ls -R \
	   downloads desktop .config .emacs.d \
	   scripts foo bar baz \
	    | grep :$ | sed 's/:$//' > .gd_idx
	echo 'index updated'
	cd "$OLDPWD"  ;;
    *)
	cd ~/"$(fzf < ~/.gd_idx)" ;;
esac
