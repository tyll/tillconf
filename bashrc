if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

keychain
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
    . $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
    . $HOME/.keychain/$HOSTNAME-sh-gpg

# If set, bash checks the window size after each command and,
# if necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the history list is appended to the file named by the
# value of the HISTFILE variable when the shell exits, rather than overwriting
# the file.
shopt -s  histappend

# If set, minor errors in the spelling of a directory component in a cd
# command will be corrected.  The errors checked  for  are  transposed
# characters,  a  missing character, and one character too many.  If a
# correction is found, the corrected file name is printed, and the command
# proceeds.  This option is only used by interactive shells.
shopt -s cdspell

export HISTCONTROL=ignoredups:erasedups
HISTSIZE=2048000

# delay, rate in 1/s
xset r rate 220 45
gsettings set org.gnome.desktop.peripherals.keyboard delay 220
# Milliseconds between repeat keypresses
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 22

export EDITOR=vim
command -v vimx >/dev/null && alias vim="vimx"
alias vi=vim
alias vispec="vim *.spec"

alias __list_rpm_gpg='rpm --qf "%{name}-%{version}-%{release} %{summary}\n" -q gpg-pubkey'
alias tma="tmux attach"
alias nvr="/bin/rpm --qf '%{name}-%{version}-%{release}\n' -q"
alias youtube-dl='youtube-dl --output "%(title)s-%(extractor)s:%(id)s.%(ext)s"'

PATH=${PATH}:${HOME}/go/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Settings for X and non X
if [[ "${DISPLAY}" != "" ]]
then
    xset b off
    xset r rate 220 45
    xkbset sticky -twokey # latchlock
    xkbset exp 3600 sticky # latchlock
fi
if [[ "${TERM}" != "" ]]
then
    setterm -blength 0 -bfreq 0 &> /dev/null
fi
