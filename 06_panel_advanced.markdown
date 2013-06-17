# Panel

## Icons

You might have noticed how the types and content items have a dark file icon. For something like a container type you probably want to have a folder icon. You can change the icon of a type in the type configuration.

```js
var projects = {
  name: 'projects',
  children: [ 'project' ],
  icon: {
    name: 'icon-folder-open-alt',
    color: '#6ED2DD',
  }
};

var project = {
  name: 'project',
  form: 'forms/project',
  schema: {
    info: [ validators.required(), validators.string() ]
  },
  icon: {
    name: 'icon-file-alt',
    color: 'black',
  }
};
```

Since `jungles-panel` uses fontawesome 3.2 we can use all the [icons](http://fortawesome.github.io/Font-Awesome/icons/) that are included in the font. Both the name and color are optional.

## Files and Upload

`jungles-files` and `jungles-components` coming soon.
