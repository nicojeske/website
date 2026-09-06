# nicojeske.de

Static site source (Hugo). Replaces the previous WordPress install, which was
compromised in 2026-09.

## Develop

```bash
hugo server -D
```

## Build

```bash
hugo --minify
```

Pushing to `main` builds and pushes `ghcr.io/nicojeske/website:latest` via
`.github/workflows/docker-image.yml`. The image is a static build served by
`nginx-unprivileged`; there is no PHP, no database, and no persistent state.

Deployed via ArgoCD from [nicojeske/ArgoCD](https://github.com/nicojeske/ArgoCD), `apps/website/`.
