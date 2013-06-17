# 04 Types

A type is a configuration object that describes the name of your content types and lets you define validation and sanitization. We recommend to not add this in the app.js file because it can get messy if you have a lot of types. So lets create a `types.js` files and define our types.

```sh
touch types.js
```

## Configuration

For our portfolio site we'll need a **projects** and **project** type.

```js
var root = {
  name: 'root',
  children: [ 'projects' ],
};

var projects = {
  name: 'projects',
  children: [ 'project' ],
};

var project = {
  name: 'project',
};
```

### Root type

This type is a special type and is used as a starting point for our control panel. If you wouldn't define a root type you wouldn't be able to create any content in the back-end. This type also doesn't save any data inside the database. 

### Children

`type.children` is an array of strings with the name of the types that are allowed to be created as child data. This is to make sure your content editors don't create data in places you aren't expecting. For example if you have projects + project and products + product you don't want your editors to be able to create a project inside products or a product inside projects.

## Forms

The `projects type` is just a container type to hold the `project type` so it wont need any extra data/form. For project we need a form to be able to add extra data.

```js
var project = {
  name: 'project',
  form: 'forms/project',
};
```

The form property takes a path to your view template. We defined the view engine before and it points to the `/views` directory. Create a jade file at `/views/forms/project.jade`. Express.js doesn't need an extension if you defined the view engine.

We are keeping it simple and just giving our projects one text area which we'll use to to give some information about our projects.

```jade
fieldset
  legend Content

  div
    label Info
    textarea(ng-model='data.info', required)
```

It's important that you keep the structure of your forms somewhat the same as the example because that's what the css of jungles-panel is expecting. Use the `fieldset` to group related data and the `legend` to add a title for each section.

The `required` attribute will make sure that you can't click the save button when the text area is empty. This is optional but it's nice to give your editors real time feedback.

The panel uses Angular.js which is why we have to define `ng-model='data.info'`. The `data` object is the model of the form and the property `info` is the name of the field that gets posted to the rest layer.

### Validation, sanitization & schemas

#### Validation

While the client-side validation is optional it's recommended to always add server-side validation. In the future you might want to talk to the jungles-rest directly without jungles-panel.

Jungles comes with serveral validators so lets import the module and add the `info` field validators.

```js
var validators = require('jungles').validators;
```

```js
var project = {
  name: 'project',
  form: 'forms/project',
  schema: {
    info: [ validators.required() ]
  }
};
```

The schema property is used for validation and the `schema.info` relates to the name we set in our form `ng-model='data.info'`. 

#### Sanitization

In jungles you need to white list all the fields you want to store. If we would try and create data with the schema from above the info details wouldn't be stored. Sanitizers use the same syntax as validators and sometimes a validator will also sanitize the data. For example `validators.integer` will check if the string is an integer and cast it to Javascript number.

Since our info field is a string we'll have to extend `schema.info` with the string sanitizer.

```js
schema: {
  info: [ validators.required(), validators.string() ]
}
```

The last step is to export the types so we can use them in our app.js file.

```js
module.exports = [ root, projects, project ];
```
