#!/bin/bash

MODULE_TITLE="Show routing table"

function call {
    clear
    add_to_buffer "Routing table"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(ip route)"
    print_buffer
    confirm_save
}