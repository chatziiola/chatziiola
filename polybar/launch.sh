#!/usr/bin/env bash

# Color {{{
PFILE="$XDG_CONFIG_HOME/polybar/colors.ini"
#RFILE="$HOME/.config/polybar/material/scripts/rofi/colors.rasi"
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = #aa$BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/module-fg = #.*/module-fg = $MF/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	sed -i -e "s/secondary = #.*/secondary = $SC/g" $PFILE
	sed -i -e "s/alternate = #.*/alternate = $AL/g" $PFILE
	
	# rofi
#	cat > $RFILE <<- EOF
#	/* colors */
#
#	* {
#	  al:   #00000000;
#	  bg:   ${BG}FF;
#	  bga:  ${AC}33;
#	  bar:  ${MF}FF;
#	  fg:   ${FG}FF;
#	  ac:   ${AC}FF;
#	}
#	EOF
}

hex_to_rgb() {
    # Convert a hex value WITHOUT the hashtag (#)
    R=$(printf "%d" 0x${1:0:2})
    G=$(printf "%d" 0x${1:2:2})
    B=$(printf "%d" 0x${1:4:2})
}

get_fg_color(){
    INTENSITY=$(calc "$R*0.299 + $G*0.587 + $B*0.114")
    
    if [ $(echo "$INTENSITY>186" | bc) -eq 1 ]; then
        MF="#202020"
    else
        MF="#F5F5F5"
    fi
}

# Main

# Source the pywal color file
. "$HOME/.cache/wal/colors.sh"

BG=`printf "%s\n" "$background" | sed "s/\#//g"`
FG=`printf "%s\n" "$foreground"`
FGA=`printf "%s\n" "$color8"`
AC=`printf "%s\n" "$color4"`
SC=`printf "%s\n" "$color5"`
AL=`printf "%s\n" "$color3"`
HEX=${AC:1}
hex_to_rgb $HEX
get_fg_color
change_color
# }}}

# Polybar launch {{{
polybar middle -c "$XDG_CONFIG_HOME/polybar/$1.ini" &
polybar left -c "$XDG_CONFIG_HOME/polybar/$1.ini" &
polybar right -c "$XDG_CONFIG_HOME/polybar/$1.ini" &
#polybar zoe -c "$XDG_CONFIG_HOME/polybar/$1.ini" &
# }}}
