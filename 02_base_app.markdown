# 02 Base App

`touch app.js` and add the following code.

```js
var http = require('http');
var express = require('express');

var app = express();

http.createServer(app).listen(3000, function () {
  console.log('http://0.0.0.0:3000');
});
```

If you run `node app.js` and visit the `/` you should get a `Cannot GET /` page.

## Views

`mkdir views` and add a view engine.

```js
app.set('view engine', 'jade');
app.set('views', __dirname + '/views');
```

Jungles uses app.render which means most engines should support.
