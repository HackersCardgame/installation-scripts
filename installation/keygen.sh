ssh-keygen -t dsa

echo (ohne Passwort)


cat ~/.ssh/*.pub >> ~/.ssh/authorized_keys


chmod 700 ~/.ssh/authorized_keys


cp /etc/ssh/sshd_config /etc/ssh/sshd_config.old

echo "AuthenticationMethods publickey,password" >> /etc/ssh/sshd_config
