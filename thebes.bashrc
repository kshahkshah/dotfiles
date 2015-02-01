export PATH=$HOME/.rbenv/bin:/usr/local/Cellar:/usr/local/bin:/usr/local/sbin:$PATH

export PS1="\[\e[31;1m\]\h\[\e[0m\] \W "
export EDITOR="/usr/local/bin/subl -w"

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export HIVE_HOME=/usr/local/Cellar/hive/0.13.1/libexec

export RUBYLIB="/Users/kunal/Projects/mail2frontmatter/lib:$RUBYLIB"

export QUEUE_COUNT=2

eval "$(rbenv init -)"

bind '"\C-]":"\C-e\C-u pbcopy <<"EOF"\n\C-y\nEOF\n"'

git config --global user.name "Kunal Shah"
git config --global user.email "me@kunalashah.com"

git config --global core.editor "subl -w"
git config --global core.excludesfile ~/.gitignore

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto

git config --global diff.renamelimit 4000
git config --global diff.renames true

# Git
alias gs="git status"
alias gp="git push"
alias gd="git diff"
alias gds="git diff | subl"
alias gdc="git diff --cached"
alias gls="gs | grep 'both modified' | awk '{print $4}' | head -n 1 | xargs subl"

alias mountdir="ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => Dir.pwd).start'"

# Development
alias bi='bundle install'
alias s='subl .'
alias o='open .'

function gcm(){
  git commit -m "$1";
}

# Directory Shortcuts
alias p="cd ~/Projects"
alias pc='cd ~/Projects/coloredwords && o && s && gs'
alias cw='cd ~/Projects/coloredwords'
alias corre='cd ~/Projects/corre/capp'

# Start Commands
alias start_pg="postgres -D /usr/local/var/postgres"
alias stop_pg="postgres -D /usr/local/var/postgres stop -s -m fast"

alias starth="/usr/local/Cellar/hadoop/2.5.1/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.5.1/sbin/start-yarn.sh"
alias stoph="/usr/local/Cellar/hadoop/2.5.1/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.5.1/sbin/stop-dfs.sh"

alias start_mysql="mysql.server start"
alias stop_mysql="mysql.server stop"

alias start_mongo="mongod run --config /usr/local/etc/mongod.conf"
alias start_nginx="sudo nginx -c /usr/local/nginx/conf/nginx.conf"

alias start_redis="redis-server /usr/local/etc/redis.conf"
function stop_redis(){
  local REDIS_PID="`cat /usr/local/var/run/redis.pid`";
  kill -QUIT $REDIS_PID
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[ -f ~/.git-bash-completion.sh ] && . ~/.git-bash-completion.sh

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

setjdk 1.7