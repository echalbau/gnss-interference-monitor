# ADR-0001: Stack and version pinning

- Status: accepted
- Date: 2026-10-10

## Context

The project is a streaming and MLOps portfolio piece that has to run on a
laptop (about 8 GB of RAM for Docker) and in CI, without credentials.

## Decision

- Python 3.11, one installable package under `src/gnss_monitor`.
- Spark 3.5.x rather than 4.x: it runs on Java 11 and 17, so the same job runs
  on a developer machine with an older JDK and in the Java 17 container. Delta
  Lake 3.3.x is the matching line when the lakehouse is added.
- Kafka in KRaft mode, single broker.
- Every dependency is pinned to an exact version in `pyproject.toml`, and
  every container image to an exact tag.
- Dependencies are added in the phase that first uses them, so the lock
  surface never includes unused libraries.

## Consequences

- Upgrading Spark to 4.x later means moving to Java 17+, Scala 2.13 and Delta 4.x
  together.
- Exact pins need periodic manual bumps; there is no bot doing it.
