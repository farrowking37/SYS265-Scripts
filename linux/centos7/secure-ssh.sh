# SECURE-SSH.SH
# Author Farrowking37
# Createes a new SSH user called $1
# Adds a public key to that users authorized keys file
# Removes roots ability to ssh


# Potential code to create the user with a paramater for name
sudo useradd $1
sudo mkdir /home/$1/.ssh
sudo cp /home/john/SYS265-Scripts/linux/public-keys/sys265.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh

# Use printf to disable permit root login by appending the correct value to end of config
sudo printf '\n%s\n' 'PermitRootLogin no' >>/etc/ssh/sshd_config

# Use printf to enable pubkey authentication by appending the correct value to the end of config
sudo printf '\n%s\n' 'PubkeyAuthentication yes'>>/etc/ssh/sshd_config

# Restart ssh service to keep changes
sudo systemctl restart sshd


