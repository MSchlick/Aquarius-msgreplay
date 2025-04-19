# Message Relay Service

Ein Dienst zur Nachrichtenweiterleitung, der als systemd-Service in einem Docker-Container läuft.

## Voraussetzungen

- Docker
- Docker Compose (optional)

## Anwendung starten

Um den Docker-Container zu bauen und zu starten:

```bash
# Container bauen
docker build -t msgrelay .

# Container starten
docker run -d --name msgrelay --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro msgrelay
```

## Logs anzeigen

```bash
# Logs des Containers anzeigen
docker logs -f msgrelay

# Oder direkt die Logs des Services im Container
docker exec msgrelay journalctl -fu msgrelay.service
```

## Service-Status überprüfen

```bash
docker exec msgrelay systemctl status msgrelay.service
```

## Container stoppen und entfernen

```bash
docker stop msgrelay
docker rm msgrelay
``` 