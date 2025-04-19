FROM almalinux:latest

# Systemd-Unterstützung aktivieren
ENV container docker
RUN dnf -y update && dnf clean all
RUN dnf -y install systemd python3 python3-pip && dnf clean all

# Unnötige systemd-Dienste entfernen
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Arbeitsverzeichnis erstellen
WORKDIR /app

# Python-Skript kopieren
COPY bin/msgrelay.py /app/msgrelay.py

# Systemd-Service einrichten
RUN mkdir -p /etc/systemd/system
COPY msgrelay.service /etc/systemd/system/
RUN systemctl enable msgrelay.service

# Port konfigurieren (falls benötigt)
# EXPOSE 8000

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"] 