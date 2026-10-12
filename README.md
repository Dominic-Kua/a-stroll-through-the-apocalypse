# A Stroll Through the Apocalypse

A small Jekyll journal designed for GitHub Pages. Entries appear in date order, oldest first, and each entry is titled with its publication date.

## Write an entry

Create a Markdown file in `_posts/` using the date and a short slug:

```text
_posts/2026-10-12-a-small-kindness.md
```

Add front matter at the top. The filename date determines the title shown on the site and when Jekyll publishes the entry.

```markdown
---
---

Today, I noticed...
```

Commit and push the file to `main`. Entries dated today or earlier are published by the next build. To queue an entry, use its intended future date in the filename (for example, `_posts/2026-10-20-first-rain.md`) and push it ahead of time. GitHub Actions rebuilds the site hourly, so the entry will appear after its date arrives. Use UTC for publication timing.

## Publish with GitHub Pages

1. Push this repository to GitHub, keeping the default branch named `main`.
2. In the repository, open **Settings → Pages** and set the build and deployment source to **GitHub Actions**.
3. The workflow deploys on each push and checks hourly for queued entries.

The site is configured with `baseurl: "/a-stroll-through-the-apocalypse"` for a project site using this repository name. If the repository has a different name, update `baseurl` in `_config.yml` to `"/<repository-name>"`. For a user/organization site or a custom domain, use an empty base URL: `baseurl: ""`.

## Preview locally

With Ruby and Bundler installed:

```sh
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000/a-stroll-through-the-apocalypse/`.
