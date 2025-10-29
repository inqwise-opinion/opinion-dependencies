# Opinion Dependencies

[![CI](https://github.com/inqwise-opinion/opinion-dependencies/actions/workflows/ci.yml/badge.svg)](https://github.com/inqwise-opinion/opinion-dependencies/actions/workflows/ci.yml)
[![Maven Central](https://img.shields.io/maven-central/v/com.inqwise.opinion/opinion-dependencies.svg?label=Maven%20Central)](https://central.sonatype.com/artifact/com.inqwise.opinion/opinion-dependencies)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Snapshot](https://img.shields.io/badge/dynamic/xml?color=informational&label=Snapshot&query=%2F%2Fmetadata%2Fversioning%2Fversions%2Fversion%5Blast()&url=https%3A%2F%2Fcentral.sonatype.com%2Frepository%2Fmaven-snapshots%2Fcom%2Finqwise%2Fopinion%2Fopinion-dependencies%2Fmaven-metadata.xml)](https://central.sonatype.com/repository/maven-snapshots/com/inqwise/opinion/opinion-dependencies)
[![Snapshot Published](https://img.shields.io/badge/dynamic/xml?color=blue&label=Snapshot%20Published&query=%2F%2Fmetadata%2Fversioning%2FlastUpdated&url=https%3A%2F%2Fcentral.sonatype.com%2Frepository%2Fmaven-snapshots%2Fcom%2Finqwise%2Fopinion%2Fopinion-dependencies%2Fmaven-metadata.xml)](https://central.sonatype.com/repository/maven-snapshots/com/inqwise/opinion/opinion-dependencies)

Bill of materials that pins dependency versions across the Opinion platform services and libraries.

## Purpose
- deliver a single source of version truth for Opinion modules
- lock compatible dependency stacks for platform components
- document the minimum build steps for local development

## Use In Child Projects
Import the BOM using Maven's dependency management scope:

```xml
<dependencyManagement>
  <dependencies>
    <dependency>
      <groupId>com.inqwise.opinion</groupId>
      <artifactId>opinion-dependencies</artifactId>
      <version><!-- use the latest release --></version>
      <type>pom</type>
      <scope>import</scope>
    </dependency>
  </dependencies>
</dependencyManagement>
```

## Build & Release Essentials
- install locally: `mvn clean install`
- surface dependency updates: `mvn compile -Pdisplay-updates`
- publish to Maven Central: `mvn clean install -Psonatype-oss-release`

Use Java 17 for everyday development and Java 21 during Sonatype releases.

### Badge Details
- Snapshot badges read Sonatype's `maven-metadata.xml` directly using Shields.io's dynamic XML endpoint: one for the latest SNAPSHOT version (`//metadata/versioning/versions/version[last()]`), and one for the last publish timestamp (`//metadata/versioning/lastUpdated`). If `central.sonatype.com` ever requires tokens for that metadata, switch the badge URLs to `https://s01.oss.sonatype.org/content/repositories/snapshots/...` to keep them working.
- Release badges rely on GitHub releases: the version badge shows the latest semver tag, and the release-date badge reflects when that tag was published.

## More Resources
- Parent build configuration lives in [`opinion-parent`](https://github.com/inqwise-opinion/opinion-parent)
- Release automation runs in `.github/workflows`
- Dependency stability rules reside in `maven-version-rules.xml` (inherited via the parent)
