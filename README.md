# MSc AI e-Portfolio — Henry Godknows Shoko

GitHub Pages e-Portfolio for the **MSc Artificial Intelligence** programme at
University of Essex Online (April 2026 cohort). Required UoEO submission
artefact — see `Creating your e-Portfolio _ UoEO.pdf` and
`e-Portfolio Learning Activities.docx` (kept locally, gitignored) for the
brief.

Built on **[Forty](https://html5up.net/forty)** by HTML5 UP — the template
the UoEO brief explicitly recommends. Plain static HTML; no Jekyll, no
build step. Served straight off GitHub Pages.

## Layout

```
.
├── index.html                     Banner + About Me snippet + module/project tiles + contact
├── about.html                     Full About Me — profile, experience, skills, quals, programme, interests
├── launch-into-computing.html     Active module — LOs, artefacts, reflection, meetings, skills matrix, action plan
├── understanding-ai.html          Stub — full 5-section skeleton, populated when module begins
├── numerical-analysis.html        Stub
├── machine-learning.html          Stub
├── intelligent-agents.html        Stub
├── research-methods.html          Stub
├── project.html                   MSc Computing Project — indicative research directions
├── learning-loop.html             Programme-wide synthesis (brief §4)
├── 404.html                       Friendly fallback for unknown URLs
├── favicon.svg, favicon.ico       Modern + legacy favicons
├── favicon-32.png                 Standard 32×32 PNG fallback
├── apple-touch-icon.png           iOS home-screen icon (180×180)
├── robots.txt                     Crawler hints + sitemap pointer
├── sitemap.xml                    Search engine site map
├── assets/
│   ├── css/                       FORTY styles (main.css + fontawesome pruned to woff/woff2)
│   ├── js/                        FORTY JS (jquery, scrollex, scrolly, breakpoints, main, util)
│   ├── sass/                      FORTY SCSS source — for rebuilding main.css if you customise
│   ├── webfonts/                  FontAwesome (woff + woff2 only — eot/svg/ttf removed)
│   └── LICENSE.txt                FORTY's CC BY 3.0 licence
├── images/                        Themed dark-gradient banner + pic01–pic11
├── .nojekyll                      Tells GitHub Pages NOT to run Jekyll on this repo
├── .gitignore
├── serve.sh                       Optional local preview via Docker (python:3-alpine static server)
└── README.md                      This file
```

Each module page mirrors the five-section structure prescribed by the brief
— **Learning outcomes → Artefacts → Reflective piece → Meeting notes →
Professional skills matrix and action plan** — laid out using FORTY's
`spotlights` pattern. Reflections use the 3 W's framework (What? / So
what? / What next?); Gibbs' Reflective Cycle is the sanctioned alternative.

## Local preview

Three options, fastest first:

### Option A — open `index.html` directly

Double-click `index.html` (or `start index.html` from PowerShell). FORTY
is plain static HTML/CSS/JS with relative asset paths, so `file://` URLs
work end-to-end. The contact form's submit button doesn't do anything
either way — it's a placeholder.

### Option B — Docker static server

```bash
bash serve.sh
```

Pulls `python:3-alpine` (~50 MB) and serves at <http://localhost:4000>.
Useful if you want to test absolute paths or make sure nothing relies on
filesystem-relative quirks. Ctrl-C to stop. Requires Docker Desktop
running.

### Option C — `git push`

GitHub Pages rebuilds on every push. The live site is at
<https://gshoko91.github.io/eportfolio/>. For prose-edit cycles this
is often the simplest loop.

## Submission workflow (per the brief, §6)

When submitting the e-Portfolio for a summative mark, you need to
freeze a snapshot of the site so the marker sees exactly the version
you submitted, even if you keep working on `main`.

The procedure has been dry-run end-to-end on this repo on 10 May 2026
— branching, pushing, switching back, and teardown all verified.

### 1. Snapshot main as an immutable submission branch

```bash
# Replace <module-slug> with e.g. launch-into-computing
git switch -c submission/<module-slug>
git push -u origin submission/<module-slug>
```

### 2. Switch GitHub Pages source to the submission branch

Two equivalent ways — pick whichever you prefer.

**Web UI:**
1. Go to <https://github.com/gshoko91/eportfolio/settings/pages>
2. Under *Build and deployment* → *Branch*, change the dropdown from
   `main` to `submission/<module-slug>`.
3. Click **Save**. Pages will rebuild within ~30 seconds.

**gh CLI:**

```bash
gh api repos/gshoko91/eportfolio/pages -X PUT \
  -f "source[branch]=submission/<module-slug>" \
  -f "source[path]=/"

# Verify the source has switched + build succeeded:
gh api repos/gshoko91/eportfolio/pages/builds/latest \
  --jq '"status=\(.status)  branch=\(.commit[0:7])"'
```

### 3. Submit the Pages URL

```
https://gshoko91.github.io/eportfolio/
```

The URL stays the same — only the served branch changes. Confirm in a
private browser tab that the page reflects the submission-branch
content before clicking submit on the module page.

### 4. Continue day-to-day work on main

```bash
git switch main
```

### After the marker has finished

You can either:

- **Leave the submission branch in place** as a permanent record of
  what was submitted (recommended).
- **Switch Pages source back to `main`** so the live site reflects
  ongoing work:
  ```bash
  gh api repos/gshoko91/eportfolio/pages -X PUT \
    -f "source[branch]=main" -f "source[path]=/"
  ```
- **Both** — keep the branch and switch Pages back to `main`.

Submission branches are immutable snapshots — never push commits onto
them after submission.

## Editing pages

- Each page is self-contained HTML — header, menu, banner, main content,
  contact section, footer, scripts. The duplication is deliberate (no
  templating engine), but it means a menu change has to be made in 10
  places. If that becomes painful, introduce Jekyll layouts later or
  use a small build script.
- For new modules, copy `launch-into-computing.html` to a new kebab-case
  filename and update the title, banner, learning outcomes, artefacts,
  reflection, meetings, and skills matrix sections. Add the menu entry
  to every page (or accept the inconsistency until the next batch edit).
- Paste tutor and peer feedback **verbatim** under each artefact, then
  add a short note on what the feedback changed in your thinking — the
  brief expects evidence of feedback, not just receipt of it.
- British English throughout. Reflective writing must be your own —
  AI-generated reflective text fails UoEO's plagiarism policy.

## FORTY licence

The template is © HTML5 UP (`@ajlkn`), released under the
[Creative Commons Attribution 3.0 Unported](http://creativecommons.org/licenses/by/3.0/)
licence. Attribution is preserved in the page footer (`Design: HTML5 UP`)
and in `assets/LICENSE.txt`.
