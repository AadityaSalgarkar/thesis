#!/bin/bash 

# This script joins the files seperate_pg_0001, 2 ,3 4 and main.pdf to one file 


# join the files

pdftk separate_pg_0001.pdf separate_pg_0002.pdf main.pdf cat output final.pdf

evince final.pdf &
