# 05 Rest

The rest layer sits between the data layer and the control panel. It uses the types to validate/sanitize and the data layer to create data.

```js
var rest = jungles.rest({ data: dal, types: require('./types'), });
app.use('/administrator/api', rest);
```

It's a sub-app so we need to mount it to our base application. You can change the url but it's recommended you put both the rest layer and the control panel behind the same base url, in this case `/administrator/*`. That way when we add authorization we can target `/administrator/*`.

If you visit `/administrator/api/instances` or `/administrator/api/types` you should get see JSON strings being returned. `/instances` will be empty because we didn't add content yet and `/types` will return the defined types.
