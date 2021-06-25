#!/bin/bash
#source "./functions.sh"
set +e

echo "###################################################"
echo "#### It is running base.sh provisioning script ####"
echo "###################################################"
sleep 1
######## VARIABLES ###################

###################################################################################################
################################### FUNCTIONS START ###############################################
###################################################################################################

update_server() {
  echo "Running system update"
  yum update -y
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
     echo "System has been updated. Current version of $(uname -s) is $(uname -v) and release is $(uname -r)"
  else
     echo "System has been not updated. Current version of $(uname -s) is $(uname -v) and release is $(uname -r)"
  fi
}

install_packages() {
  echo "installing $@ applications"
  yum install -y $@
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
     echo "Following applications are successfully installed $@"
  else
     echo "Applications are not installed"
  fi
}

erase_packages() {
  yum erase -y $@
}

piping_packages() {
  pip install 
}

enforce_selinux() {
  cp /etc/selinux/config /etc/selinux/config_bckp
  echo " " > /etc/selinux/config
  echo "SELINUX=disabled" >> /etc/selinux/config
  echo "SELINUXTYPE=targeted" >> /etc/selinux/config
}

generate_hosts_file() {
  cat > /etc/hosts <<'EOF'
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

EOF
echo "/etc/hosts File is generated sucessfully"
}


update_sshd_config(){
  sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  systemctl restart sshd
}

##################################################################################################
################################### FUNCTIONS FINISHED ###########################################
##################################################################################################
#not important packages: expect-5.45-14.el7_1.x86_64

# install_packages vim telnet ntp ntpdate traceroute zip unzip tcpdump bind-utils net-tools dos2unix git
install_packages vim telnet traceroute zip unzip tcpdump bind-utils net-tools dos2unix git wget
sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
update_sshd_config
enforce_selinux
update_server
generate_hosts_file