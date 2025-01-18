#!/bin/bash

MODULE_TITLE="Show system logs"

function call {
    clear
    add_to_buffer "System logs"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(cat /var/log/syslog)"
    print_buffer
    confirm_save
}