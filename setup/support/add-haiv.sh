# Run these as root user
adduser haiv
usermod -aG sudo haiv
cp -R ~/.ssh ~haiv
chown -R haiv:haiv ~haiv/.ssh

