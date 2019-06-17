#!/usr/bin/expect -f
set pass [lindex $argv 0]
set server [lindex $argv 1]
set name [lindex $argv 2]
set path [lindex $argv 3]
set port [lindex $argv 4]
set command "ssh";

if { $name ne "" } {
	set command [concat "$command $name@"];
}

if { $server ne "" } {
	set command [concat "$command$server"];
}

if { $port ne "" } {
	set command [concat "$command -p $port"];
}

if { $path ne "" } {
	set command [concat "$command -t \"cd $path; bash\""];
}

spawn bash -c "$command";
if { $pass ne "" } {
	match_max 100000
	expect "*?assword:*"
	send -- "$pass\r"
	send -- "\r"
}
interact