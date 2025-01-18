#!/bin/bash

MODULE_TITLE="Show services"

function call {
    clear
    add_to_buffer "Services"
    add_to_buffer "$THEMATIC_BREAK"
    add_to_buffer "$(systemctl list-units --type=service)"
    print_buffer
    confirm_save
}