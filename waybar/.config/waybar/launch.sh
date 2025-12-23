#!/bin/sh
# this script only works if waybar is managed by uwsm

systemctl --user restart waybar.service
