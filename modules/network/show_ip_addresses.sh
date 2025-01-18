#!/bin/bash

MODULE_TITLE="Show IP addresses"

function call {
    clear
    add_to_buffer "IP addresses"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(ip addr)"
    print_buffer
    confirm_save
}