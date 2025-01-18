#!/bin/bash

MODULE_TITLE="Show user details"

function call {
    clear
    read -erp "Enter username: " username

    if ! getent passwd "$username" > /dev/null ; then
        add_to_buffer "User '$username' does not exist."
        print_buffer
        press_any_key_to_continue
    else
        add_to_buffer "User '$username' details"
        add_to_buffer "$THEMATIC_BREAK"
        add_to_buffer "Last login: $(lastlog -u "$username")"
        add_to_buffer "User ID: $(id -u "$username")"
        add_to_buffer "Group ID: $(id -g "$username")"
        add_to_buffer "Groups: $(id -Gn "$username")"
        add_to_buffer "Home directory: $(getent passwd "$username" | cut -d: -f6)"
        add_to_buffer "Shell: $(getent passwd "$username" | cut -d: -f7)"  
        print_buffer
        confirm_save
    fi
}