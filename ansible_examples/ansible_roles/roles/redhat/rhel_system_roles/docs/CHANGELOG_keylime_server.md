Changelog
=========

[1.1.2] - 2024-01-16
--------------------

### Bug Fixes

- fix: add timeout for registrar service - use 30 second timeout for registrar and verifier

### Other Changes

- ci: support ansible-lint and ansible-test 2.16 (#31)
- ci: Use supported ansible-lint action; run ansible-lint against the collection (#32)

[1.1.1] - 2023-12-08
--------------------

### Other Changes

- ci: Bump actions/github-script from 6 to 7 (#28)
- refactor: get_ostree_data.sh use env shebang - remove from .sanity* (#29)

[1.1.0] - 2023-11-29
--------------------

### New Features

- feat: support for ostree systems (#24)

### Other Changes

- build(deps): Bump actions/checkout from 3 to 4 (#16)
- ci: ensure dependabot git commit message conforms to commitlint (#19)
- ci: tox-lsr version 3.1.1 (#23)
- ci: Use emulated TPM device on C9S (#25)

[1.0.1] - 2023-09-08
--------------------

### Other Changes

- ci: Add markdownlint, test_converting_readme, and build_docs workflows (#12)

  - markdownlint runs against README.md to avoid any issues with
    converting it to HTML
  - test_converting_readme converts README.md > HTML and uploads this test
    artifact to ensure that conversion works fine
  - build_docs converts README.md > HTML and pushes the result to the
    docs branch to publish dosc to GitHub pages site.
  - Fix markdown issues in README.md
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

- docs: Make badges consistent, run markdownlint on all .md files (#13)

  - Consistently generate badges for GH workflows in README RHELPLAN-146921
  - Run markdownlint on all .md files
  - Add custom-woke-action if not used already
  - Rename woke action to Woke for a pretty badge
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>

- ci: Remove badges from README.md prior to converting to HTML (#14)

  - Remove thematic break after badges
  - Remove badges from README.md prior to converting to HTML
  
  Signed-off-by: Sergei Petrosian <spetrosi@redhat.com>


[1.0.0] - 2023-07-24
--------------------

### New Features

- New role for managing keylime server

  This is an ansible role for configuring and deploying the server
  components for Keylime Remote Attestation.
  
  It currently supports Fedora 36+, CentOS Stream 9.1+ and RHEL 9.1+
