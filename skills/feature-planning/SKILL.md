---
name: feature-planning
description: >
  Erstellt einen strukturierten Feature-Plan als geordnete Einheitenliste.
  Jede Einheit ist eigenständig umsetzbar, durch einen Anwender testbar und
  wird in einer eigenen Datei abgelegt. Berücksichtigt die bestehenden
  Code-Struktur- und Testing-Regeln des Projekts.
argument-hint: 'Feature-Beschreibung oder Anforderungstext'
user-invocable: true
---

# Feature Planning (Skill)

Version: 1.0.0
Last updated: 2026-06-13
Owner: techrockers

## Ziel

Einen Feature-Wunsch oder eine Anforderung in einen konkreten, umsetzbaren
Plan überführen. Der Plan besteht aus nummerierten Einheiten, die aufeinander
aufbauen und einzeln eingecheckt werden können.

## Aufruf

Mit Feature-Beschreibung oder Anforderungstext als Argument.

Beispiele:
- "Plane die Einführung von Drag & Drop für Kategorien."
- "Erstelle einen Plan für das neue Filterfeature."

---

## Ablauf

Arbeite in genau dieser Reihenfolge:

### 1. Kontext erheben

- Lies die relevanten Bereiche der bestehenden Code-Basis, die vom Feature
  betroffen sind.
- Prüfe die vorhandenen Typen, Module und Tests, die als Basis dienen.
- Verschaffe dir ein Bild des aktuellen Stands, bevor du planst.

### 2. Einheiten schneiden

Zerlege das Feature in aufeinander aufbauende Einheiten nach diesen Kriterien:

- Jede Einheit hat einen klar definierten Scope.
- Jede Einheit ist nach ihrer Umsetzung durch einen Anwender testbar.
- Nach jeder Einheit kann ein funktionierender Stand in Git eingecheckt werden.
- Pro Einheit wird nur so viel umgesetzt wie nötig, um die Funktionalität
  zu erweitern; dabei sollen möglichst wenige Dateien geändert werden.

### 3. Einheiten mit den Instructions abgleichen

- Struktur und Benennung der geplanten Module nach den Code-Struktur-Regeln
  aus den Copilot Instructions ausrichten.
- Jede Einheit enthält die zugehörigen Tests gemäß den Unit-Testing-Regeln.
- Sicherstellen, dass der entstehende Code für Menschen leicht erfassbar und
  reviewbar ist.

### 4. Planeinheiten ausgeben

Für jede Einheit ausgeben:

```
## [Nummer] [Prägnante Feature-Beschreibung]

**Ziel:** Was wird umgesetzt und welchen Zustand erreicht das System danach?

**Dateien:**
- `pfad/zur/datei.ts` – was wird hier geändert oder neu angelegt
- `tests/pfad/datei.test.ts` – welche Tests werden geschrieben

**Testbarkeit:** Wie kann ein Anwender prüfen, dass die Einheit korrekt funktioniert?
```

### 5. Planeinheiten als Dateien ablegen

- Jede Einheit in einer eigenen Datei ablegen.
- Dateiname: Nummerierung + prägnante Feature-Beschreibung in kebab-case,
  z.B. `01-kategorie-verwaltung.md`.
- Ablageort: `plans/` im Projekt-Root (Ordner anlegen falls nicht vorhanden).
- In Git Commits wird der Name der Plandatei im beschreibenden Teil der
  Commit Message hinterlegt, z.B.:
  `feat: add category drag handle (01-kategorie-drag-drop)`
