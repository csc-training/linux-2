# Linux 2 — Advanced Linux

Training material — slides, exercises, cheatsheets — for the Advanced Linux course.

## How to develop this course further

This repository holds two main branches with an infinite lifetime:

- `master`
- `develop`

Consider `origin/master` to be the main branch where the source code of `HEAD` always reflects a presentation ready state of course materials. The `origin/develop` is the main branch where the code of HEAD always reflects a state with the the latest delivered development changes for the next release of the course.

When the code in the develop branch reaches a stable point and is ready to be released as new a version of the course, all of the changes should be merged back into master and then tagged with a release number of form year-mon (e.g. `2019-dec`).

## Type conventions

On top of [general training template instructions](https://github.com/csc-training/slide-template/blob/master/docs/syntax-guide.md), the following conventions should be followed for the slides:

- Slide titles should start with capital letter, but otherwise no capitalisation for other words.
- For representing commands and keypresses inline with text, single backticks (``…``) should be used.
- Command examples should use code block syntax for bash (````bash …````)
