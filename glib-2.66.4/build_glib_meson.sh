#!/bin/bash

# . ../env.sh
meson release -Ddefault_library=static --cross-file  cross_file.txt
