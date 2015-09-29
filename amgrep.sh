#!/bin/bash
# see my first tutorial on reading AM dump http://pastebin.com/UVuEnM2e
# the reason there is md5 grep is for cracking the bcrypt hash
# read http://cynosureprime.blogspot.com/2015/09/how-we-cracked-millions-of-ashley.html
menu(){
echo ""
echo " Ashley Madison's dump grep v0.1 -|- bravewanderer@sigaint.org"
echo ""
echo " put this bash file into the first AM dump's dir"
echo ""
echo "  [1] Email"
echo "  [2] bcrypt"
echo "  [3] MD5"
echo "  [0] exit"
echo ""
echo -n "Select option: "
read an

if [ "$an" = "1" ]; then
        echo -n "enter file location:"
        read lo
        egrep -o "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}\\b" $lo > amemail
        echo "email saved at amemail"
        menu

elif [ "$an" = "2" ]; then
        echo -n "enter file location:"
        read lo
        egrep -o '\$2a\$12\$[./A-Za-z0-9]{53}' $lo > ambcrypt
        echo "email saved at ambcrypt"
        menu

elif [ "$an" = "3" ]; then
        echo -n "enter file location:"
        read lo
        egrep -o '[0-9a-f]\{32\}' $lo > ammd5
        echo "email saved at ammd5"
        menu

elif [ "$an" = "0" ]; then
        exit

else
