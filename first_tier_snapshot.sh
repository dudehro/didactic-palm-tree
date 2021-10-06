#!/bin/bash
btrfs subvolume snapshot -r /mnt/first_tier/@aktuell/@apps/ /mnt/first_tier/@snapshots/apps/$(date "+%Y_%m_%d")
btrfs subvolume snapshot -r /mnt/first_tier/@aktuell/@bilder/ /mnt/first_tier/@snapshots/bilder/$(date "+%Y_%m_%d")
btrfs subvolume snapshot -r /mnt/first_tier/@aktuell/@mediathek/ /mnt/first_tier/@snapshots/mediathek/$(date "+%Y_%m_%d")

