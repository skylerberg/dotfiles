#!/bin/sh

grep ^[^#] .bash_eternal_history | sort | sed "s/ .*//" | uniq -c | sed "s/^ *//" | sort -V
