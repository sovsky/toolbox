#!/bin/bash

MODULE_TITLE="Show last logins"

function call {
    clear
    add_to_buffer "Last logins"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(last)"
    print_buffer
    confirm_save
}