#!/bin/bash

MODULE_TITLE="Show OS version"

function call {
    clear
    add_to_buffer "OS version"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(cat /etc/os-release)"
    print_buffer
    confirm_save
}