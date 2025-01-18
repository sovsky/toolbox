#!/bin/bash

MODULE_TITLE="Show running processes"

function call {
    clear
    add_to_buffer "Running processes"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(ps aux)"
    print_buffer
    confirm_save
}