#!/bin/bash

MODULE_TITLE="Show CPU info"

function call {
    clear
    add_to_buffer "CPU info"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(lscpu)"
    print_buffer
    confirm_save
}