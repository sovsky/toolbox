#!/bin/bash

MODULE_TITLE="Show disk usage"

function call {
    clear
    add_to_buffer "Disk usage"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(df -h)"
    print_buffer
    confirm_save
}