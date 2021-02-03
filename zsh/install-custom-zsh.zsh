#!/bin/zsh
cp /home/$USER/.zshrc /home/$USER/.zshrc_bak
rm /home/$USER/.zshrc
ln -s /home/$USER/projects/dev-environment/zsh/.zshrc /home/$USER/.zshrc

if grep -q "syndaemon" "/home/$USER/.profile";
then
    echo "syndaemon entry already in .profile";
else
    echo "##### CUSTOM STUFF \nsyndaemon -i 0.3 -K -R -d" >> /home/$USER/.profile;
fi

