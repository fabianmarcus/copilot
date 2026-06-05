---
name: react-rules
description: "Use when writing, reviewing, refactoring, or discussing React, JSX, TSX, or Next.js code. Applies the Rules of React, catches React anti-patterns, and prefers consistency within existing files."
argument-hint: "React-Komponente oder Hook"
user-invocable: true
---

# React Rules

Version: 1.0.0
Last updated: 2026-06-05

Diese Skill-Datei enthält die projektspezifischen React-Leitplanken.
Wenn im Repo React, Next.js, JSX oder TSX bearbeitet wird, gelten die "Rules of React" als verbindliche Regeln:
<https://react.dev/reference/rules>

Wenn bestehende Dateien bereits ein anderes Muster etabliert haben, ist Konsistenz innerhalb der Datei wichtiger als ein Mischstil.

## Zweck

Definiert verbindliche Regeln für React-Komponenten und Hooks.

## 1. Components & Hooks müssen pure sein

- Components sollen bezogen auf Props, State und Context deterministisch sein: gleiche Inputs führen zur gleichen Ausgabe.
- Side Effects laufen nicht im Render-Flow. Stattdessen gehören sie in Event-Handler oder in Effects wie useEffect oder useLayoutEffect.
- Props und State sind Snapshots pro Render und dürfen nicht direkt mutiert werden. Stattdessen neue Objekte oder Arrays erzeugen und über setState oder Reducer aktualisieren.
- Werte, die an Hooks oder JSX übergeben wurden, nachträglich nicht mutieren. Nötige Mutation vor der JSX-Erstellung erledigen oder immutable kopieren.

## 2. React rendert Components und Hooks

- Components in JSX verwenden und nicht als normale Funktionen aufrufen.
- Hooks nicht wie normale Werte herumreichen, nicht in Callbacks einschleusen und nicht dynamisch auswählen.

## 3. Rules of Hooks

- Hooks nur auf Top-Level einer React Function aufrufen: nicht in Schleifen, nicht in Bedingungen, nicht in verschachtelten Funktionen und nicht erst nach frühen Returns.
- Hooks nur aus React-Funktionen aufrufen: erlaubt in Function Components und Custom Hooks, nicht in Utility-Funktionen, Klassenmethoden oder beliebigen externen Handlern.

## 4. Tool-Unterstützung

- Wenn möglich Strict Mode aktiv nutzen.
- Wenn möglich sicherstellen, dass das React Hooks ESLint Plugin konfiguriert ist, damit Verstöße früh erkannt werden.

## Hinweise

- Diese Regeln gelten für alle React/Next.js/TSX-Dateien im Projekt.
- Sie ergänzen die allgemeinen Repository-Instructions.

## Referenzen

- Offizielle React Rules: https://react.dev/reference/rules
