#!/usr/bin/env bash

string="I'm\nNed\nNederlander \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nLucky\nDay \
I'm\nDusty\nBottoms"

echo "# ## # # # # ## # # # # ## # # # # ## # # # # ## # # # # # # # # #"

doit()
{ arr=(); while read -r line; do arr+=("$line")
    done <<< "$string";
    echo -e "\n$arr"
}

doit

echo "#_# #_# #_# #_# #_# #_##_# #_# #_# #_# #_# #_##_# #_# #_# #_# #_# #"
