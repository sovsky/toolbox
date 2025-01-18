#!/bin/bash

function save_buffer_to_file {
    echo -en "$BUFFER" > "$1"
}

function print_buffer {
    echo -e "$BUFFER"
}


function clear_buffer {
    BUFFER=""
}

function add_to_buffer {
    if [ -z "$BUFFER" ]; then
        BUFFER="$1"
    else
        BUFFER="$BUFFER\n$1"
    fi
}

function confirm_save {
    set_log_file_name
    echo -e "\n$THEMATIC_BREAK"
    while true; do
        read -erp "Do you want to save the output to a $LOG_FILE_NAME file? [y/n]: " CONFIRM_SAVE
        if [[ "$CONFIRM_SAVE" == "y" ]]; then
            save_buffer_to_file "$LOG_FILE_NAME"
            break
        elif [[ "$CONFIRM_SAVE" == "n" ]]; then
            break
        else
            echo "Please enter 'y' or 'n'."
        fi
    done
}

function set_log_file_name {
    LOG_FILE_NAME="${NEXT_MODULE%.*}.log"
}

function press_any_key_to_continue {
    echo "$THEMATIC_BREAK"
    read -n 1 -s -r -p "Press any key to continue..."
}

function check_user_is_root {
    clear_buffer

    if [ "$(id -u)" -ne 0 ]; then
        echo "You need to be root! Run script with sudo."
        press_any_key_to_continue
        return 1
    fi
}