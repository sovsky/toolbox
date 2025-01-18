#!/bin/bash

MODULE_TITLE="Show network interfaces"

function call {
    clear
    add_to_buffer "Network Interfaces"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(ip link show)"
    print_buffer
    confirm_save
}