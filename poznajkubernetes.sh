if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.poznajkubernetes-bash/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -n "$ZSH_VERSION" ]; then
    source <(kubectl completion zsh)
elif [ -n "$BASH_VERSION" ]; then
    source <(kubectl completion bash)
else
   echo "not supported console"
fi

alias k=kubectl
# complete -F __start_kubectl k

#kubectx and kubens
export PATH=~/.kubectx:$PATH

KUBE_PS1_SYMBOL_DEFAULT=${KUBE_PS1_SYMBOL_DEFAULT:-$'\u2388'} # k8s icon without space
KUBE_PS1_NS_COLOR="142"        #from YELLOW 09
KUBE_PS1_CTX_COLOR="37"        #from TEAL 09

source  ~/.kube-ps1/kube-ps1.sh
PS1='[\[\033[38;5;${KUBE_PS1_NS_COLOR}m\]\u\[\033[m\]@\[\033[38;5;${KUBE_PS1_CTX_COLOR}m\]\h:\[\033[33;m\]\W\[\033[m\] $(kube_ps1)]\n\$ '
