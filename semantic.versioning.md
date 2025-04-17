# Semantic Versioning 2.0.0

**Summary**

In a version number that follows the pattern MAJOR.MINOR.PATCH:

- Increase the MAJOR version when you make incompatible API changes,
- Increase the MINOR version when you add functionality in a backward-compatible manner, and
- Increase the PATCH version when you make backward-compatible bug fixes.

Additionally, pre-release and build metadata labels can be added to the end of the MAJOR.MINOR.PATCH format.

## Introduction

In the world of software management, there exists a dreaded place called "dependency hell." As your system grows, and you add more packages to your software, you'll likely find yourself in this helpless swamp one day.

In systems with many dependencies, releasing a new package version can turn into a nightmare. If dependencies are tightly specified, you may face version pinning, preventing you from upgrading the version of a desired package without upgrading all dependent packages. If dependencies are loosely specified, you'll inevitably be bitten by version diversity, assuming excessive compatibility with future versions.

When version pinning and/or version diversity hinder your project's progress, you are in the midst of dependency hell.

As a solution to this problem, I propose some simple rules and requirements for how version numbers are assigned and incremented. While these rules are based on widely accepted practices in both closed and open-source software applications, they are not limited to them. To make this system work, you must first define an accessible API (public API). This can be through documentation or a rule imposed by the code. Regardless of how it's done, the critical aspect is that the API is clear and precise. Once you have defined your accessible API, you should communicate changes to it by incrementing your version number following certain rules. Consider a version number in the format X.Y.Z (MAJOR.MINOR.PATCH). Backward-compatible bug fixes increase the PATCH version, backward-compatible functionality additions or changes increase the MINOR version, and incompatible API changes increase the MAJOR version.

I call this system "Semantic Versioning." With this scheme, version numbers and their changes become meaningful in describing what has changed in the code from one version to another.

## Semantic Versioning Definition (SemVer)

Throughout this document, key words and/or strings composed of letters in uppercase such as "MUST," "SHOULD," "MUST NOT," "SHOULD NOT," "REQUIRED," "MAY," "OPTIONAL," "RECOMMENDED," "MAY NOT," "OPTIONAL," and "DISCRETIONARY" are to be interpreted as described in RFC 2119.

1. A software using Semantic Versioning MUST declare a public API. This API may be defined in the code or within existing documentation. However, it must be precise and complete.

2. A normal version number MUST take the form X.Y.Z where X, Y, and Z are non-negative integers. They MUST NOT contain leading zeros. X is the MAJOR version, Y is the MINOR version, and Z is the PATCH version. Each element MUST increase numerically. For example, 1.9.0 -> 1.10.0 -> 1.11.0.

3. Once a versioned package has been released, the contents of that version MUST NOT be modified. Any modifications must be released as a new version.

4. The MAJOR version zero (0.y.z) is for initial development. Everything may change at any time. Public APIs should not be considered stable.

5. Version 1.0.0 defines the public API. The way in which the version number is incremented after this release is dependent on the API and how it changes.

6. Patch version Z (x.y.Z | x > 0) MUST be incremented if only backward-compatible bug fixes are introduced. Bug fixes should be defined as internal changes that correct incorrect behavior.

7. Minor version Y (x.Y.z | x > 0) MUST be incremented if new, backward-compatible functionality is introduced to the public API. It may be incremented if the public API functionality is marked as deprecated. It may be incremented for significant new features or improvements within private code. Patch version changes can be included in this increment. When a minor version is incremented, the patch version MUST be reset to zero.

8. Major version X (X.y.z | X > 0) MUST be incremented if backward-incompatible changes are introduced to the public API. It may also include patch and minor level changes. When a major version is incremented, both the minor and patch versions MUST be reset to zero.

9. A pre-release version may be denoted by appending a hyphen and a series of dot-separated identifiers immediately following the patch version. Identifiers must only include ASCII alphanumerics and hyphens [0-9A-Za-z-]. Identifiers must not be empty. Numeric identifiers must not include leading zeroes. A pre-release version has a lower precedence than the associated normal version. Unlike the associated normal version, a pre-release version indicates that the version is unstable and may not meet expected compatibility requirements. Examples: 1.0.0-alpha, 1.0.0-alpha.1, 1.0.0-0.3.7, 1.0.0-x.7.z.92.

10. Build metadata may be denoted by appending a plus sign and a series of dot-separated identifiers immediately following a pre-release version or a patch version. Identifiers must only include ASCII alphanumerics and hyphens [0-9A-Za-z-]. Identifiers must not be empty. Build metadata should not be taken into account when determining version precedence. Thus, two versions that differ only in build metadata have the same precedence. Examples: 1.0.0-alpha+001, 1.0.0+20130313144700, 1.0.0-alpha+beta, 1.0.0-beta+exp.sha.5114f85.

11. Precedence refers to how versions are compared to each other when ordered.

- Precedence MUST be calculated by separating the version into major, minor, patch and pre-release identifiers in that order (Build metadata does not figure into precedence).

- Precedence is determined by the first difference when comparing each of these identifiers from left to right as follows: Major, minor, and patch versions are always compared numerically.

- Example: 1.0.0 < 2.0.0 < 2.1.0 < 2.1.1.

- When major, minor, and patch are equal, a pre-release version has lower precedence than a normal version:

- Example: 1.0.0-alpha < 1.0.0.

- Precedence for two pre-release versions with the same major, minor, and patch version MUST be determined by comparing each dot separated identifier from left to right until a difference is found as follows:

  - Identifiers consisting of only digits are compared numerically.

  - Identifiers with letters or hyphens are compared lexically in ASCII sort order.

  - Numeric identifiers always have lower precedence than non-numeric identifiers.

  - A larger set of pre-release fields has a higher precedence than a smaller set, if all of the preceding identifiers are equal.

  Example: 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0.

## Why Use Semantic Versioning?

In fact, this is not a new or groundbreaking idea. You probably are doing something similar already. The problem is that being "similar" is not good enough. Without following an official specification, version numbers are practically useless for real-world dependency management. Using Semantic Versioning, by explicitly naming and defining intentions, makes it easier to convey your intentions to the users of your software. Once intentions are clear and flexible (without excessive flexibility), dependency specifications become feasible.

Let's consider a simple example to illustrate how Semantic Versioning can turn dependency management into a part of history. Let's take a library named "Firetruck" that requires a package named "Ladder." When Firetruck is created, Ladder is in version 3.1.0. Since Firetruck relies on some features added in 3.1.0, you can safely specify that your dependency is greater than or equal to 3.1.0 but less than 4.0.0. Thus, when Ladder versions 3.1.1 and 3.2.0 become available, you can offer them to your package management system, knowing that they will be compatible with the version of the software that relies on them.

As a responsible software developer, of course, you'd want to verify that every package update works as advertised. The real world is a complicated place; there's not much you can do beyond keeping your eyes open. However, what you can do is use Semantic Versioning, which suggests a sensible way to offer and upgrade packages without the need to release new versions of the dependent software. If all this appeals to you, starting to use Semantic Versioning is as simple as announcing that you are using it and following the rules. By linking to this website from your README file, you can make others aware of the rules and help them benefit from them.

**Ref:** [Semver](https://semver.org/)
