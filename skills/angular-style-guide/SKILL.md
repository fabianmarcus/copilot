---
name: angular-style-guide
description: "Use when writing, reviewing, refactoring, or discussing Angular code. Applies the Angular Style Guide for naming, project structure, dependency injection, templates, and component API design."
argument-hint: "Angular-Komponente, Service oder Modul"
user-invocable: true
---

# Angular Style Guide

Version: 1.0.0
Last updated: 2026-06-05

Diese Skill-Datei enthaelt die projektspezifischen Angular-Leitplanken.
Wenn im Repo Angular bearbeitet wird, gelten die Empfehlungen aus dem offiziellen Angular Style Guide als Leitplanken fuer konsistente, wartbare Angular-Anwendungen:
<https://angular.dev/style-guide>

Wenn bestehende Dateien bereits ein anderes Muster etabliert haben, ist Konsistenz innerhalb der Datei wichtiger als ein Mischstil.

## Zweck

Definiert verbindliche Regeln fuer Angular-Code, Struktur und Naming.

## 1. Naming und Dateistruktur

- Dateinamen in kebab-case schreiben, zum Beispiel user-profile.ts.
- Tests enden auf .spec.ts und tragen denselben Basenamen wie die Produktionsdatei.
- Dateinamen spiegeln in der Regel den primaeren TypeScript-Identifier wider. Generische Namen wie helpers.ts oder utils.ts vermeiden, wenn es eine klarere Benennung gibt.
- Component-TypeScript, Template und Styles teilen sich denselben Basenamen.

## 2. Projektstruktur und Modularitaet

- UI-Code liegt unter src; Einstiegspunkt ist src/main.ts.
- Zusammengehoerige Dateien wie Component, Template, Styles und Spec liegen im gleichen Ordner.
- Feature- oder themenbasiert strukturieren statt nur nach Artefakt-Typen.
- Pro Datei bevorzugt ein Konzept, ausser mehrere kleine Klassen gehoeren erkennbar zu einem gemeinsamen Konzept.

## 3. Dependency Injection

- Bevorzugt inject() statt Constructor-Parameter-Injection verwenden.

## 4. Components, Templates und APIs

- Angular-spezifische Properties wie Injected Dependencies, Inputs, Outputs und Queries oben gruppieren, danach erst Methoden.
- Components und Directives auf Praesentation fokussieren; Logik ohne UI-Bezug in separate Funktionen oder Klassen auslagern.
- Template-Expressions simpel halten; komplexe Template-Logik in TypeScript verschieben.
- Class Members, die nur vom Template genutzt werden, bevorzugt protected statt public machen.
- Properties, die durch Angular initialisiert werden und nicht ueberschrieben werden sollen, wo sinnvoll als readonly markieren.
- CSS-Bindings bevorzugt mit class._ oder style._ statt ngClass oder ngStyle umsetzen.
- Event-Handler nach der Aktion benennen, zum Beispiel saveUserData() statt handleClick().
- Lifecycle Hooks schlank halten und komplexe Logik in gut benannte Methoden auslagern.
- Wenn Lifecycle Hooks genutzt werden, die passenden TypeScript-Interfaces implementieren.

## Hinweise

- Diese Regeln gelten fuer alle Angular-Dateien im Projekt.
- Sie ergaenzen die allgemeinen Repository-Instructions.

## Referenzen

- Offizieller Angular Style Guide: https://angular.dev/style-guide
