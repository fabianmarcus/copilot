# Copilot Instructions (CI and Review Mode)

Version: 1.0.0
Last updated: 2026-06-03
Owner: TechRock <dev@techrock.de>

Diese Datei ist die strikte Minimalvariante fuer CI- und Review-Agenten.
Nur Muss-Regeln, keine Erlaeuterungen.

## Scope

- Gilt fuer automatisierte Reviews, PR-Kommentare, CI-nahe Agentenlaeufe und QA-Checks.

## Prioritaet

1. Explizite User-Anweisung.
2. Diese Datei.
3. .github/copilot-instructions.md.
4. Standardverhalten von Copilot.

## Muss-Regeln

- Keine Code-Aenderung bei reinen Fragen.
- Keine Tool-Ausfuehrung ohne explizite Aufforderung.
- Ausnahme nach eigener Code-Aenderung: npm run lint, npm run build und npm run test sind erlaubt.
- Kein Git Commit, kein Push, kein Amend, kein Rebase, kein Reset ohne explizite Aufforderung.
- Git Branches in Englisch benennen.
- Git Commit Messages in Englisch verfassen.
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (<https://www.conventionalcommits.org/>).
- Vor einem Push pruefen, ob die zu pushenden Aenderungen ein Update in README-Dateien oder anderen Dokumentationsdateien erfordern. Falls ja, nicht pushen.
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.
- Vorschlaege kritisch pruefen und Risiken benennen.
- Kein bestaetigender Ton ohne inhaltliche Pruefung.

## Review-Fokus

- Prioritaet auf Bugs, Risiken, Regressionen und fehlende Tests.
- Findings zuerst, nach Schweregrad sortiert.
- Jede Finding mit konkreter Datei und kurzer Begruendung.
- Wenn keine Findings: explizit sagen und Rest-Risiken nennen.

## Qualitaetsregeln fuer Vorschlaege

- TypeScript Clean-Code und SRP einhalten.
- Framework-spezifische Regeln fuer React und Angular werden ueber separate Skills geladen.
- Dokumentationskommentare werden direkt ueber ihrer Funktion platziert, ausser der Kommentar gehoert wirklich an eine andere Stelle.
- Keine Leerzeile zwischen Dokumentationskommentar und Funktionssignatur.
- Je mehr eine Funktion macht, desto detaillierter sollte der Dokumentationskommentar sein. Bei einfachen Funktionen reicht eine kurze Beschreibung.
- Imports werden am Anfang des Moduls platziert, sofern es keinen guten Grund gibt, sie woanders zu platzieren.
- Keine Leerzeilen zwischen Imports, auch nicht, wenn es sich um verschiedene Arten von Imports handelt.
- Imports werden der Zeilenlaenge nach sortiert. Der kuerzeste Import oben, der laengste zum Schluss.
- Mehrzeilige Imports werden unter einzeiligen Imports angesiedelt.
- Interne Funktionen werden unterhalb der exportierten zentralen Funktion definiert.
- TypeScript-Typen mit gleichem Praefix (z.B. PopupEntry, PopupEntryData) werden in einer Datei organisiert, deren Name exakt dem Praefix entspricht (z.B. PopupEntry.ts).
- Bestehende ESLint-, Prettier- und VS-Code-Vorgaben respektieren.
- Wenn ESLint oder Prettier fehlen, explizit darauf hinweisen.
- Code in Englisch, Kommentare in Deutsch.
