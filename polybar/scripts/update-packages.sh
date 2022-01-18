#!/usr/bin/env bash
# Update any packages and then restart the polybar to pick up changes
package="\033[1;34m\033[0m" 
echo -e "$package \033[1mUpdating packages on \033[1;31m$HOSTNAME\033[0m $package\033[1m...\033[0m"
sudo pacman -Syyu

read -p "Press Enter to continue..."
