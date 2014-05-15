export PATH=/usr/local/bin:~/bin:~/development/google-cloud-sdk/bin:$PATH

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

source ~/.aliases
source /usr/local/bin/virtualenvwrapper.sh

function grepp () {
    echo "Greping for $@"
    grep -R --include="*.py" "$@" * ;
}

function grepj () {
    echo "Greping for $@"
    grep -R --include="*.java" "$@" * ;
}

function grepjs () {
    echo "Greping for $@"
    grep -R --include="*.js" --include="*.coffee" "$@" * ;
}

eval "$(pyenv init -)"

