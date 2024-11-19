# Showing Photos

The example photos shown here were obtained from unsplash.com under the
"public domain" category and to the best of my knowledge are free to use in
this way.

Assumes bootstrap styling classes are available. Uses `.widthNNN` custom styles
from `css/extra.css`.

*****

### Centered standalone w/caption

```
![Optional alt text](photos/mountains.jpg "Optional title"){: .d-block .img-fluid .mx-auto .width300px}
**Optional Caption**{: .text-center}
```

![Optional alt text](photos/mountains.jpg "Optional title"){: .d-block .img-fluid .mx-auto .width300px}
**Optional Caption**{: .text-center}

### Linked to original
```
[![](photos/doors.jpg){: .width225px}](photos/doors.jpg)
```
[![](photos/doors.jpg){: .width225px}](photos/doors.jpg)

### Floating left
```
![](photos/picnic-food.jpg){: .float-left .mr-3 .width225px}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum volutpat
ligula elementum lorem blandit, et iaculis dolor congue. Ut in condimentum
neque. Mauris viverra nibh et diam consectetur lobortis. Donec tincidunt ligula
vel nunc hendrerit venenatis. Duis volutpat elit et viverra maximus. Donec
vitae elementum tortor. In hac habitasse platea dictumst. Nullam tempus lectus
quis magna placerat pretium. Proin lorem ipsum, porta nec turpis ac, venenatis
rhoncus diam. Sed quis tristique massa, vel aliquet nisi.
```
![](photos/picnic-food.jpg){: .float-left .mr-3 .width225px}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum volutpat
ligula elementum lorem blandit, et iaculis dolor congue. Ut in condimentum
neque. Mauris viverra nibh et diam consectetur lobortis. Donec tincidunt ligula
vel nunc hendrerit venenatis. Duis volutpat elit et viverra maximus. Donec
vitae elementum tortor. In hac habitasse platea dictumst. Nullam tempus lectus
quis magna placerat pretium. Proin lorem ipsum, porta nec turpis ac, venenatis
rhoncus diam. Sed quis tristique massa, vel aliquet nisi.

### Floating right
```
![](photos/picnic-food.jpg){: .float-right .ml-3 .width225px}
Quisque vel sem nulla. Sed pretium scelerisque facilisis. Nullam condimentum
feugiat mi, eu mollis augue facilisis ac. In ultrices luctus urna, id
vestibulum magna ultricies sodales. Nullam sed justo eu dui pretium venenatis
ac sed massa. Cras volutpat magna vitae condimentum sodales. Donec eget velit
neque. Sed sit amet quam vehicula mi lacinia tristique non vel diam. Morbi
egestas tempor dolor, quis facilisis diam tempus non. Nulla facilisi. In vitae
odio convallis, faucibus metus nec, ultricies ligula. Morbi vel sodales risus.
```
![](photos/picnic-food.jpg){: .float-right .ml-3 .width225px}
Quisque vel sem nulla. Sed pretium scelerisque facilisis. Nullam condimentum
feugiat mi, eu mollis augue facilisis ac. In ultrices luctus urna, id
vestibulum magna ultricies sodales. Nullam sed justo eu dui pretium venenatis
ac sed massa. Cras volutpat magna vitae condimentum sodales. Donec eget velit
neque. Sed sit amet quam vehicula mi lacinia tristique non vel diam. Morbi
egestas tempor dolor, quis facilisis diam tempus non. Nulla facilisi. In vitae
odio convallis, faucibus metus nec, ultricies ligula. Morbi vel sodales risus.

### Group of centered images
```
Some text before image group.

![](photos/doors.jpg){: .width225px}
![](photos/mountains.jpg){: .width225px}
![](photos/picnic-food.jpg){: .width225px}
![](photos/picnic-food.jpg){: .width225px}
{: .text-center}

Some text after image group.
```
Some text before image group.

![](photos/doors.jpg){: .width225px}
![](photos/mountains.jpg){: .width225px}
![](photos/picnic-food.jpg){: .width225px}
{: .text-center}

Some text after image group.
