#!/bin/bash
pacmd list-sinks | grep -e 'index:' -e device.string -e 'name:' -e 'card_name'
