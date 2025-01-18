#!/bin/bash

MODULE_TITLE="Show active connections"

function call {
    clear
    add_to_buffer "Active connections"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(ss -tuln)"
    print_buffer
    confirm_save
}