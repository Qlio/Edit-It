Edit It!
========

In-place/inline editing with jQuery.

Example
-------

Javascript:

```JavaScript
options = {"url": "/change-name"}
$(".double-click").editit("dblclick", options);
$(".click").editit("click", options);
```

HTML:
```HTML
<div class="double-click" data-name="fname">Firstname</div>
<div class="click" data-name="lname">Lastname</div>
```
