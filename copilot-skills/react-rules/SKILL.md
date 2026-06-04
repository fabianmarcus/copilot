---
name: react-rules
description: 'Verbindliche Regeln für React-Komponenten und Hooks im Projekt. Gilt für alle React/Next.js/TSX-Dateien.'
argument-hint: 'React-Komponente oder Hook'
user-invocable: true
---

# React Rules (Skill)

Version: 1.0.0
Last updated: 2026-04-29
Owner: techrockers

## Zweck

Definiert verbindliche Regeln für React-Komponenten und Hooks.

## Regeln

- Components & Hooks müssen pure sein (idempotent, keine Side Effects im Render, Props/State nicht mutieren).
- React rendert Components/Hooks (Components nicht als normale Funktion aufrufen, Hooks nicht herumreichen).
- Hooks nur top-level und nur aus React-Funktionen aufrufen (Function Components oder Custom Hooks).
- Konsistenz innerhalb einer Datei ist wichtiger als ein Mischstil.
- Strict Mode und react-hooks ESLint Plugin empfohlen.

## Hinweise

- Diese Regeln gelten für alle React/Next.js/TSX-Dateien im Projekt.
- Ergänzt die allgemeinen Repository-Instructions.

## Referenzen

- Offizielle React Rules: https://react.dev/reference/rules
