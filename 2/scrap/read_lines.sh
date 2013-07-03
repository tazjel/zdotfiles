#!/usr/bin/env bash

string="I'm\nNed\nNederlander
I'm\nLucky\nDay
I'm\nDusty\nBottoms"
doit() {
    arr=()
    while read -r line; do
       arr+=("$line")
    done <<< "$string"
}
doit
