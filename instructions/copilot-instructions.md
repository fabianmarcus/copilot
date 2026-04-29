# Copilot Instructions fuer dieses Repository

Version: 1.0.0
Last updated: 2026-04-05
Owner: techrockers

Diese Datei ist die kurze, verbindliche Team-Version.
Ausfuehrliche Erlaeuterungen und Beispiele stehen in .github/copilot-instructions.detailed.md.
Fuer CI- und Review-Agenten steht die strikte Minimalvariante in .github/copilot-instructions.ci-review.md.

## Geltungsbereich und Prioritaet

- Diese Vorgaben gelten fuer das gesamte Repository.
- Bei Konflikten gilt folgende Reihenfolge:
  1. Explizite User-Anweisung in der aktuellen Anfrage.
  2. Diese Datei.
  3. Standardverhalten von Copilot.
- Fragen sind keine Handlungsaufforderungen. Bei Fragen nur Antworttext liefern, ohne Code-Aenderungen oder Tool-Ausfuehrung.

## Terminal- und Tool-Nutzung

- Terminal-Befehle nur auf explizite Nachfrage ausfuehren.
- Ausnahme: npm run lint und npm run build duerfen nach Code-Aenderungen ohne Rueckfrage ausgefuehrt werden.
- Datei-loeschende oder stark modifizierende Shell-Befehle nur mit expliziter Freigabe ausfuehren.

## Git-Regeln

- Git Commit und Git Push nur auf explizite Nachfrage ausfuehren.
- Kein Amend, Rebase oder Reset ohne explizite User-Anweisung.
- Git Branches in Englisch benennen.
- Git Commit Messages in Englisch verfassen.
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (https://www.conventionalcommits.org/).
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.

## TypeScript-Modulkonventionen

Siehe `.github/skills/typescript-module-conventions/SKILL.md` für alle verbindlichen Regeln zu Struktur, Exporten, Konstanten und Typen.

## Dokumentation, Sprache und Benennung

- Ueber jeder Funktion einen praegnanten Dokumentationskommentar schreiben mit:
  - Beschreibung
  - Parameter
  - Return-Wert
- Dokumentationskommentare werden direkt ueber ihrer Funktion platziert, ausser der Kommentar gehoert wirklich an eine andere Stelle.
- Keine Leerzeile zwischen Dokumentationskommentar und Funktionssignatur.
- Je mehr eine Funktion macht, desto detaillierter sollte der Dokumentationskommentar sein. Bei einfachen Funktionen reicht eine kurze Beschreibung.
- Code in Englisch schreiben.
- Kommentare in Deutsch schreiben.
- Geltende Benennungsregeln einhalten:
  - Funktionen mit kleinem Anfangsbuchstaben
  - Typen mit grossem Anfangsbuchstaben
  - Konstanten in Grossschreibung

## Qualitaet und Stil

- Clean-Code-Patterns verwenden und Anti-Patterns vermeiden.
- Valides semantisches HTML verwenden.
- Clean Code schreiben, der fuer Menschen schnell erfassbar ist.
- Code- und Typ-Zeilen ab einer Komplexitaet von 4 bekommen einen einzeiligen, praegnanten Erklaerkommentar.
- Aehnliche, zusammenhaengende Setup-Zeilen (z.B. mehrere `el.* = ...` / `el.setAttribute(...)`) werden der Zeilenlaenge nach sortiert (kurz → lang), sofern die Reihenfolge keine Rolle spielt.
- Imports werden am Anfang des Moduls platziert, sofern es keinen guten Grund gibt, sie woanders zu platzieren.
- Keine Leerzeilen zwischen Imports, auch nicht, wenn es sich um verschiedene Arten von Imports handelt.
- Imports werden der Zeilenlaenge nach sortiert. Der kuerzeste Import oben, der laengste zum Schluss.
- Mehrzeilige Imports werden unter einzeiligen Imports angesiedelt.
- Vorhandene ESLint-, Prettier- und VS-Code-Vorgaben einhalten.
- Falls keine ESLint- oder Prettier-Regeln vorhanden sind, dies aktiv in der Antwort erwaehnen.
- Unnoetigen Whitespace und unnoetige Leerzeilen im Code vermeiden.
- Bei der Generierung von Code auf Barrierefreiheit achten (ARIA Rules, Screenreader, etc.).
- Referenz fuer Barrierefreiheit: http://a11ycalendar.kaseybon.com/ (Ziel: standardmaessig Level "A"; "AA" und "AAA", wenn es den Umfang nicht unverhaeltnismaessig erhoeht.)

### React

Siehe `.github/skills/react-rules/SKILL.md` für alle verbindlichen Regeln zu React-Komponenten und Hooks.

### Angular

Siehe `.github/skills/angular-styleguide/SKILL.md` für alle verbindlichen Angular-Styleguide-Regeln.

### CI/CD-Workflow

Siehe `.github/skills/github-actions-ci-workflow/SKILL.md` für verbindliche Regeln zu automatisierten Workflows und CI/CD.

## Antwortverhalten

- Vorschlaege kritisch pruefen.
- Vorteile und Nachteile klar benennen, statt nur zu bestaetigen.
