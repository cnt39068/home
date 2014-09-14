set current_branch=`/bin/bash -c 'git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/" ' `
set prompt="[%{\033]0;%n@%m:%~\007%}%n@%m %{\033[01;34m%}%C%{\033[0m%}]%{\033[01;31m%}$current_branch%{\033[0m%}%# %{\033[0m%}"
