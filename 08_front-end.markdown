# 08 Front-end Helpers & Middleware

## Helpers

This module will add some helper functions to your views. I highly recommend the code checking out the code of this module. There isn't a lot of it and it can teach you some interesting techniques to write your own helpers.

```js
jungles.helpers.frontend(app);
```

## Middleware

`jungles-middleware-frontend` isn't a sub-app it just returns middleware for the route you specify.

```js
var frontend = jungles.middleware.frontend(rest);
app.get(':path(*)', frontend);
```

The front-end takes a reference to the rest layer so it can query the data.

## Content

Before explaining how the front-end works lets add some content we can use as an example. Add a projects type and name it `Projects` with one as the order. Then click on the Projects content item in the control panel and add a project with the name `blog site` and order as one again.

We now have the following content tree:

```
/projects
/projects/blog-site
```

Notice all the paths are lowercased and the names are slugified. You can view your data at `/administrator/api/instances`.

## Path

The url `':path(\*)'` is a catch all path. If you visit `/projects` it will pass that path to the middleware. The middleware will then query the rest layer with that path and add the result to locals.

## Locals

The middleware adds the following locals:

```js
locals.current = { /* .. */ }; // The content item matching this url.
locals.type = { /* .. */ };    // The current type.
locals.tree = { /* .. */ };    // The entire content tree.
```

## Views

By default the middleware will try and render a view that matches the same name as the current type. If we try and visit the `/projects` urls you should get a `Failed to lookup view "projects"`. So lets add the projects and project template to the views dir.

```sh
touch views/layout.jade
touch views/projects.jade
touch views/project.jade
```

When we now visit the urls you should get a blank page. Lets add some content to the templates to make sure everything is working.

### layout.jade

```jade
html
  body
    h1=current.name
    block content
```

### projects.jade

```jade
extend layout
block content
```

### project.jade

```jade
extend layout
block content
```

If you visit the urls you see the h1 title being equal to the current content item's name. The rest of the front-end website is up to you to extend to your liking. You probably want to add `express.static` and start adding css, js and images to your website.
