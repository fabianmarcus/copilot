---
name: implementation-review-defense
description: >
  Führt einen strengen Review bereits implementierter Lösungen durch und kann
  optional übergebenes Feedback gezielt gegen die aktuelle Lösung prüfen und
  verteidigen. Ohne Eingabe läuft ein vollständiger adversarial Self-Review.
argument-hint: '(optional) Feedback als Liste oder Absatz'
user-invocable: true
---

# implementation-review-defense

## Ziel

Frühzeitig relevante Risiken, Regressionen und unklare Annahmen erkennen,
bevor Code gemerged wird. Der Skill unterstützt zwei Modi:

- **Modus A: Standard-Review (ohne Input)**
- **Modus B: Feedback-Verteidigung (mit Input-Feedback)**

## Aufruf

- Ohne Parameter: starte Modus A.
- Mit Feedback-Text (Liste oder Absatz): starte Modus B.

Beispiele für Input:

- Liste:
  - "The workflow depends on file X in tags..."
  - "Path is duplicated in two places..."
- Absatz:
  - "I see a risk that reruns on older tags fail because metadata file may not exist..."

## Modus A: Standard-Review (ohne Input)

Arbeite in genau dieser Reihenfolge:

1. **Lösung und Zielbild erfassen**
- Was wurde geändert?
- Welches Problem soll gelöst werden?
- Welche Nebenbedingungen gelten (CI, Tags, Secrets, Release-Flows)?

2. **Adversarial Self-Review (Pflicht)**
- Suche aktiv mindestens 3 plausible Fehlerszenarien.
- Prüfe explizit:
  - ältere Tags/Commits
  - Re-Runs (`workflow_dispatch`)
  - fehlende Dateien/Inputs/Secrets
  - Cross-Step-Abhängigkeiten
  - unklare Fehlermeldungen

3. **Kompatibilitäts- und Drift-Check**
- Gibt es doppelte Quellen der Wahrheit?
- Sind Pfade/Variablen konsistent (kein stilles Drift-Risiko)?
- Gibt es klare Fallbacks oder deterministic runtime generation?

4. **Ergebnisformat**
- Findings zuerst, nach Schwere sortiert (hoch → mittel → niedrig).
- Pro Finding:
  - betroffene Datei/Step
  - Risiko
  - konkrete Korrektur
- Danach kurz: "Keine Findings" oder "Rest-Risiken".

## Modus B: Feedback-Verteidigung (mit Input)

Verarbeite **jeden** Feedback-Punkt einzeln und klassifiziere ihn:

- **ACCEPT**: Punkt ist korrekt und erfordert Änderung.
- **PARTIAL**: Punkt ist teilweise korrekt; Anpassung optional oder anders.
- **REJECT**: Punkt ist nicht zutreffend oder bereits abgedeckt.

Für jeden Punkt liefern:

1. Einstufung (`ACCEPT` | `PARTIAL` | `REJECT`)
2. Technische Begründung (konkret, keine Floskeln)
3. Auswirkungen auf Robustheit/Betrieb
4. Entscheidung:
- Änderung nötig
- oder bewusst nicht nötig

Wenn mindestens ein Punkt `ACCEPT` ist:

- Nenne die minimalen Änderungen als Patch-Plan.
- Priorisiere nach Risiko.

## Pflicht-Checkliste (immer)

Vor Abschluss immer beantworten:

- Funktioniert die Lösung bei älteren Tags/Refs?
- Ist der Failure-Mode klar und früh genug?
- Gibt es nur eine Quelle der Wahrheit je kritischem Wert?
- Sind PR-Beschreibung und tatsächliche Umsetzung konsistent?
- Sind Secrets/Vars nur dort sichtbar, wo nötig?

## Guardrails

- Keine destruktiven Git-Operationen.
- Keine unnötigen Architektur-Umbauten für kleine Risiken.
- Nur minimale, nachvollziehbare Änderungen vorschlagen.
- Wenn unklar: Annahmen explizit benennen.

## Erwartetes Antwortschema

Nutze dieses kompakte Schema:

1. **Assessment**
- Kurzfazit in 1-2 Sätzen.

2. **Findings**
- Liste der Punkte, sortiert nach Schwere.

3. **Defense Matrix** (nur in Modus B)
- `Feedback` → `ACCEPT/PARTIAL/REJECT` → `Begründung` → `Action`.

4. **Next Step**
- Entweder: konkrete minimale Änderungen
- oder: "keine Änderung erforderlich" mit Rest-Risiko.
