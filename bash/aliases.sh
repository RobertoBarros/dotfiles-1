######## cd / path
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd ..'
function proj { cd ~/Dropbox/ruby/rails/$1; } # changing directory to code project
alias mkdir='mkdir -p'
alias tree='tree -C | less -R'


######## Ruby/Rails
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias b="bundle"
alias be="bundle exec"
alias beg="bundle exec guard"
alias bef="bundle exec foreman start"
alias rpry="pry -r./config/environment"
alias tail-sidekiq="grc -c ~/.bash/grc/grc.sidekiq tail -f ./log/sidekiq.log"

######## ls
alias ls="ls -F --color=always"
alias l="ls -lAh --color=always"
alias ll="ls -l --color=always"
alias la='ls -A --color=always'
alias ld='ls -1d */' #Exibe somente diretorios

####### Safety net
alias rm='rm -i'
alias rr="rm -ri"
alias cp='cp -i'
alias mv='mv -i'


####### git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias gk='gitk --all &'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias grlog="git remote update && git log HEAD..origin/master --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative" #log dos commits que estão somente remoto
alias gwhat="git whatchanged"
alias gundo='git reset --soft HEAD^' # Undo your last commit, but don't throw away your changes


######## Disk

#ordered list of subdirectory sizes
alias ds="du -sk ./* | sort -rn | awk 'BEGIN{ pref[1]=\"K\"; pref[2]=\"M\"; pref[3]=\"G\";} { total = total + \$1; x = \$1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf(\"%g%s\t%s\n\",int(x*10)/10,pref[y],\$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf(\"Total: %g%s\n\",int(total*10)/10,pref[y]); }'"

alias df='df -h' # Show disk usage


######## others
alias t="tail -f"
# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias ip="curl http://ipecho.net/plain; echo"

alias top='top -o cpu' # ordenado pela CPU
alias topm='top -o vsize' # ordenado pela Memoria

alias funfact='wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;"'

#Converte um vídeo .mov para .gif: movtogif input.mov out.gif
movtogif(){
    ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "$2"
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
