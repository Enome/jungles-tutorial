# 09 Errors

This middleware is optional as well but it's great for quickly having pretting error pages. You pass it your app object and it will add some middleware to handle most errors.

```js
jungles.errors(app);
```

Make sure that this is the last middleware in your stack so it will catch 404 errors as well. If you visit a non-existing urls you now should get a pretty 404 error page.
