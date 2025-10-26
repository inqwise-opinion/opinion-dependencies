#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$PROJECT_ROOT"

if ! command -v mvn >/dev/null 2>&1; then
  echo "Apache Maven is required on PATH." >&2
  exit 2
fi

VERSION="$(mvn -q -Dexec.skip=true help:evaluate -Dexpression=project.version -DforceStdout)"
echo "Using project version: $VERSION"

echo "Reproducing snapshot deploy via Maven deploy plugin."
echo "This will attempt to deploy to https://central.sonatype.com/api/v1/publisher and is expected to fail, mirroring the CI error."

mvn -B -ntp clean deploy \
  -DskipTests \
  -DaltDeploymentRepository=sonatype-oss-snapshots::default::https://central.sonatype.com/api/v1/publisher
