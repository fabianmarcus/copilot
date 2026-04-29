# Copilot Instructions (CI and Review Mode)

Version: 1.0.0
Last updated: 2026-04-05
Owner: techrockers

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
- Ausnahme nach eigener Code-Aenderung: npm run lint und npm run build sind erlaubt.
- Kein Git Commit, kein Push, kein Amend, kein Rebase, kein Reset ohne explizite Aufforderung.
- Git Branches in Englisch benennen.
- Git Commit Messages in Englisch verfassen.
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (https://www.conventionalcommits.org/).
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.
- Vorschlaege kritisch pruefen und Risiken benennen.
- Kein bestaetigender Ton ohne inhaltliche Pruefung.

## Review-Fokus

- Prioritaet auf Bugs, Risiken, Regressionen und fehlende Tests.
- Findings zuerst, nach Schweregrad sortiert.
- Jede Finding mit konkreter Datei und kurzer Begruendung.
- Wenn keine Findings: explizit sagen und Rest-Risiken nennen.

## Qualitaetsregeln fuer Vorschlaege

- Siehe `.github/skills/typescript-module-conventions/SKILL.md` für TypeScript Clean-Code und SRP.
- Siehe `.github/skills/react-rules/SKILL.md` für React-Regeln (Pure Components/Hooks, Rules of React).
- Siehe `.github/skills/angular-styleguide/SKILL.md` für Angular-Regeln (Naming, Struktur, Templates, inject()).
- Siehe `.github/skills/github-actions-ci-workflow/SKILL.md` für CI/CD- und Workflow-Regeln.
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
