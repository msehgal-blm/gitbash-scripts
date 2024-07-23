#### Git functions ####

function gs() {
    # git status
    git status
}

function ga() {
    # git add
    git add .
}

function gas() {
    # git add status
    git add .
    git status
}

function grs() {
    # git restore --staged
    git restore --staged $*
}
 
function gnb() {
    # git checkout -b <new-branch-name>
    git checkout -b $*
}
 
function gcb() {
    # git checkout <branch-name>
    git checkout $*
}

function gdb() {
    # git delete <branch-name>
	git branch -d $*
}
 
function gcm() {
    # git commit message "<message>"
    git commit -m "$*"
}
 
function gpo() {
    # git push origin <branch-name>
    git push origin $*
}
 
function gpoc() {
    # git push origin <current-branch>
    local branch=$(git rev-parse --abbrev-ref HEAD)
    git push origin "$branch"
}

function grao() {
    # git remote add origin <repo-url>
    git remote add origin $*
}


#### Navigation functions ####

function @(){
	local dir
	for depth in {1..3}; do
		dir=$(find . -maxdepth $depth -type d -name "*$1*" | head -n 1)
		if [[ -n $dir ]]; then
			echo "switching to: $dir"
			cd "$dir" || return
			return
		fi
	done
	echo "no match"
}

function handle_at() {
    local base_dir="$1"
    shift
    if [[ $1 == "@" ]]; then
        cd "$base_dir" || return
        shift
        @ "$@"
    else
        cd "$base_dir/$*"
    fi
}

function c() {
    handle_at /c "$@"
}

function tmp() {
    handle_at /c/tmp "$@"
}

function release() {
    handle_at /c/tmp/release "$@"
}

function tools() {
    handle_at /c/tmp/tools "$@"
}

function workspace() {
    handle_at /c/tmp/workspace "$@"
}

alias rls='release'
alias tls='tools'
alias ws='workspace'
