# Copilot Instructions (Detailed)

Version: 1.0.0
Last updated: 2026-06-03
Owner: TechRock <dev@techrock.de>

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

Nach Code-Aenderungen duerfen npm run lint, npm run build und npm run test ausgefuehrt werden.

### Sicherheitsregel

Datei-loeschende oder stark modifizierende Shell-Befehle nur mit expliziter Freigabe.
Dazu gehoeren insbesondere rekursive Loeschungen, massenhafte Ersetzungen und destructive Git-Kommandos.

## 3. Git-Regeln

### Commit und Push

Nur auf explizite Nachfrage des Users.

### Branches und Commit Messages

- Git Branches in Englisch benennen.
- Git Commit Messages in Englisch verfassen.
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (<https://www.conventionalcommits.org/>).
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.

### Push-Vorbedingungen

- Vor einem Push den Doku-Impact der zu pushenden Aenderungen pruefen.
- Fuer den konkreten Pruefablauf kann bei Bedarf der Skill `push-documentation-check` verwendet werden.
- Wenn ein Dokumentations-Update fachlich notwendig ist, nicht pushen, bevor die Dokumentation aktualisiert wurde.

### Historien-Eingriffe

Kein amend, rebase oder reset ohne explizite User-Anweisung.

## 4. Code-Struktur fuer TypeScript

### Modulprinzip

- Module haben eine klar umrissene Verantwortung.
- Funktionen haben genau eine Hauptaufgabe (SRP).

### Exportstruktur

- Ein Modul hat eine zentrale Exportfunktion als Einstieg.
- Dateiname entspricht exakt der zentralen Exportfunktion.
- Die zentrale Exportfunktion wird zusaetzlich als default export bereitgestellt.
- Interne Hilfsfunktionen ohne Export sind erlaubt.
- Interne Funktionen werden unterhalb der exportierten zentralen Funktion definiert.
- Die zentrale Exportfunktion wird visuell durch einen Divider von internen Funktionen getrennt: `//--- Interne Modul Funktionen ---`

### Ablageorte

- Wiederverwendbare Exportfunktionen in /shared.
- Semantische Unterordner verwenden, z.B. DOM, Storage, UI, Enhancer, Page, Validation.

### Konstanten

- Konstanten in shared/constants.ts sammeln.
- Semantisch gruppieren und mit konsistenten Praefixen benennen.
- Magische Werte in Funktionen vermeiden.

### Typen

- Typen in shared/types organisieren.
- Pro Typ eine Datei.
- Dateiname entspricht exakt dem Typnamen.
- TypeScript-Typen mit gleichem Praefix (z.B. PopupEntry, PopupEntryData) werden in einer Datei organisiert, deren Name exakt dem Praefix entspricht (z.B. PopupEntry.ts).
- Ueber jedem Typ einen JSDoc-Kommentar mit Zweck und Verwendung.

### Migrationsgrenze

Regeln gelten vor allem fuer neue oder refaktorierte Artefakte.
Keine grossflaechige Umstrukturierung ohne fachlichen Anlass.

## 5. Dokumentation, Sprache und Benennung

### Sprache

- Code in Englisch.
- Kommentare in Deutsch.

### Funktions- und Typdokumentation

- Ueber jeder Funktion ein kurzer Doku-Block mit:
  - Beschreibung
  - Parameter
  - Return-Wert
- Jede Funktion bekommt einen JSDoc-Kommentar, der Zweck und Verwendung der Funktion beschreibt.
- Jeder TypeScript-Typ bekommt einen JSDoc-Kommentar, der Zweck und Verwendung des Typs beschreibt.
- Dokumentationskommentare werden direkt ueber ihrer Funktion bzw. ihrem Typ platziert, ausser der Kommentar gehoert wirklich an eine andere Stelle.
- Keine Leerzeile zwischen Dokumentationskommentar und Funktionssignatur bzw. Typdefinition.
- Je mehr eine Funktion macht, desto detaillierter soll der Dokumentationskommentar sein. Bei einfachen Funktionen reicht eine kurze Beschreibung.

### Benennungsregeln

- Funktionen: lowerCamelCase
- Typen: PascalCase
- Konstanten: UPPER_SNAKE_CASE

## 6. Qualitaet und Stil

### Allgemein

- Clean-Code-Patterns anwenden.
- Valides semantisches HTML verwenden.
- Anti-Patterns in TypeScript und Dateistruktur vermeiden.
- Framework-spezifische Regeln fuer React und Angular werden ueber separate Skills geladen.
- Clean Code schreiben, der fuer Menschen schnell erfassbar ist.
- Code- und Typ-Zeilen ab einer Komplexitaet von 4 bekommen einen einzeiligen, praegnanten Erklaerkommentar.
- Aehnliche, zusammenhaengende Setup-Zeilen (z.B. mehrere `el.* = ...` / `el.setAttribute(...)`) werden der Zeilenlaenge nach sortiert (kurz → lang), sofern die Reihenfolge keine Rolle spielt. Andernfalls semantisch gruppieren und die Abhaengigkeit mit einem kurzen Kommentar begruenden.
- Imports werden am Anfang des Moduls platziert, sofern es keinen guten Grund gibt, sie woanders zu platzieren.
- Keine Leerzeilen zwischen Imports, auch nicht, wenn es sich um verschiedene Arten von Imports handelt.
- Imports werden der Zeilenlaenge nach sortiert. Der kuerzeste Import oben, der laengste zum Schluss.
- Mehrzeilige Imports werden unter einzeiligen Imports angesiedelt.
- Bei der Generierung von Code auf Barrierefreiheit achten (ARIA Rules, Screenreader, etc.).
- Referenz fuer Barrierefreiheit: <http://a11ycalendar.kaseybon.com/> (Ziel: standardmaessig Level "A"; "AA" und "AAA", wenn es den Umfang nicht unverhaeltnismaessig erhoeht.)

### Tooling

- ESLint-, Prettier- und VS-Code-Vorgaben einhalten, wenn vorhanden.
- Wenn ESLint oder Prettier fehlen, in der Antwort explizit darauf hinweisen.

### Formatierung

Unnoetigen Whitespace und unnoetige Leerzeilen vermeiden.

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
