---
name: accessibility-review-defense
description: >
  Prüft Websites und Web-Applikationen (insbesondere React und Angular) auf
  Barrierefreiheit nach WCAG-Standard. Unterstützt zwei Modi: selbstständiger
  Review des aktuellen Codes (Modus A) oder Analyse und Verteidigung eines
  übergebenen Review-Textes (Modus B). Basiert auf den WCAG-Richtlinien aus
  references/accessibility.md.
argument-hint: '(optional) Review-Text als Liste oder Absatz'
user-invocable: true
---

# Accessibility Review & Defense (Skill)

Version: 1.0.0
Last updated: 2026-06-06
Owner: techrockers

## Referenz

Alle Prüfungen basieren auf `references/accessibility.md` (WCAG 2.1 AA als Mindeststandard).
Die Datei vor dem Review vollständig einlesen.

## Ziel

Barrierefreiheits-Probleme in Web-Applikationen frühzeitig erkennen und
beheben, bevor sie Nutzer ausschließen. Der Skill unterstützt zwei Modi:

- **Modus A: Self-Review (ohne Input)** – analysiert den aktuellen Code
- **Modus B: Review-Defense (mit Input-Text)** – bewertet übergebenes Feedback

## Aufruf

- Ohne Parameter: starte Modus A.
- Mit Review-Text (Liste oder Absatz): starte Modus B.

Beispiele für Input (Modus B):

- Liste:
  - "Das alt-Attribut fehlt auf allen Produktbildern."
  - "Die Fokus-Reihenfolge im Modal ist falsch."
- Absatz:
  - "Ich sehe ein Problem mit dem Farbkontrast im Header, der Text ist zu hell."

---

## Modus A: Self-Review (ohne Input)

Arbeite in genau dieser Reihenfolge:

### 1. Kontext erfassen

- Welches Framework wird verwendet? (React / Angular / Vanilla)
- Welche Komponenten/Seiten werden geprüft?
- Gibt es bereits bekannte a11y-Einschränkungen?

### 2. WCAG AA Pflicht-Checkliste prüfen

Jeden Punkt aktiv im Code suchen und bewerten:

**Kontrast & Farbe**
- Textkontrastrate ≥ 4.5:1 (Normaltext) / ≥ 3:1 (Großtext ab 18px)
- UI-Komponenten und grafische Objekte ≥ 3:1
- Farbe niemals als einziges Unterscheidungsmerkmal (Fehler, Status, Pflichtfelder)

**Tastatur & Navigation**
- Alle interaktiven Elemente per Tab erreichbar
- Logische Tab-Reihenfolge (entspricht visueller Reihenfolge)
- Keine Keyboard-Traps
- Sichtbare Focus-Indikatoren (`outline` nicht entfernt ohne Ersatz)
- Skip-Link vorhanden bei wiederholender Navigation

**Semantisches HTML**
- Landmarks korrekt: `<nav>`, `<main>`, `<header>`, `<footer>`
- Überschriften-Hierarchie vollständig (kein Überspringen von Ebenen)
- Native Elemente bevorzugt (`<button>`, `<a>`, `<input>`) statt `<div onclick>`

**Bilder & Icons**
- Informative Bilder: aussagekräftiges `alt`-Attribut
- Dekorative Bilder: `alt=""` (leer, nicht weggelassen)
- Icons ohne sichtbaren Text: `aria-label` oder `<title>` im SVG

**Formulare**
- Jedes `<input>` hat ein assoziiertes `<label>`
- Pflichtfelder: `required` + `aria-required="true"`
- Fehlerhinweise: `aria-invalid="true"` + `aria-describedby` auf Fehlermeldung
- `role="alert"` auf Fehlermeldungen

**Dynamischer Inhalt**
- Ladezustände: `aria-busy`, `aria-live` für Status-Updates
- Modals: Focus-Trap, Escape schließt, Focus kehrt zum Trigger zurück
- Live-Regions korrekt klassifiziert (`polite` vs. `assertive`)

**Touch & Pointer**
- Touch-Targets ≥ 44×44px
- Hover-only-Interaktionen haben Touch/Click-Äquivalent
- Drag-Operationen haben alternativen Klick-Pfad

### 3. Framework-spezifische Checks

#### React

- `onClick` auf `<div>`/`<span>` → stattdessen `<button>` oder `role` + `tabIndex={0}` + `onKeyDown`
- Fehlende `key`-Props in Listen verursachen keine a11y-Probleme direkt, aber inkonsistentes Rendering
- `useRef` für Focus-Management nach State-Änderungen (Modal öffnen/schließen)
- `aria-*`-Props korrekt in camelCase: `aria-label` (Ausnahme: bleibt kebab-case in JSX)
- Conditional Rendering: Screen-Reader-relevante Inhalte nicht per `display:none` verstecken, wenn `aria-hidden` ausreicht

