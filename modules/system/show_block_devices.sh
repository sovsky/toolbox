#!/bin/bash

MODULE_TITLE="Show block devices"

function call {
    clear
    add_to_buffer "Block devices"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(lsblk)"
    print_buffer
    confirm_save
}