# 10 Authorization & Authentication

To quickly have some auth and auth you can use `jungles.auth.simple` and `jungles.auth.persona`. As with many parts of Jungles this is all optional and you can use your own modules if you prefer.

## Authorization

```js
app.use('/administrator', jungles.auth.simple('/login', ['you@email.com']));
```

This middleware will redirect to `/login` when `req.session.user` doesn't match any of the strings inside the array.

## Authentication

```js
app.use('/login', jungles.auth.persona());
```

This sub-app will use Mozilla Persona to authenticate you and set `req.session.user` to your Persona email address. To destroy the session visit `/login/logout`.

## Sessions

Because this uses sessions don't forget to set a session middleware in your base app. For 99% of the use cases `express.cookieSession` will be more than enough.

```js
app.use(express.cookieParser());
app.use(express.cookieSession({ secret: "MyLittleSecret" }));
```
