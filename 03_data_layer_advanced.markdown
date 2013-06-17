# 03 Data layer - Advanced

## Postgres

To install Postgres you can either use your OS package manager to globally install it but we recommend using vagrant. To install vagrant check out the following [guide](http://docs.vagrantup.com/v2/installation/index.html).

Once you have vagrant install you can start the VM with:

```sh
vagrant up
```

If you want to stop your vm run `vagrant halt` and if you want to destroy it run `vagrant destroy`.

Next replace the jungles-data-memory with the following:

```js
var dal = jungles.data.postgres({
  database: 'jungles',
  user: 'jungles',
  password: '1234',
  host: 'localhost',
  port: '5432',
});

dal.setup();
```

The setup method will check if the database is up to date. That way if we change something in the future your database will update itself.
