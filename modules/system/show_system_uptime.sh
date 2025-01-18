#!/bin/bash

MODULE_TITLE="Show system uptime"

function call {
    clear
    add_to_buffer "System uptime"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(uptime)"
    print_buffer
    confirm_save
}