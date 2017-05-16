export GOPATH=~/Go
export GOROOT=~/Development/go1.8.1

export PATH=$GOPATH/bin:$GOROOT/bin:/usr/local/bin:~/scripts:$PATH

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
