#!/bin/bash

MODULE_TITLE="Add group (requires root)"

function call {
    clear
    check_user_is_root || return 1

    read -erp "Enter group to add: " groupname

    if ! getent group "$groupname" > /dev/null; then
        add_to_buffer "Group '$groupname' already exists."
        print_buffer
        press_any_key_to_continue
        return 1
    fi

    add_to_buffer "Adding group '$groupname'"
    add_to_buffer "$THEMATIC_BREAK"
    groupadd "$groupname"
    add_to_buffer "Group '$groupname' added."
    print_buffer
    confirm_save
}