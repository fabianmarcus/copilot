---
name: github-actions-ci-workflow
description: 'Review, update, or create GitHub Actions CI workflows (.github/workflows/*.yml). Use when: editing ci.yml, adding lint/typecheck/build/test steps, changing Node version, changing npm/pnpm/yarn install, adjusting caching, secrets/vars usage, or tightening permissions. Covers deterministic installs, minimal permissions, and safe handling of secrets.'
argument-hint: 'Workflow file + what should change (e.g. Node 22, add tests, split jobs)'
user-invocable: true
---

# GitHub Actions CI Workflow

## Goal

Make CI workflows reliable, deterministic, and safe (minimal permissions, correct caching, predictable installs), while matching the scripts defined in the repository.

## When to Use

- You are editing `ci.yml` or any `.github/workflows/*.yml`
- CI is flaky (cache/install issues) or slow
- You change Node version / package manager
- You add or adjust `lint`, `typecheck`, `build`, `test` steps
- You add secrets/vars and want to avoid accidental leakage

## Procedure

1. **Confirm triggers**
   - Ensure `on:` covers the intended events (usually `pull_request` + selected `push` branches).
   - Keep branch globs tight to avoid wasting CI minutes.

2. **Set minimal permissions**
   - Default to read-only:
     - `permissions: { contents: read }`
   - Only add more permissions if a step requires it (e.g. releases).

3. **Pin stable actions**
   - Use maintained versions (e.g. `actions/checkout@v4`, `actions/setup-node@v4`).

4. **Use deterministic installs**
   - npm: `npm ci` (requires a lockfile).
   - pnpm: `pnpm install --frozen-lockfile`.
   - yarn: `yarn install --immutable`.

5. **Cache correctly**
   - With `actions/setup-node`, use `cache: npm|pnpm|yarn` matching the package manager.
   - If you change lockfile/package manager, update caching accordingly.

6. **Run the repo scripts in a sensible order**
   - Typical sequence:
     1. `lint`
     2. `typecheck`
     3. `test` (if present)
     4. `build`
   - Keep the CI steps aligned with `package.json` scripts.

7. **Handle secrets and vars safely**
   - Prefer `vars.*` for non-secret configuration.
   - Use `secrets.*` only when necessary.
   - Scope secrets env vars to the single step that needs them.
   - Never echo secrets; avoid verbose tooling modes that might print env.

## Repo-specific notes (browser-extension-immoscout24)

- The current CI runs:
  - `npm run lint`
  - `npm run typecheck`
  - `npm run build:chromium`
  - `npm run build:firefox` (uses `secrets.FIREFOX_EXTENSION_ID` and `vars.FIREFOX_MIN_VERSION`)

## Quick checklist

- Workflow file exists under `.github/workflows/`
- Node version matches local/tooling expectations
- Install step uses lockfile-safe command
- Cache matches package manager
- Permissions are minimal
- Secrets/vars are scoped to the step

## Reference

- [Checklist (copy/paste)](./references/checklist.md)
