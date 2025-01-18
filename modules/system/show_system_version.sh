#!/bin/bash

MODULE_TITLE="Show system version"

function call {
    clear
    add_to_buffer "System version"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(uname -a)"
    print_buffer
    confirm_save
}