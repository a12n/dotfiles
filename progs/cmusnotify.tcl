#!/usr/bin/env tclsh

set d [dict create {*}$argv]
set status [dict get $d status]
set title [dict get $d title]
exec notify-send "$status" "$title"
