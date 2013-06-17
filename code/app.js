var http = require('http');
var express = require('express');
var jungles = require('jungles');

// Base app

var app = express();

// Views

app.set('view engine', 'jade');
app.set('views', __dirname + '/views');

// Cookies

app.use(express.cookieParser());
app.use(express.cookieSession({ secret: "MyLittleSecret" }));

// Auth & Auth

app.use('/administrator', jungles.auth.simple('/login', ['geert.pasteels@gmail.com']));
app.use('/login', jungles.auth.persona());

// Data Layer

var dal = jungles.data.memory([]);

/*
var dal = jungles.data.postgres({
  database: 'jungles',
  user: 'jungles',
  password: '1234',
  host: 'localhost',
  port: '5432',
});

dal.setup();
*/

// Rest

var rest = jungles.rest({ data: dal, types: require('./types') });
app.use('/administrator/api', rest);

// Panel

var panel = jungles.panel({
  url: '/administrator/api',
});

app.use('/administrator', panel);

// Helpers

jungles.helpers.frontend(app);

// Front-end

app.get(':path(*)', jungles.middleware.frontend(rest));

// Errors

jungles.errors(app);

// Create & start server

http.createServer(app).listen(3000, function () {
  console.log('http://0.0.0.0:3000');
});
