# CI Workflow Checklist

## Determinism
- Use a lockfile-based install (`npm ci` / `--frozen-lockfile` / `--immutable`).
- Avoid mixing package managers.

## Security
- `permissions` minimal by default.
- Secrets only in step env; never printed.

## Performance
- Cache via `actions/setup-node` with correct `cache` value.
- Keep steps minimal and aligned to `package.json` scripts.

## Maintainability
- Use current major versions of maintained GitHub Actions.
- Keep triggers and branch patterns intentional.
