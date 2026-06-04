# Copilot Instructions (Detailed)

Version: 1.0.0
Last updated: 2026-04-05
Owner: techrockers

Diese Datei ergaenzt die kurze Team-Version in .github/copilot-instructions.md.
Sie beschreibt die Regeln ausfuehrlicher, inklusive Ziel, Grenzen und praktischer Auslegung.

## 1. Geltungsbereich und Prioritaet

### Ziel

Einheitliche, vorhersagbare Zusammenarbeit mit Copilot im gesamten Repository.

### Prioritaet bei Konflikten

1. Explizite User-Anweisung in der aktuellen Anfrage.
2. .github/copilot-instructions.md (kurze Team-Version).
3. Diese Detaildatei.
4. Standardverhalten von Copilot.

### Fragen vs. Auftraege

Wenn der User eine Frage stellt, ist das keine automatische Aufforderung zu Code-Aenderungen.
In diesem Fall nur Antworttext liefern, ausser der User fordert explizit Umsetzung.

## 2. Terminal- und Tool-Nutzung

### Grundregel

Terminal-Befehle nur auf explizite Nachfrage.

### Erlaubte Ausnahme ohne Rueckfrage

Nach Code-Aenderungen duerfen npm run lint und npm run build ausgefuehrt werden.

### Sicherheitsregel

Datei-loeschende oder stark modifizierende Shell-Befehle nur mit expliziter Freigabe.
Dazu gehoeren insbesondere rekursive Loeschungen, massenhafte Ersetzungen und destructive Git-Kommandos.

## 3. Git-Regeln

### Commit und Push

Nur auf explizite Nachfrage des Users.

### Branches und Commit Messages

- Git Branches in Englisch benennen.
- Git Commit Messages in Englisch verfassen.
- Git Pull Requests werden gesquasht, daher muessen Commit Messages dem Standard von "Conventional Commits" entsprechen (https://www.conventionalcommits.org/).
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (https://www.conventionalcommits.org/).
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.

### Historien-Eingriffe

Kein amend, rebase oder reset ohne explizite User-Anweisung.

## 4. TypeScript-Modulkonventionen

Siehe `.github/skills/typescript-module-conventions/SKILL.md` für alle verbindlichen Regeln zu Struktur, Exporten, Konstanten und Typen.

## 5. Dokumentation, Sprache und Benennung

### Sprache

- Code in Englisch.
- Kommentare in Deutsch.

### Funktionsdokumentation

- Ueber jeder Funktion ein kurzer jsDoc-Block mit:
  - Beschreibung
  - Parameter
  - Return-Wert
- Dokumentationskommentare werden direkt ueber ihrer Funktion platziert, ausser der Kommentar gehoert wirklich an eine andere Stelle.
- Keine Leerzeile zwischen Dokumentationskommentar und Funktionssignatur.
- Je mehr eine Funktion macht, desto detaillierter soll der Dokumentationskommentar sein. Bei einfachen Funktionen reicht eine kurze Beschreibung.

### Benennungsregeln

- Funktionen: lowerCamelCase
- Typen: PascalCase
- Konstanten: UPPER_SNAKE_CASE

## 6. Qualitaet und Stil

- Clean-Code-Patterns anwenden.
- Valides semantisches HTML verwenden.
- Anti-Patterns in TypeScript und Dateistruktur vermeiden.
- Framework-Anti-Patterns vermeiden.
- Clean Code schreiben, der fuer Menschen schnell erfassbar ist.
- Code- und Typ-Zeilen ab einer Komplexitaet von 4 bekommen einen einzeiligen, praegnanten Erklaerkommentar.
- Aehnliche, zusammenhaengende Setup-Zeilen (z.B. mehrere `el.* = ...` / `el.setAttribute(...)`) werden der Zeilenlaenge nach sortiert (kurz → lang), sofern die Reihenfolge keine Rolle spielt.
- Imports werden am Anfang des Moduls platziert, sofern es keinen guten Grund gibt, sie woanders zu platzieren.
- Keine Leerzeilen zwischen Imports, auch nicht, wenn es sich um verschiedene Arten von Imports handelt.
- Imports werden der Zeilenlaenge nach sortiert. Der kuerzeste Import oben, der laengste zum Schluss.
- Mehrzeilige Imports werden unter einzeiligen Imports angesiedelt.
- Bei der Generierung von Code auf Barrierefreiheit achten (ARIA Rules, Screenreader, etc.).
- Referenz fuer Barrierefreiheit: <http://a11ycalendar.kaseybon.com/> (Ziel: standardmaessig Level "A"; "AA" und "AAA", wenn es den Umfang nicht unverhaeltnismaessig erhoeht.)

### React

Siehe `.github/skills/react-rules/SKILL.md` für alle verbindlichen Regeln zu React-Komponenten und Hooks.

### Angular

Siehe `.github/skills/angular-styleguide/SKILL.md` für alle verbindlichen Angular-Styleguide-Regeln.

### CI/CD-Workflow

Siehe `.github/skills/github-actions-ci-workflow/SKILL.md` für verbindliche Regeln zu automatisierten Workflows und CI/CD.

## 7. Antwortverhalten

### Kritisches Feedback

Vorschlaege nicht nur bestaetigen, sondern kritisch pruefen.
Vorteile und Nachteile benennen.

### Transparenz

Wenn etwas nicht umgesetzt werden kann, Grund und Alternative klar nennen.

## 8. Beispiele fuer klare User-Anweisungen

### Umsetzung ausloesen

- "Setze das in src/shared/functions/storage.ts um."
- "Passe den Selector an und fuehre lint/build aus."

### Keine Umsetzung ausloesen

- "Wird aktuell nach updatedAt sortiert?"
- "Welche Optionen haetten wir hier?"

## 9. Empfohlene Pflege

- Kurze Team-Version stabil halten und nur bei Regelentscheidungen aendern.
- Detaildatei fuer Klarstellungen und Beispiele nutzen.
- Bei Regelkonflikten zuerst die Prioritaet in Abschnitt 1 pruefen.
