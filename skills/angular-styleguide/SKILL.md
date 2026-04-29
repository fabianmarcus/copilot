---
name: angular-styleguide
description: 'Verbindliche Regeln für Angular-Code, Struktur und Naming. Gilt für alle Angular-Dateien im Projekt.'
argument-hint: 'Angular-Komponente, Service oder Modul'
user-invocable: true
---

# Angular Style Guide (Skill)

Version: 1.0.0
Last updated: 2026-04-29
Owner: techrockers

## Zweck

Definiert verbindliche Regeln für Angular-Code, Struktur und Naming.

## Regeln

- Dateinamen in kebab-case, Tests enden auf .spec.ts.
- Feature-/Themen-basierte Struktur, keine reinen Artefakt-Ordner.
- Pro Datei bevorzugt ein Konzept (Component/Directive/Service).
- Dependency Injection bevorzugt via `inject()`.
- Angular Properties oben gruppieren, dann Methoden.
- Präsentationsfokus im Template, komplexe Logik in TypeScript auslagern.
- Template-Expressions simpel halten.
- Class members für Template bevorzugt `protected`.
- Properties, die durch Angular initialisiert werden und nicht überschrieben werden sollen, als `readonly` markieren.
- CSS-Bindings bevorzugt mit `class.*`/`style.*`.
- Event-Handler nach Aktion benennen.
- Lifecycle Hooks schlank halten, komplexe Logik auslagern.
- Passende TypeScript Interfaces für Lifecycle Hooks implementieren.

## Hinweise

- Diese Regeln gelten für alle Angular-Dateien im Projekt.
- Ergänzt die allgemeinen Repository-Instructions.

## Referenzen

- Offizieller Angular Style Guide: https://angular.dev/style-guide
