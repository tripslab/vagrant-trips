#!/usr/bin/expect -f

set password [lindex $argv 0]

spawn jupyter notebook password

set timeout -1

expect "Enter password: "

send -- "$password\r"

expect "Verify password: "

send -- "$password\r"

expect "\[NotebookPasswordApp\] Wrote hashed password to*"

log_file -noappend .jupyter_mode
send_log "enabled"


