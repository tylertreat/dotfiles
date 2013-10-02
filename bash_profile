
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export ANDROID_HOME=/Users/Tyler/development/android-sdk

export PATH=$ANDROID_HOME/tools:/Users/Tyler/development/appengine-java-sdk-1.7.4/bin:$JAVA_HOME:/usr/local/bin:$PATH

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


