#! /bin/bash

cat <<EOF > /etc/ssmtp/ssmtp.conf
root=${MAIL_USERNAME}
mailhub=${MAIL_SERVER}
hostname=${HOSTNAME}
AuthUser=${MAIL_USERNAME}
AuthPass=${MAIL_PASSWORD}
UseTLS=YES
EOF

cat <<EOF > /etc/ssmtp/revaliases
root:${MAIL_USERNAME}:${MAIL_SERVER}
EOF

