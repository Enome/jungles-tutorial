# 11 Deployment

The last step is to put our website online. In this example we are going to use nodejitsu since it's so easy to setup. You can of course use your own servers to host your website.

First we need to install nodejitsu:

```sh
npm install jitsu -g
```

Second we'll have to sign up:

```sh
jitsu signup
```

Follow the instructions given by nodejitsu.

Last step is to deploy the application:

```sh
jitsu deploy
```

Again follow the instructions, pretty easy no? There is one gotcha though nodejitsu doesn't support Postgres so will have to host a database somewhere else. It's very likey that in the future Jungles will have a MongoDB data layer as well.
