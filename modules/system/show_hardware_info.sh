#!/bin/bash

MODULE_TITLE="Show harwadre info"

function call {
    clear
    add_to_buffer "Hardware info"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(lshw)"
    print_buffer
    confirm_save
}