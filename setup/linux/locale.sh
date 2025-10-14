sudo sed 's/#\s*vi_VN/vi_VN/;s/#\s*en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen  > /tmp/locale.gen
sudo cp /tmp/locale.gen /etc/locale.gen
sudo locale-gen
