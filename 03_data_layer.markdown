# 03 Data layer

Jungles comes with two data layers `jungles-data-memory` and `jungles-data-postgres`. We'll use the memory storage for this tutorial since it doesn't need a database installed.

Add the Jungles module to the top of our app.js file.

```js
var jungles = require('jungles');
```

Now that we have our Jungles dependency we can add the memory data layer. Add this to the app.js file.

```js
var dal = jungles.data.memory([]);
```

The array parameter is the array that will store the data. If you don't want to reset your data on each server restart you could dump it and pass it to the data layer on start up.
