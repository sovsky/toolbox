#!/bin/bash

MODULE_TITLE="Show all groups"

function call {
    clear
    add_to_buffer "All groups"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(cut -d: -f1 /etc/group)"
    print_buffer
    confirm_save
}