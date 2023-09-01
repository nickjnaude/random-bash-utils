#!/bin/bash

function main() {
    if [[ $# -ne 2 ]]; then
        echo "Not enough parameters. Please provide \"filename\" and \"port\""
        exit 1
    fi

    if [[ ! -e "$1" ]]; then
        echo "File \"$1\" not found. Exiting...."
        exit 1
    fi

    echo "Serving file \"$1\" on port \"8080\""
    (
        echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < "$1")\r\n\r\n";
    	cat "$1";
    ) | nc -l "$2"
}

main $@
