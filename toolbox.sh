#!/bin/bash

source ./helpers.sh

BUFFER=""
THEMATIC_BREAK="------------------------------------------------------------------------------"
MENU_CHOICE=-1
NAVBAR="Toolbox"
PREVIOUS_NAVBARS=()
CURRENT_MODULE="modules"
PREVIOUS_MODULES=()
NEXT_MODULE=""
declare -gA MENU_OPTIONS
MENU_OPTIONS_KEYS=()

function check_modules_directory {
    if [ ! -d "modules" ]; then
        echo "No modules directory found!"
        exit 1
    fi
}

function create_menu_options {
    MENU_OPTIONS_KEYS=()
    unset -v MENU_OPTIONS
    declare -gA MENU_OPTIONS

    local i=1
    for module in "$CURRENT_MODULE"/*; do
        if [[ "$module" == "$CURRENT_MODULE/config.sh" ]]; then
            continue
        fi

        if [[ -d "$module" ]]; then
            if [[ ! -f "$module/config.sh" ]]; then
                continue
            fi

            if ! grep -q "MODULE_TITLE" "$module/config.sh"; then
                continue
            fi

            source "$module/config.sh"
        else
            if [[ "${module##*.}" != "sh" ]]; then
                continue
            fi

            if ! grep -q "MODULE_TITLE" "$module" || ! grep -q "function call" "$module"; then
                continue
            fi

            source "$module"
        fi

        MENU_OPTIONS_KEYS+=("$i")
        MENU_OPTIONS[$i]="$module#$MODULE_TITLE"
        ((i+=1))
    done
}

function print_menu {
    clear
    echo "$NAVBAR"
    echo "$THEMATIC_BREAK"

    for key in "${MENU_OPTIONS_KEYS[@]}"; do
        MODULE_TITLE=$(echo "${MENU_OPTIONS[$key]}" | cut -d '#' -f 2)
        echo "$key. $MODULE_TITLE"
    done

    if [[ ! "$MENU_OPTIONS_KEYS" -eq 0 ]]; then
        echo
    fi

    if [[ "$CURRENT_MODULE" != "modules" ]]; then
        echo "0. Back"
    else
        echo "0. Exit"
    fi
    echo "$THEMATIC_BREAK"
}

function menu {
    while [[ "$MENU_CHOICE" -ne 0 && "$CURRENT_MODULE" == "modules" || "$CURRENT_MODULE" != "modules" ]] ; do
        clear_buffer
        create_menu_options
        print_menu
        read -erp "Choose option: " MENU_CHOICE

        regex='^[0-9]+$'
        if ! [[ "$MENU_CHOICE" =~ $regex ]]; then
            ((MENU_CHOICE=-1))
            continue
        fi

        if [[ "$MENU_CHOICE" -eq 0 && "$CURRENT_MODULE" != "modules" ]]; then
            CURRENT_MODULE="${PREVIOUS_MODULES[-1]}"
            unset "PREVIOUS_MODULES[-1]"

            NAVBAR="${PREVIOUS_NAVBARS[-1]}"
            unset "PREVIOUS_NAVBARS[-1]"

            ((MENU_CHOICE=-1))
            continue
        fi

        if [[ -n "${MENU_OPTIONS[$MENU_CHOICE]}" ]]; then
            NEXT_MODULE=$(echo "${MENU_OPTIONS[$MENU_CHOICE]}" | cut -d '#' -f 1)
            
            if [[ -d "$NEXT_MODULE" ]]; then
                PREVIOUS_NAVBARS+=("$NAVBAR")
                PREVIOUS_MODULES+=("$CURRENT_MODULE")
                CURRENT_MODULE="$NEXT_MODULE"
                MODULE_TITLE=$(echo "${MENU_OPTIONS[$MENU_CHOICE]}" | cut -d '#' -f 2)
                NAVBAR="$NAVBAR -> $MODULE_TITLE"
            else
                source "$NEXT_MODULE"
                call
            fi
        fi
    done

    exit 0
}

check_modules_directory
menu