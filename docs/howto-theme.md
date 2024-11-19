About Themes
============

Bootswatch
----------

I chose to use the [mkdocs-bootswatch](https://mkdocs.github.io/mkdocs-bootswatch/)
theme because it gives you a number of different appearances to choose from,
and I can understand more or less how bootstrap works and can make my own
tweaks when I like.

For this example and many of my sites I use
[flatly](https://mkdocs.github.io/mkdocs-bootswatch/#flatly) because I like the
way it looks. But you can choose any of the other bootswatch choices.

One disadvantage of bootswatch is that it has not been updated to bootstrap 5.

Other Themes
------------

Instead of using bootswatch, you can use a completely different theme. See the
[mkdocs theme documentation](https://www.mkdocs.org/user-guide/choosing-your-theme/)
for more help on that. Besides the mkdocs built-in themes, there are a lot of
third party themes to choose from.

Customizing
-----------

I made some minor modifications to the theme. The layout mods are in
`theme/main.html`. The css mods are in `css/extra.css`:

* modified next/prev links to appear at the end of a page
* modified footer to look the way I like, including adding update date
* added some shortcut css classes to help with photo placement

See the mkdocs documentation about
[customizing your theme](https://www.mkdocs.org/user-guide/customizing-your-theme/).
