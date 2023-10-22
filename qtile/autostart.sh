#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# TODO: run_once


function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}


run setxkbmap br 
run /home/gargula/dotfiles/bin/nvidia-fan.sh &
run copyq --start-server
run picom -CGb &
run nitrogen --restore & 
run /usr/lib/polkit-kde-authentication-agent-1 &
run dunst 
run insync start &
run blueman-applet &

