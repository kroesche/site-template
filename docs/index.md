---
author: joe
---
# Static Web Site Template

Starter for a static web site using [mkdocs](https://www.mkdocs.org).

## Features

* uses [mkdocs](https://www.mkdocs.org) to generate a static site
* uses [bootswatch](https://mkdocs.github.io/mkdocs-bootswatch/) theme
* [Makefile-driven](makehelp.md)
* uses python 3 `venv` for python environment
* spell checker using `aspell`
* linkchecker
* deploy using `rsync`

## How to Use

*Dependencies:* bash-like shell, GNU make, python3, and probably some other
stuff.

* Make a copy of this template into your project directory by some means. You
can get a [zip file from GitHub here](https://github.com/kroesche/site-template/archive/refs/heads/main.zip).
* As an alternate method, you could clone this repo, then delete the `.git`
  directory.
* from your project directory, on the command line type `make venv`. This will
  generate the python3 virtual environment
* `make build`
* `make serve`
* open a web browser to <http://localhost:8000>
* you should see this example template site in your browser

If the above works, you can now generate your own web site using this template.

* edit the README to reflect your own project or just delete it
* replace the LICENSE with your preference, if you care
* edit/replace/add the `.md` files in the `docs/` directory to create your own
  site content
* edit `mkdocs.yml` to customize for your web site name and page layout

Whenever you want to regenerate your site you can:

    make build
    make serve

and view in your local browser. You can also `make clean` to remove the
generated site but that is usually not needed.

Read the [mkdocs documentation](https://www.mkdocs.org/user-guide/) to
understand how it works and the things you can do.

Some other brief help:

* [Makefile help](makehelp.md)
* [Theme help](howto-theme.md)
* [Markdown cheatsheet](howto-markdown.md)
* [Photos cheatsheet](howto-photos.md)

## TODO

* add a photo gallery
* update to bootstrap5 when bootswatch does or change to another theme
* add optional terms of use and/or privacy policies
* show how to use github pages instead of custom site
* consider minify for html (js minification appears unneeded)

*why bootstrap 5?* because it allows to eliminate javascript from my static
web site
