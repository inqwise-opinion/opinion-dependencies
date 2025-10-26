# Opinion Dependencies

[![CI](https://github.com/inqwise-opinion/opinion-dependencies/actions/workflows/ci.yml/badge.svg)](https://github.com/inqwise-opinion/opinion-dependencies/actions/workflows/ci.yml)
[![Maven Central](https://img.shields.io/maven-central/v/com.inqwise.opinion/opinion-dependencies.svg?label=Maven%20Central)](https://central.sonatype.com/artifact/com.inqwise.opinion/opinion-dependencies)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

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

## More Resources
- Parent build configuration lives in [`opinion-parent`](https://github.com/inqwise-opinion/opinion-parent)
- Release automation runs in `.github/workflows`
- Dependency stability rules reside in `maven-version-rules.xml` (inherited via the parent)
