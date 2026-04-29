---
name: typescript-module-conventions
description: 'Create/refactor TypeScript modules with our repo conventions: single responsibility, one central export function, default export, divider for internal functions, constants in src/shared/constants.ts, types in src/shared/types, import sorting (line length), and German JSDoc. Use when: "create helper", "refactor module", "shared function", "extract util", "add constant", "add type".'
argument-hint: 'Function/module name + target folder (e.g. src/shared/functions)'
user-invocable: true
---

# TypeScript Module Conventions

## Goal

Create or refactor a TypeScript module so it matches the team conventions in this repository (clean structure, predictable exports, no magic values, consistent docs).

## When to Use

- You create a new helper/utility ("helper", "util", "shared function")
- You extract logic from a larger file into `src/shared/**`
- You add a new constant or type and want correct placement
- You refactor an existing module to conform to the standard pattern

## Procedure

1. **Pick the module responsibility**
   - One file = one clear responsibility.
   - Prefer putting reusable logic under `src/shared/functions/` or domain-specific `src/shared/<area>/`.

2. **Name + file placement**
   - File name must match the central export function name, e.g. `getNowIso.ts` → `getNowIso()`.
   - For shared utilities: `src/shared/functions/<centralFunction>.ts`.
   - For types: `src/shared/types/<TypeName>.ts`.

3. **Exports (central + default)**
   - Export exactly one central function as named export.
   - Also export it as default.

4. **Documentation (German JSDoc)**
   - Directly above every function:
     - kurze Beschreibung
     - `@param ...` (falls vorhanden)
     - `@returns ...`

5. **Internal helpers below divider**
   - Any helper functions stay non-exported.
   - Place them below the divider comment:
     - `//--- Interne Modul Funktionen ---`

6. **No magic values**
   - Put constants in `src/shared/constants.ts`.
   - Group related constants and use a shared prefix (e.g. `SHORTLIST_*`).

7. **Types live in `shared/types`**
   - Create a type file per type (`<TypeName>.ts`), unless the repo convention is a shared prefix file.

8. **Imports formatting**
   - Imports at the top.
   - No blank lines between imports.
   - Sort imports by line length (short → long).

## Template

- Use this skeleton as a starting point: [function module template](./assets/function-module.template.ts)

## Quality Checks

- Central export does the main job; helpers are private below divider.
- No unrelated refactors.
- If you touched TypeScript structure, run `npm run lint` and `npm run build` in the repo when appropriate.
