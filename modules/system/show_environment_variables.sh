#!/bin/bash

MODULE_TITLE="Show environment variables"

function call {
    clear
    add_to_buffer "Environment variables"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(env)"
    print_buffer
    confirm_save
}