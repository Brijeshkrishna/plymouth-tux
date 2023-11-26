#! /bin/sh

# script to install linux tux plymouth theme


chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo "The installer must be run as root (sudo)."
    exit
  fi
}
chk_root

# check plymouth installed or not
if test -f /usr/bin/plymouth ;then
 	echo -e "\x1b[32m[ + ] \x1b[36mplymouth installed\x1b[0m"
else
 	echo -e "\x1b[32m[ + ] \x1b[34mplymouth not found \x1b[0m"
fi

echo -e "\x1b[32m[ + ] \x1b[36mcopying the theme\x1b[0m"
cp tux /usr/share/plymouth/themes/ -r
echo -e "\x1b[32m[ + ] \x1b[36msetting default plymouth theme\x1b[0m"
plymouth-set-default-theme tux

echo -e "\x1b[32m[ + ] \x1b[36mbuilding intiramfs with tux theme\x1b[0m"
plymouth-set-default-theme -R tux

echo -e "\x1b[32mif it not working check \`splash\` is passed to kernel"
echo -e "you can uninstall plymouth but shutdown splash won't work"
echo -e "thank you for trying tux theme\x1b[0m"
