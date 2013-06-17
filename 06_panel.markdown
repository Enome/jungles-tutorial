# 06 Panel

Aaah, finally we can add the control panel and start adding data. Jungles-panel is a sub-app as well so lets initialize and mount it.

```js
var panel = jungles.panel({
  url: '/administrator/api',
});

app.use('/administrator', panel);
```

The url points at our rest layer so the panel knows where to post data. If we visit `/administrator` we should be able to see the control panel. If everything went well we can add `projects` types to the root of our website and `project` types to `projects`. 

## Name and Order fields

Each type will always have these two fields by default. The name field is the `name` of the content item and is also used for the path (slugified). The `order` field is an integer that lets you order the content at this level in the tree. 
