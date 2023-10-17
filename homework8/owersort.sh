#!/bin/bash

username="ekaterina"
source_dir="folder1/"
target_dir="ekaterina/"

find "$source_dir" -type f -user "$username" -exec cp {} "$target_dir" \;