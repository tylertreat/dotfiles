
if [ -n "${JAVA_HOME}" ] ; then
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents/Home
fi

if [ -n "${ANDROID_HOME}" ] ; then
    export ANDROID_HOME=/Users/Tyler/Development/android-sdk
fi

if [ -n "${PATH}" ] ; then
    export PATH=/usr/gnu/sed-4.2/bin:/usr/android:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:/opt/local/bin:/usr/local/share/npm/bin:$PATH
fi

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

alias gae='cd /usr/local/google_appengine/'

