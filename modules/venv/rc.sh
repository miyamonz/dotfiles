#!/bin/bash

function venv() {
    case $1 in
        init)
            local CMD='python -m venv venv'
            echo $CMD
            eval $CMD
            ;;
        activate)
            if [ ! -d "./venv" ]; then
                echo 'venv not found. run `venv init`'
                return 1 
            fi 
            local CMD='source venv/bin/activate'
            echo $CMD
            eval $CMD
            ;;
        *)
            venv activate
            ;;            
    esac
}