#### Angular

- `[attr.aria-label]` statt `aria-label` für dynamische Werte
- `*ngIf` entfernt Elemente aus DOM (gut für a11y); `[hidden]` versteckt nur visuell
- `CDK FocusTrap` für Modals und Overlays verwenden
- `LiveAnnouncer` (CDK) für dynamische Screen-Reader-Meldungen
- `routerLink` ohne sichtbaren Text braucht `aria-label`
- Template-Expressions in `alt` und `aria-*` auf korrekte Bindings prüfen

### 4. Ergebnisformat

Findings nach Schwere sortiert (hoch → mittel → niedrig):

Pro Finding:
- **Datei / Komponente**
- **WCAG-Kriterium** (z.B. 1.4.3 Contrast Minimum)
- **Problem** (konkret beschrieben)
- **Empfohlene Korrektur** (mit Code-Beispiel wenn hilfreich)

Danach: kurze Zusammenfassung mit Gesamteinschätzung (Level A / AA / AAA konform oder nicht).

---

## Modus B: Review-Defense (mit Input)

Verarbeite **jeden** Feedback-Punkt einzeln und klassifiziere ihn:

- **ACCEPT**: Punkt ist korrekt, echtes a11y-Problem, Änderung notwendig.
- **PARTIAL**: Punkt ist teilweise korrekt; Problem existiert, aber Lösung ist anders oder optionaler.
- **REJECT**: Punkt ist nicht zutreffend, bereits korrekt umgesetzt, oder kein echtes a11y-Problem.

### Bewertungskriterien für REJECT

Ein Feedback-Punkt wird abgelehnt, wenn:
- die beschriebene Änderung keinen WCAG-2.1-AA-Verstoß behebt
- native HTML-Semantik bereits ausreichend ist (First Rule of ARIA)
- der vorgeschlagene Fix ein anderes a11y-Problem erzeugen würde
- es sich um eine persönliche Präferenz handelt, kein Standard

### Für jeden Punkt liefern

1. Einstufung (`ACCEPT` | `PARTIAL` | `REJECT`)
2. WCAG-Referenz (Kriterium + Level), falls zutreffend
3. Technische Begründung (konkret, mit Code-Bezug wenn möglich)
4. Auswirkung auf betroffene Nutzergruppen (Screen-Reader, Tastatur, kognitiv, motorisch)
5. Entscheidung: Änderung nötig — oder bewusst nicht nötig (mit Begründung)

Wenn mindestens ein Punkt `ACCEPT` ist:
- Nenne die minimalen Korrekturen als priorisierten Patch-Plan.
- Reihenfolge: nach Schwere des Ausschlusses für Nutzer.

---

## Pflicht-Checkliste (immer, vor Abschluss)

- [ ] Ist die App vollständig per Tastatur bedienbar?
- [ ] Gibt es keinen Kontrast-Verstoß unter 4.5:1 für Normaltext?
- [ ] Sind alle interaktiven Elemente für Screen-Reader beschriftet?
- [ ] Funktionieren Formulare ohne visuelle Hinweise allein?
- [ ] Sind Fehlermeldungen programmatisch mit dem jeweiligen Input verknüpft?
- [ ] Ist kein interaktiver Inhalt ausschließlich über Hover erreichbar?

---

## Guardrails

- Keine Änderungen an Produktlogik, nur a11y-relevante Korrekturen.
- Kein übermäßiger ARIA-Einsatz wenn natives HTML ausreicht (First Rule of ARIA).
- Nur tatsächliche WCAG-2.1-AA-Verstöße als HIGH klassifizieren.
- AAA-Anforderungen als LOW/Optional kennzeichnen, nicht als Pflicht.
- Wenn unklar: Annahmen explizit benennen und auf WCAG-Kriterium verweisen.

---

## Erwartetes Antwortschema

### 1. Assessment

Kurzfazit in 1-2 Sätzen: Gesamtzustand der Barrierefreiheit.

### 2. Findings (Modus A) / Defense Matrix (Modus B)

**Modus A:**
Liste der Findings, sortiert nach Schwere (hoch → mittel → niedrig).

**Modus B:**
| Feedback | Einstufung | WCAG | Begründung | Action |
|---|---|---|---|---|
| "..." | ACCEPT/PARTIAL/REJECT | 1.4.3 AA | ... | Änderung / keine Änderung |

### 3. Next Step

Entweder: konkreter, priorisierter Patch-Plan mit Code-Beispielen
— oder: "Keine Änderung erforderlich" mit Begründung und verbleibenden Risiken.
