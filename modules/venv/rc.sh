#!/bin/zsh
# THIS_PATH="${BASH_SOURCE[0]}";
# SCRIPTPATH=$(dirname $THIS_PATH)

# function venv() {
#     case $1 in
#         init)
#             local CMD='python -m venv venv'
#             echo $CMD
#             eval $CMD
#             ;;
#         activate)
#             if [ ! -d "./venv" ]; then
#                 echo 'venv not found. run `venv init`'
#                 return 1
#             fi
#             local CMD='source venv/bin/activate'
#             echo $CMD
#             eval $CMD
#             ;;
#         makefile)
#             echo 'copy makefile'
#             cp "${SCRIPTPATH}/Makefile" .
#             ;;
#         *)
#             venv activate
#             ;;
#     esac
# }

#TODO: implement this by zsh