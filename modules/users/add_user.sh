#!/bin/bash

MODULE_TITLE="Add user (requires root)"

function call {
    clear
    check_user_is_root || return 1

    read -erp "Enter username to add: " username

    if ! getent passwd "$username" > /dev/null; then
        add_to_buffer "User '$username' already exists."
        print_buffer
        press_any_key_to_continue
        return 1
    fi

    add_to_buffer "Adding user '$username'"
    add_to_buffer "$THEMATIC_BREAK"
    useradd -m "$username"
    add_to_buffer "User '$username' added."
    print_buffer
    confirm_save
}