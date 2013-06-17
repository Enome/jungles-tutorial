# 08 Front-end Helpers & Middleware - Advanced

## Helpers

### Navigation

Lets add the navigation helper to our `layout.jade` file for general navigation.

```jade
!{navigation(tree, 0, 0, current)}
```

You pass it `locals.tree`, `start level integer`, `end level integer` and `locals.current`. This helper returns a html list and will add a css class `selected` to all the node in the current path. If you are at `/projects/blog-site` it will set both `/projects` and `/projects/blog-site` as selected.

#### Sub Navigation

Since our `projects` page lists all the projects we can add the navigation helper to that page as well.

```jade
!{navigation(current.children, 0, 0, current)}
```

Here we pass it the current.children instead of the whole tree. You can also just loop the children and define your own markup.

```jade
ul
  each child in current.children
    li
      a(href=child.path)= child.name
```

### Markdown

Instead of just having a plain text field for our `project` type lets use markdown instead.

```jade
// project.jade

!{markdown(current.info)}
```

Now your editors can use markdown with the `data.info` field.

## Middleware

### Custom responses

The default behavior of the front-end middleware is to render a view with the same name as the type. If you want to customize this you can add a middleware function or array to overwrite this.

```js
var project = {
  name: 'project',
  form: 'forms/project',
  schema: {
    info: [ validators.required(), validators.string() ]
  },
  icon: { name: 'icon-file-alt', },
  middleware: function (req, res, next) {
    res.send(res.locals.current);
  },
};
```

If you now visit a `project` url it will send back JSON data instead of rendering a view. The `middleware` property is also great for when you want to adjust or create data before rendering. 

```js
var project = {
  /* ... */
  middleware: function (req, res, next) {
    res.locals.foo = 'bar';
    next();
  },
};
```

This will make `locals.foo` available in the rendered view. If you have to do something more complicated you can also pass in an array of middleware.

```js
var project = {
  /* ... */
  middleware: [ fooMiddleware, barMiddleware, /* ... */ ],
};
```

This is great to split your complexity into smaller middlewares.
