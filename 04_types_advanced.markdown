# Types

## Nested Types

Types can have their own name inside the children array to create an unlimited tree of the same type. This is great if you want to create a basic wiki with an unlimited tree structure.

```js
var page {
  name: 'page',
  children: [ 'page' ],
  schema: {
    content: [ validators.required(), validators.string() ],
  }
};
```

## Reusing schemas

Example on how to reuse certain parts of a schema that you might use in multiple types.

```js
var seo = {
  page_title: [ validators.required(), validators.string() ],
  meta_description: [ validators.required(), validators.string() ],
};
```

With the help of an extend method (in this case _.extend) you can now reuse your SEO fields on multiple types.

```js
var extend = require('underscore').extend;

var page {
  name: 'page',
  children: [ 'page' ],
  schema: extend({
    content: [ validators.required(), validators.string() ],
  }, seo)
};
```

## Reusing form fields

As with the schemas and depending which template engine you use you can create reusable blocks for your templates as well.

```jade
// forms/_seo.jade

fieldset
  legend Seo

  label Title (Meaningful keywords)
  input(type='text', ng-model='data.title')

  label Description (Google snippet)
  input(type='text', ng-model='data.description')
```

This is an example using jade showing how you can reuse the seo fields. In your form template you can then use the following code:

```jade
// forms/page.jade

include _seo

fieldset
  legend Content
  label Info
  input(type='text', ng-model='data.info')
```
