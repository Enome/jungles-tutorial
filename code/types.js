var validators = require('jungles').validators;

var root = {
  name: 'root',
  children: [ 'projects' ],
};

var projects = {
  name: 'projects',
  children: [ 'project' ],
  icon: { name: 'icon-folder-open-alt', }
};

var project = {
  name: 'project',
  form: 'forms/project',
  schema: {
    info: [ validators.required(), validators.string() ]
  },
  icon: { name: 'icon-file-alt', }
};

module.exports = [ root, projects, project ];
