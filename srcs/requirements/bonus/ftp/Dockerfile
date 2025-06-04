FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    vsftpd \
    openssl \
    && apt-get clean

COPY vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Crée un utilisateur FTP
RUN useradd -m ftpuser && echo "ftpuser:ftp42pass" | chpasswd

# Crée dossier FTP lié au WordPress
RUN mkdir -p /home/ftpuser/ftp && chown ftpuser:ftpuser /home/ftpuser/ftp

EXPOSE 21

ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
