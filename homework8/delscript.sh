#!/bin/bash

directory=$1

if [ -d $directory ]
        then
                find "$directory" -type f \( -name "*.bak" -o -name "*.tmp" -o -name "*.bakup" \) -delete
                echo "Файлы с расширениями .bak, .tmp и .backup удалены из директории $directory"
        else
                echo "Error папка не существует!"
fi
