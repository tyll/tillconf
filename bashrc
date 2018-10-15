if command -v powerline-daemon >/dev/null 2>&1; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  test -f /usr/share/powerline/bash/powerline.sh && . /usr/share/powerline/bash/powerline.sh
fi

if command -v keychain >/dev/null 2>&1; then
    keychain
    [ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
    [ -f $HOME/.keychain/$HOSTNAME-sh ] && \
        . $HOME/.keychain/$HOSTNAME-sh
    [ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
        . $HOME/.keychain/$HOSTNAME-sh-gpg
fi

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
export HISTSIZE=2048000
export HISTFILESIZE="${HISTSIZE}"


command -v direnv &>/dev/null && eval "$(direnv hook bash)"


export EDITOR=vim
command -v vimx >/dev/null && alias vim="vimx"
alias vi=vim
alias vispec="vim *.spec"

alias __list_rpm_gpg='rpm --qf "%{name}-%{version}-%{release} %{summary}\n" -q gpg-pubkey'
alias tma="tmux attach"
alias nvr="/bin/rpm --qf '%{name}-%{version}-%{release}\n' -q"
alias youtube-dl='youtube-dl --output "%(title)s-%(extractor)s:%(id)s.%(ext)s"'
alias kvm_iso="qemu-kvm -boot d -k de -m 1024 -usbdevice tablet -cdrom"
eval `dircolors -b /etc/DIR_COLORS`
alias d="ls --color=auto"
alias ls="ls --color=auto"
alias ll="ls --color=auto -lA"
alias l="ls --color=auto -l"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias cclive='cclive --format best --filename-format="%t-%h:%i.%s"'
alias clive='clive --format best --filename-format="%t-%h:%i.%s"'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias md="mkdir -p"

alias gc="git commit -v"
alias gcv="gc"
alias ga="gc --amend"
alias gcva="gcv -a"
alias gst="git status"
alias ytd="youtube-dl"
alias iSSH="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
alias dos2unix="recode ibmpc..lat1"
alias unix2dos="recode lat1..ibmpc"
#unset SSH_ASKPASS;


ssh_convert () {
    ssh-keygen -f "${1}" -i
}

MAIL=$HOME/Maildir/
PATH=${PATH}:${HOME}/go/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Settings for X and non X
if [[ "${DISPLAY}" != "" ]] && xset q &>/dev/null
then
    # delay, rate in 1/s
    xset r rate 220 45
    gsettings set org.gnome.desktop.peripherals.keyboard delay 220
    # Milliseconds between repeat keypresses
    gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 22
    xkbset q &>/dev/null && xkbset sticky -twokey # latchlock
    xkbset q &>/dev/null && xkbset exp 3600 sticky # latchlock
    xinput set-button-map "Logitech USB-PS/2 Optical Mouse" 1 2 3 4 5 6 7 2 2>/dev/null
fi
if [[ "${TERM}" != "" ]]
then
    setterm -blength 0 -bfreq 0 &> /dev/null
fi
