#!/bin/bash
pacmd list-sources | grep -e 'index:' -e device.string -e 'name:' -e 'card_name'
