#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$PROJECT_DIR"

VERSION="$(mvn -q -Dexec.skip=true help:evaluate -Dexpression=project.version -DforceStdout)"

echo "Detected project version: $VERSION"

if [[ "$VERSION" == *-SNAPSHOT ]]; then
  echo "✅ Version is a SNAPSHOT build."
  exit 0
else
  echo "⚠️ Version is not a SNAPSHOT build." >&2
  exit 1
fi
