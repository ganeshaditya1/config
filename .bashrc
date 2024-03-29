# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\d\[\e[m\] \[\e[32m\]\T\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\] \`parse_git_branch\` \n\\$"

# Aliases
alias cdw="cd ~/workspace/"
alias sdocker="sudo docker "
alias sapt="sudo apt-get install "

# TMUX commands
alias list_s="tmux -u ls"
alias new_s="tmux -u new -s "
alias attach_s="tmux -u a -t "
alias kill_s="tmux -u kill-session -t "
alias source_s="tmux source-file ~/.tmux.conf"

export PATH=${PATH}:..:.
export PATH=/home/aambadipudi/workspace/storm_tutorial/apache-storm-2.2.0/bin:${PATH}
export PATH=/home/aambadipudi/workspace/storm_tutorial/apache-storm-2.2.0/bin:${PATH}

function histg
{
    history | grep $*
}

function cd_up() 
{
    cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'
