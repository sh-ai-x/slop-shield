---
description: Scan a directory for AI slop patterns. Reports files ranked by banned-phrase count. Bulk audit for existing slop — complements hooks/slop-detector.sh.
---

# /slop-scan

Bulk audit. Hooks catch slop at write time; this command surfaces slop already accumulated in a repo or directory.

## Argument

`$ARGUMENTS` — optional path. Default `.`. Append `--json` for machine-readable output.

Examples:
- `/slop-scan`
- `/slop-scan src/`
- `/slop-scan docs/ --json`

## Run

### 1. Resolve scope

- empty → `.`
- contains `--json` → strip flag, set JSON mode, remainder is path
- else → use as path

### 2. Extract pattern (single source of truth)

Read `hooks/slop-detector.sh`. Extract the regex value assigned to `SLOP=` after bash quote processing. Use that exact pattern for every Grep call below.

### 3. Find candidate files

Grep tool:
- `pattern`: extracted regex
- `path`: scope
- `output_mode`: `files_with_matches`

Returns paths with at least one match.

### 4. Count + classify per file

For each matched file (cap at 20 by count to bound tokens):

Grep tool:
- `pattern`: same regex
- `path`: <file>
- `output_mode`: `content`

Tally phrase occurrences per file.

### 5. Report

Sort files by total count desc. Bucket:

- HIGH (≥5): `path  N  (phrase×k, phrase×k, ...)`
- MEDIUM (2–4): `path  N`
- LOW (1): `path  1`

Header: `slop-scan: {path} — {N} files / {M} total matches`

If JSON mode: `{path, total_files, total_matches, files: [{path, count, phrases: {phrase: count}}]}`.

## Skip

`.git/`, `node_modules/`, `dist/`, `build/`, `.venv/`, `__pycache__/`, lock files (`*.lock`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`). Use Grep `glob` excludes when path is `.`.

## Don't

- Edit files. Report only.
- Dump every match line — aggregate counts.
- Invoke hooks — they are write-time, not audit.