---
author: joe
---
# Markdown Cheat-Sheet

Web pages are written using Markdown. This is not a tutorial but a quick list
of common markdown elements as a cheat sheet.

* Original Markdown spec - [Daring Fireball](https://daringfireball.net/projects/markdown/)
* [Python Markdown](https://python-markdown.github.io)
* [Standardization attempt](https://commonmark.org)
* [Github version](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/quickstart-for-writing-on-github)

The below is meant to be a quick reminder of markdown usage. See the docs
listed above for more in-depth description. There are more elements and more
ways to use them than shown below.

*****

Markdown files are plain text. But you can add metadata at the top of the file.
For this template, the *author* value, if given, will show the name at the
top of the page (see the top of this rendered page.

    ---
    author: joe
    ---

```
# Heading Level 1

This is a paragraph under a heading. Heading levels can go up to 6.

## Heading Level 2

### Heading Level 3

Alternate Heading Level 1
=========================
You can use the equals sign underline to create a level 1 heading.

Alternate Heading Level 2
-------------------------
You can use minus sign underline to create a level 2 heading.

You can emphasize text with **bold** or *italics*.

[Link to another site](https://en.wikipedia.org)

Plain URL link: <https://en.wikipedia.org>

[Link to page about themes](howto-theme.md).

[Link to internal heading on the same page](#markdown-cheat-sheet).

[Link to heading on another page](makehelp.md#usage).

An ordered list:

1. item 1
2. item 2
3. **inline styling** can also be applied to *list items*

Unordered list:

* bullet A
* bullet B
* etc

Inline code formatting uses a single backtick: `make help`

A code block (or preformatted block) is made by indenting the text of the block
by 4 spaces:

    -------------
    Makefile help
    -------------

    build       - generate site files
    serve       - development server
    clean       - clean generated files
    deploy      - rsync to web site

```

~~~
Another way to make a code block is to use 3 backticks as a "code fence".
Here is the same Makefile help as a fenced code block:

```
-------------
Makefile help
-------------

build       - generate site files
serve       - development server
clean       - clean generated files
deploy      - rsync to web site
```
~~~

```
You can make a horizontal rule several ways, one of which is 5 asterisks on
a line by itself:

*****
```

*****
