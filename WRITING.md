# Writing for the journal

The blog is a Jekyll site. Write each entry as a Markdown file in `_posts/`, using the publication date followed by a short slug:

```text
_posts/YYYY-MM-DD-short-description.md
```

For example, `_posts/2026-10-20-first-rain.md` is an entry dated October 20, 2026. The date in the filename is used as the entry's title and publication date. Entries appear on the homepage in chronological order, oldest first.

Start each file with Jekyll front matter, then write the entry in Markdown:

```markdown
---
---

Today, I noticed...
```

## Publish now

1. Add the dated file under `_posts/`.
2. Commit and push it to the `main` branch.
3. GitHub Actions builds and publishes the site automatically.

## Queue a future entry

Use the future publication date in the filename and push the file ahead of time. For example, `_posts/2026-10-20-first-rain.md` will remain unpublished until October 20, 2026. GitHub Actions checks hourly, using UTC, and publishes it on the first scheduled build after its date arrives.

## Preview on your computer

With Ruby and Bundler installed, run:

```sh
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000/a-stroll-through-the-apocalypse/`.

## GitHub Pages setup

The repository's Pages source should be set to **GitHub Actions** under **Settings → Pages**. The site uses `baseurl: "/a-stroll-through-the-apocalypse"`; update that value in `_config.yml` if the repository name changes. This file is excluded from the Pages build, so it stays available in the repository without appearing on the blog.
