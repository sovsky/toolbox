#!/bin/bash

MODULE_TITLE="Show mounted filesystems"

function call {
    clear
    add_to_buffer "Mounted filesystems"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(mount)"
    print_buffer
    confirm_save
}