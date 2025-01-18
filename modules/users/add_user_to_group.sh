#!/bin/bash

MODULE_TITLE="Add user to group (requires root)"

function call {
    clear
    check_user_is_root || return 1

    read -erp "Enter username to add to group: " username
    read -erp "Enter group name: " groupname

    if ! getent passwd "$username" > /dev/null; then
        add_to_buffer "User '$username' does not exist."
        print_buffer
        press_any_key_to_continue
        return 1
    fi

    if ! getent group "$groupname" > /dev/null; then
        add_to_buffer "Group '$groupname' does not exist."
        print_buffer
        press_any_key_to_continue
        return 1
    fi

    add_to_buffer "Adding user '$username' to group '$groupname'"
    add_to_buffer "$THEMATIC_BREAK"
    usermod -aG "$groupname" "$username"
    add_to_buffer "User '$username' added to group '$groupname'."
    print_buffer
    confirm_save
}