# How to contribute

## Making changes to the course

The `master` branch is the "last known good" state of the course, which was run live to the audience. Anyone can simply `git pull` this one, convert the Markdown files to html, and run the course.

Minor modifications or fixes may be done on `master` directly, but any updates or major modifications should be done in the `develop` branch, then merged back to `master` when complete, and tagged as a new version of the course.

### Updating or modifying the course

When starting work on a new update, branch off from the `develop` branch.

```bash
git checkout -b my-new-slideset develop
```

Finished updates may be merged into the `develop` branch to definitely add them to the upcoming version.

```bash
git checkout develop
git merge --no-ff my-new-slideset
git branch -d my-new-slideset
git push origin develop
```

When the state of the `develop` branch is ready to become a real version of the course, two actions need to be carried out. First, the `develop` branch is merged into `master` (since every commit on `master` is a new version by definition, remember). Then, that commit on `master` must be tagged for easy future reference to this historical version. Tags should follow the convention of yyyy-mmm, e.g. `2019-dec` and have a message accordingly.

```bash
git checkout master
git merge --no-ff release-2
git tag -a 2019-dec -m "December 2019"
git push --tags
```

## Coding conventions

On top of [general training template instructions](https://github.com/csc-training/slide-template/blob/master/docs/syntax-guide.md), the following typographical conventions should be used for the slides:

- Slide titles should start with capital letter, but otherwise no capitalisation for other words.
  - Have two blank lines above title.
- Indent using two spaces
- For representing commands and keypresses inline with text, single backticks (``…``) should be used.
- Command examples should use code block syntax for bash (````bash …````)
  - There should be blank lines around the code block.
