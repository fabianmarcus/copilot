---
name: extension-release
description: >
  Führt einen Release für dieses Browser-Extension-Repo zuverlässig durch.
  Nutzt den bestehenden Flow aus release-please (Version/Changelog/Tag) und dem
  GitHub Actions Workflow `.github/workflows/release.yml` (Build, ZIP-Artefakte,
  GitHub Release Upload, optionales Publishing zu Chrome Web Store / AMO / Edge).
  Verwende diesen Skill, wenn du eine neue Version veröffentlichen willst.
argument-hint: '[version|tag] (optional, z.B. 1.2.3 oder v1.2.3)'
user-invocable: true
disable-model-invocation: true
---

# Browser Extension Release into Web Stores (Skill)

## Ziel

Einen neuen Release (z.B. `v1.0.2`) **konsistent** veröffentlichen, mit:

- synchroner Version in `package.json` und `manifest.config.ts`
- ZIP-Artefakten für Stores (Chromium + Firefox)
- Upload der Artefakte zum GitHub Release
- optionalem Publishing zu:
  - Chrome Web Store
  - Firefox Add-ons (AMO)
  - Microsoft Edge Add-ons

## Dieser Repo-Flow (Ist-Zustand)

- Versionierung/Changelog/Tagging: `Release Please` Workflow
  - `.github/workflows/release-please.yml`
  - `.release-please-config.json` (inkl. `extra-files: manifest.config.ts`)
  - `.release-please-manifest.json`
- Build/Packaging/Upload/Publish: `Release` Workflow
  - `.github/workflows/release.yml`
  - Trigger:
    - `push` auf Tags `v*`
    - oder `workflow_dispatch` mit Input `tag`
  - Validiert, dass Tag-Version == `package.json.version` == `manifest.config.ts` Version

## Nicht-Ziele

- Keine Änderungen an Produktlogik.
- Kein manuelles Editieren von Build-Outputs (`dist-*`).

## Vorbedingungen / Preflight

Vor dem Release prüfen (und bei Problemen stoppen):

1. **CI ist grün**

- Letzte Commits auf `main` sind grün (Lint/Typecheck/Build).

2. **Release-please ist korrekt konfiguriert**

- PR-Titel folgen Conventional Commits (wichtig, weil release-please daraus Changelog/Version ableitet).

3. **Artefaktnamen sind konsistent**

- In `package.json` heißen die ZIP-Artefakte aktuell:
  - `immo-favoriten-chromium.zip`
  - `immo-favoriten-firefox.zip`
- In `.github/workflows/release.yml` werden genau diese Namen hochgeladen/published.

Wenn du dieses Repo als Starter für andere Extensions nutzt: Stelle sicher, dass ZIP-Namen
in `package.json` und `.github/workflows/release.yml` zusammenpassen.

## Release-Strategie (empfohlen)

### Option A (empfohlen): Release-Please erzeugt Tag automatisch

1. Stelle sicher, dass alle gewünschten Changes in `main` sind.
2. Warte, bis release-please einen Release-PR erstellt/aktualisiert.
3. Prüfe im Release-PR:
   - Version bump
   - `CHANGELOG.md`
   - `package.json` Version
   - `manifest.config.ts` Version
4. Merge den Release-PR.
5. Erwartetes Ergebnis:
   - Tag `vX.Y.Z` wird erstellt
   - GitHub Release wird ggf. erstellt
   - Dadurch triggert `.github/workflows/release.yml` automatisch.

### Option B: Release Workflow manuell starten (workflow_dispatch)

Nutze das nur, wenn du **bereits** ein Tag hast oder bewusst ein bestimmtes Tag releasen willst.

- Starte `Release` per `workflow_dispatch`.
- Input `tag`: z.B. `v1.0.1`
- Optional Inputs setzen:
  - `publishChrome`: true/false
  - `publishFirefox`: true/false
  - `publishEdge`: true/false

Wichtig: Der Workflow checkt den Code exakt zum angegebenen Tag aus und bricht ab,
wenn Versionsstrings nicht zum Tag passen.

## Store-Publishing (optional)

Der Workflow published nur, wenn die jeweiligen Secrets gesetzt sind (und bei `workflow_dispatch`
zusätzlich der entsprechende Publish-Input auf `true` steht).

### Chrome Web Store

Benötigte Secrets (Repo Settings → Secrets and variables → Actions):

- `CHROME_EXTENSION_ID`
- `CHROME_CLIENT_ID`
- `CHROME_CLIENT_SECRET`
- `CHROME_REFRESH_TOKEN`

### Firefox AMO

Benötigte Secrets:

- `AMO_SIGN_KEY`
- `AMO_SIGN_SECRET`

Zusätzlich (für Builds / Manifest):

- Secret: `FIREFOX_EXTENSION_ID` (oder lokal `.env`)
- Variable: `FIREFOX_MIN_VERSION` (Actions variable, optional)

### Edge Add-ons

Benötigte Secrets:

- `EDGE_PRODUCT_ID`
- `EDGE_CLIENT_ID`
- `EDGE_API_KEY`

## Lokale Verifikation (empfohlen, bevor du release-please merge‘st)

Führe lokal mindestens aus:

- `npm ci` (oder `npm install`)
- `npm run lint`
- `npm run typecheck`
- `npm run package:chromium`
- `npm run package:firefox`

Erwartetes Ergebnis:

- ZIP-Dateien existieren im Repo-Root (siehe `package.json` Scripts)

## Nach dem Release: Validierung

Nach erfolgreichem Workflow-Lauf prüfen:

1. **GitHub Release Assets**

- Im GitHub Release zu `vX.Y.Z` liegen beide ZIPs.

2. **Store Uploads** (nur wenn aktiviert)

- Chrome Web Store: Upload erfolgreich
- AMO: Signing erfolgreich
- Edge: Upload + Publish Operation erfolgreich

3. **Versionen**

- `package.json` und `manifest.config.ts` zeigen dieselbe Version (ohne `v`).

## Häufige Fehler / Troubleshooting

- **Workflow bricht ab: Version mismatch**
  - Fix: `package.json.version` und `manifest.config.ts` Version müssen exakt dem Tag ohne `v` entsprechen.
- **Assets fehlen im Release**
  - Prüfe, ob die ZIP-Namen in `package.json` und `.github/workflows/release.yml` identisch sind.
- **Publishing wird übersprungen**
  - Secrets fehlen oder `workflow_dispatch` Publish-Input steht auf `false`.

## Guardrails

- Keine Secrets in Dateien committen.
- Keine Änderungen in `dist-*` einchecken.
- Release nur von Tags `v*` und nur mit synchronen Versionsstrings.
