# Copilot Instructions fuer dieses Repository

Version: 1.0.0
Last updated: 2026-06-03
Owner: TechRock <dev@techrock.de>

Diese Datei ist die kurze, verbindliche Team-Version.
Ausfuehrliche Erlaeuterungen und Beispiele stehen in .github/copilot-shared/instructions/copilot-instructions.detailed.md.
Fuer CI- und Review-Agenten steht die strikte Minimalvariante in .github/copilot-shared/instructions/copilot-instructions.ci-review.md.

## Geltungsbereich und Prioritaet

- Diese Vorgaben gelten fuer das gesamte Repository.
- Bei Konflikten gilt folgende Reihenfolge:
  1. Explizite User-Anweisung in der aktuellen Anfrage.
  2. Diese Datei.
  3. Standardverhalten von Copilot.
- Fragen sind keine Handlungsaufforderungen. Bei Fragen nur Antworttext liefern, ohne Code-Aenderungen oder Tool-Ausfuehrung.

## Terminal- und Tool-Nutzung

- Terminal-Befehle nur auf explizite Nachfrage ausfuehren.
- Ausnahme: npm run lint, npm run build und npm run test duerfen nach Code-Aenderungen ohne Rueckfrage ausgefuehrt werden.

## Git-Regeln

- Git Commit und Git Push nur auf explizite Nachfrage ausfuehren.
- Kein Amend, Rebase oder Reset ohne explizite User-Anweisung.
- Git Branches in Englisch benennen.
- Git Commit Messages in Englisch verfassen.
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (<https://www.conventionalcommits.org/>).
- Vor einem Push muss geprueft werden, ob die zu pushenden Aenderungen ein Update in README-Dateien oder anderen Dokumentationsdateien erfordern.
- Falls ein Doku-Update noetig ist, darf nicht gepusht werden, bis die Dokumentation aktualisiert wurde.
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.

## Code-Struktur fuer TypeScript

- Code wird in Modulen organisiert, die jeweils eine klar umrissene Verantwortung haben.
- Funktionen sollten eine einzige, klar definierte Aufgabe haben (Single Responsibility Principle).
- Jedes Modul hat genau eine zentrale Exportfunktion, die die Hauptverantwortung des Moduls darstellt.
- Jedes Modul ist in einer eigenen Datei definiert, deren Name exakt der zentralen Exportfunktion entspricht.
- Die zentrale Exportfunktion wird zusaetzlich als default export bereitgestellt.
- Module koennen weitere interne Funktionen oder Hilfsfunktionen enthalten, die nicht exportiert werden, um die zentrale Exportfunktion zu unterstuetzen.
- Interne Funktionen werden unterhalb der exportierten zentralen Funktion definiert.
- Die zentrale Exportfunktion wird visuell durch einen Divider von internen Funktionen getrennt: `//--- Interne Modul Funktionen ---`
- Module in /shared nach Verantwortungsbereichen in Unterordnern organisieren (z.B. DOM, Storage, UI, Enhancer, Page, Validation).
- Konstanten in shared/constants.ts auslagern und in Funktionen importieren, um magische Werte zu vermeiden.
- Zusammenpassende Konstanten werden in Abschnitten gruppiert und mit einem gemeinsamen Praefix versehen (z.B. SHORTLIST_GROUP_HEADER_CLASS, SHORTLIST_GROUP_COUNT_CLASS).
- TypeScript-Typen im Ordner `shared/types` organisieren, wobei pro Typ eine Datei angelegt wird, deren Name exakt dem Typnamen entspricht (z.B. FavoriteNoteEntry.ts fuer den Typ FavoriteNoteEntry).
- TypeScript-Typen mit gleichem Praefix (z.B. PopupEntry, PopupEntryData) werden in einer Datei organisiert, deren Name exakt dem Praefix entspricht (z.B. PopupEntry.ts).
- Diese Strukturregeln gelten fuer neue oder refaktorierte Artefakte und sollen nicht ohne Anlass grossflaechige Migrationen erzwingen.

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

- Clean-Code-Patterns verwenden und Anti-Patterns in TypeScript, Dateistruktur und Framework vermeiden.
- Framework-spezifische Regeln fuer React und Angular werden ueber separate Skills geladen.
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

## Antwortverhalten

- Vorschlaege kritisch pruefen.
- Vorteile und Nachteile klar benennen, statt nur zu bestaetigen.
