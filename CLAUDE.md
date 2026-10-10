# CLAUDE.md

Conventions for working in this repository.

## Language

All code, comments, commit messages and documentation are in English.

## Layout

- `src/gnss_monitor/<area>/`: one subpackage per pipeline stage. Shared code
  goes in `common/`.
- `tests/unit`: no network, no Docker. `tests/integration`: needs `make up`,
  marked `@pytest.mark.integration` and excluded by default.
- `tests/fixtures`: small recordings only. Synthetic data must say so in its
  file name.
- `docs/decisions/NNNN-title.md`: one ADR per decision that would be expensive
  to reverse.

## Commands

- `make install`: create `.venv` and install with dev and spark extras.
- `make lint` / `make format`: ruff.
- `make test`: unit tests.

## Rules

- Pin every dependency and image to an exact version. Add a dependency only in
  the change that first uses it.
- No secrets in the repository. Credentials are read from `.env`
  (`NTRIP_USER`, `NTRIP_PASSWORD`); everything must work in replay mode
  without them.
- Kafka topic and lakehouse schemas are contracts: change
  `docs/data_contract.md` in the same commit as the code.
- Documentation describes only what is implemented. Planned work goes under
  a roadmap heading.
- Conventional commits (`feat:`, `fix:`, `docs:`, `chore:`, `test:`), one
  commit per completed phase or self-contained change.
- Spark transformations are pure `DataFrame -> DataFrame` functions so they
  can be unit tested in batch mode.
