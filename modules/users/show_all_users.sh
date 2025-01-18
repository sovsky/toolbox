#!/bin/bash

MODULE_TITLE="Show all users"

function call {
    clear
    add_to_buffer "All users"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(cut -d: -f1 /etc/passwd)"
    print_buffer
    confirm_save
}