# This batch script is free to use and distribute. By using this script you
# accept responsibility for any results. Use at your own risk.
#
# This is a simple Windows batch file that will take a list of IP addresses and
# perform an NSLOOKUP to determine the hostname. It will then write the results
# to a text file called "results-names.txt".
#
# Requirement:
# hostnames.txt - list of IP addresses to resolve. 1 IP address per line.

#@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%a in (hostnames.txt) do (
    set "ip="
    for /f "tokens=2 delims= " %%b in ('nslookup %%a ^| findstr "Address:"') do (
        set "ip=%%b"
    )
    if not defined ip (
        echo %%a not found >> results-names.txt
    ) else (
        echo %%a - !ip! >> results-names.txt
    )
)
