[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
alias sky="cd ~/WebFilings/bigsky && source ~/dev/wf/sky/bin/activate"

JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
ANDROID_HOME=/Users/tylertreat/development/android-sdk

PATH=$ANDROID_HOME/tools:$JAVA_HOME:/Users/tylertreat/Development/gsutil:$PATH

source ~/.aliases

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

source /Users/tylertreat/.pythonbrew/pythons/Python-2.7/bin/virtualenvwrapper.sh

