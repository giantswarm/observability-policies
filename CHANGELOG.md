# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Rename app to `observability-policies`
- Change team annotation in `Chart.yaml` to OpenContainers format (`io.giantswarm.application.team`).

## [0.0.3] - 2025-11-20

### Fixed

- Missing RBAC for kyverno-report-controller

## [0.0.2] - 2025-05-20

### Changed

- Add Cluster Role to allow latest Kyverno versions to work (https://github.com/giantswarm/giantswarm/issues/33416)
- Switch `.Values.disabled` to `.Values.enabled` to follow best practices.

## [0.0.1] - 2024-07-30

### Added

- Add a ClusterPolicy to prevent prometheus-operator CRDs deletion.
- Create `observability-policies` app to deploy Kyverno Observability Policies into clusters.

[Unreleased]: https://github.com/giantswarm/observability-policies/compare/v0.0.3...HEAD
[0.0.3]: https://github.com/giantswarm/observability-policies/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/giantswarm/observability-policies/compare/v0.0.1...v0.0.2
