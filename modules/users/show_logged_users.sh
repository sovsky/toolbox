#!/bin/bash

MODULE_TITLE="Show logged users"

function call {
    clear
    add_to_buffer "Logged users"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(who)"
    print_buffer
    confirm_save
}