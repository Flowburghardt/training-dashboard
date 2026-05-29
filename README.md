# Training Dashboard

Personal Trainings-Dashboard für Florian — 5-Säulen-Modell adaptiert aus Bryan Johnson Blueprint.

**Live:** https://training.brghrdt.dev (Basic-Auth)

## Stack

- Single-file HTML + localStorage
- nginx:alpine im Docker-Container
- Basic-Auth via nginx (`.htpasswd`)
- Auto-Deploy via Coolify auf Prime-VDS bei jedem Push auf `main`

## Lokal testen

```bash
docker build -t training .
docker run --rm -p 8080:80 training
# http://localhost:8080 (User aus .htpasswd)
```

## Struktur

```
.
├── index.html                  Single-File Dashboard
├── assets/exercises/*.png      10 Übungs-Illustrationen (Pine Line-Drawings)
├── Dockerfile                  nginx:alpine
├── nginx.conf                  Server-Config + BasicAuth
├── .htpasswd                   User-Hashes (lokal generiert, NICHT committen)
└── README.md
```

## .htpasswd

```bash
# Erstellen (einmal)
htpasswd -c .htpasswd florian
# Weitere User hinzufügen
htpasswd .htpasswd <user>
```

## Deploy

Push auf `main` → Coolify auto-deployed via GitHub Webhook.

Manual: `mcp__coolify-mcp__deploy --uuid <app-uuid>`

## Source

Generiert aus `07-Personal/Health-Food/Trainings-Dashboard.html` im Vault `Projekte-CC-OB`. Updates am Vault-File werden manuell hier synchronisiert.
