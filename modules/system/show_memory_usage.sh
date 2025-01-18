#!/bin/bash

MODULE_TITLE="Show memory usage"

function call {
    clear
    add_to_buffer "Memory usage"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(free -h)"
    print_buffer
    confirm_save
}