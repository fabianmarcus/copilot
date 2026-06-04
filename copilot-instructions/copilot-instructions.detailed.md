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
- Commit Messages muessen dem Standard von "Conventional Commits" entsprechen (https://www.conventionalcommits.org/).
- Wenn ein Commit oder Push auf main angefragt ist: explizit warnen und erst nach Bestaetigung durchfuehren.

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
- Ueber jedem Typ einen kurzen Doku-Kommentar mit Zweck.

### Migrationsgrenze

Regeln gelten vor allem fuer neue oder refaktorierte Artefakte.
Keine grossflaechige Umstrukturierung ohne fachlichen Anlass.

## 5. Dokumentation, Sprache und Benennung

### Sprache

- Code in Englisch.
- Kommentare in Deutsch.

### Funktionsdokumentation

- Ueber jeder Funktion ein kurzer Doku-Block mit:
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

### Allgemein

- Clean-Code-Patterns anwenden.
- Valides semantisches HTML verwenden.
- Anti-Patterns in TypeScript und Dateistruktur vermeiden.
- Framework-Anti-Patterns vermeiden (z.B. React, Angular).
- Clean Code schreiben, der fuer Menschen schnell erfassbar ist.
- Code- und Typ-Zeilen ab einer Komplexitaet von 4 bekommen einen einzeiligen, praegnanten Erklaerkommentar.
- Aehnliche, zusammenhaengende Setup-Zeilen (z.B. mehrere `el.* = ...` / `el.setAttribute(...)`) werden der Zeilenlaenge nach sortiert (kurz → lang), sofern die Reihenfolge keine Rolle spielt. Andernfalls semantisch gruppieren und die Abhaengigkeit mit einem kurzen Kommentar begruenden.
- Imports werden am Anfang des Moduls platziert, sofern es keinen guten Grund gibt, sie woanders zu platzieren.
- Keine Leerzeilen zwischen Imports, auch nicht, wenn es sich um verschiedene Arten von Imports handelt.
- Imports werden der Zeilenlaenge nach sortiert. Der kuerzeste Import oben, der laengste zum Schluss.
- Mehrzeilige Imports werden unter einzeiligen Imports angesiedelt.
- Bei der Generierung von Code auf Barrierefreiheit achten (ARIA Rules, Screenreader, etc.).
- Referenz fuer Barrierefreiheit: <http://a11ycalendar.kaseybon.com/> (Ziel: standardmaessig Level "A"; "AA" und "AAA", wenn es den Umfang nicht unverhaeltnismaessig erhoeht.)

### React: Rules of React

Wenn im Repo React/Next.js/TSX geschrieben wird, gelten die "Rules of React" als verbindliche Regeln (nicht nur Guidelines): <https://react.dev/reference/rules>
Copilot soll Code entsprechend erzeugen und bei Verstoessen aktiv darauf hinweisen. Wenn allerdings bestehende Dateien bereits ein anderes Muster etabliert haben, ist Konsistenz innerhalb der Datei wichtiger als ein Mischstil.

#### 1) Components & Hooks muessen pure sein

- Components sollen bezogen auf Props/State/Context deterministisch sein: gleiche Inputs -> gleiche Ausgabe.
- Side Effects laufen nicht im Render-Flow. Stattdessen:
  - in Event-Handlern (z.B. onClick)
  - oder in Effects (z.B. useEffect / useLayoutEffect), wenn die Reaktion an den Render gebunden ist.
- Props und State sind Snapshots pro Render: niemals direkt mutieren, sondern neue Objekte/Arrays erzeugen und ueber setState/Reducer aktualisieren.
- Werte, die an Hooks oder JSX uebergeben wurden, nicht nachtraeglich mutieren (Mutation vor der JSX-Erstellung erledigen oder immutable kopieren).

#### 2) React rendert Components und Hooks (nicht "du")

- Components werden in JSX verwendet und nicht als normale Funktionen aufgerufen (kein `MyComponent()` innerhalb anderer Komponenten).
- Hooks sind keine normalen Werte: nicht herumreichen, nicht in andere Callbacks "einschleusen" und nicht dynamisch auswaehlen.

#### 3) Rules of Hooks

- Hooks nur auf Top-Level einer React Function aufrufen (Function Component oder Custom Hook):
  - nicht in Schleifen
  - nicht in Bedingungen
  - nicht in verschachtelten Funktionen
  - keine Hooks nach fruehen Returns/Branches einbauen.
- Hooks nur aus React-Funktionen aufrufen:
  - ok: Function Components, Custom Hooks
  - nicht ok: beliebige Utility-Funktionen, Klassenmethoden, Event-Handler ausserhalb der Component.

#### Empfohlene Tool-Unterstuetzung

- Wenn moeglich Strict Mode aktiv nutzen und sicherstellen, dass das React Hooks ESLint Plugin (react-hooks) im Projekt konfiguriert ist, damit Verstosse frueh gefunden werden.

### Angular: Style Guide

Wenn im Repo Angular geschrieben wird, gelten die Empfehlungen aus dem offiziellen Angular Style Guide als Leitplanken fuer konsistente, wartbare Angular-Anwendungen. Wenn bestehende Dateien bereits ein anderes Muster etabliert haben, ist Konsistenz innerhalb der Datei wichtiger als ein Mischstil.

#### 1) Naming & Dateistruktur

- Dateinamen in kebab-case (mit Bindestrichen), z.B. `user-profile.ts`.
- Tests enden auf `.spec.ts` und tragen den gleichen Basenamen wie die Produktionsdatei.
- Dateinamen spiegeln in der Regel den primären TypeScript-Identifier wider; generische Namen wie `helpers.ts`/`utils.ts` vermeiden, wenn es eine klarere Benennung gibt.
- Component TypeScript, Template und Styles teilen sich den gleichen Basenamen (z.B. `user-profile.ts`, `user-profile.html`, `user-profile.css`).

#### 2) Projektstruktur & Modularitaet

- UI-Code liegt unter `src/`; Einstiegspunkt ist `src/main.ts`.
- Zusammengehoerige Files (Component + Template + Styles + Spec) liegen im gleichen Ordner.
- Feature-/Themen-basiert strukturieren (z.B. `src/checkout/...`) statt nach Artefakt-Typ (keine reinen `components/`, `services/`, `directives/`-Ordner, wenn es keine Feature-Gruppierung gibt).
- Pro Datei bevorzugt ein Konzept (oft: eine Component/Directive/Service), ausser mehrere kleine Klassen gehoeren erkennbar zu einem gemeinsamen Konzept.

#### 3) Dependency Injection

- Bevorzugt `inject()` statt Constructor-Parameter-Injection verwenden (lesbarer, leichter kommentierbar, bessere Typinferenz).

#### 4) Components, Templates & APIs

- Angular-spezifische Properties (Injected Deps, Inputs/Outputs, Queries) oben gruppieren, dann erst Methoden.
- Components/Directives auf Praesentation fokussieren; Logik, die ohne UI Sinn ergibt, in separate Funktionen/Klassen auslagern.
- Template-Expressions simpel halten; wenn Template-Logik zu komplex wird, nach TypeScript refactoren (z.B. computed Werte).
- Class members, die nur vom Template genutzt werden, bevorzugt `protected` statt `public` machen, um die DI-/Query-öffentliche API klein zu halten.
- Properties, die durch Angular initialisiert werden und nicht überschrieben werden sollen, als `readonly` markieren (wo sinnvoll).
- CSS-Bindings bevorzugt mit `class.*`/`style.*` statt `ngClass`/`ngStyle` umsetzen (lesbarer und meist günstiger).
- Event-Handler nach der Aktion benennen (z.B. `saveUserData()` statt `handleClick()`), ausser bei wirklich generischen Keyboard-Handlern.
- Lifecycle Hooks schlank halten; komplexe Logik in gut benannte Methoden auslagern.
- Wenn Lifecycle Hooks genutzt werden, die passenden TypeScript Interfaces implementieren (z.B. `OnInit`), um Tippfehler zu vermeiden.

**Quelle**: <https://angular.dev/style-guide>

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
