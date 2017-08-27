

# For zsh users, command versions are here (ppkill accepts options like -9).
# https://github.com/mooz/percol

# function ppgrep() {
#     if [[ $1 == "" ]]; then
#         PERCOL=percol
#     else
#         PERCOL="percol --query $1"
#     fi
#     ps aux | eval $PERCOL | awk '{ print $2 }'
# }
#
# function ppkill() {
#     if [[ $1 =~ "^-" ]]; then
#         QUERY=""            # options only
#     else
#         QUERY=$1            # with a query
#         [[ $# > 0 ]] && shift
#     fi
#     ppgrep $QUERY | xargs kill $*
# }


# ps aux | percol
# percol /var/log/syslog
#
# For zsh users, command versions are here (ppkill accepts options like -9).
#
# function ppgrep() {
#     if [[ $1 == "" ]]; then
#         PERCOL=percol
#     else
#         PERCOL="percol --query $1"
#     fi
#     ps aux | eval $PERCOL | awk '{ print $2 }'
# }
#
# function ppkill() {
#     if [[ $1 =~ "^-" ]]; then
#         QUERY=""            # options only
#     else
#         QUERY=$1            # with a query
#         [[ $# > 0 ]] && shift
#     fi
#     ppgrep $QUERY | xargs kill $*
# }
