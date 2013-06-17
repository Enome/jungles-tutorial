# 01 Installation

I am going to assume you already have Node.js + NPM install on your system. If you don't have it yet take a look at this [guide](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager).

Lets setup a project directory first.

```sh
mkdir portfolio
cd portfolio
```

Next we'll init a NPM module.

```sh
npm init
```

This will create an package.json which we'll use to save our dependencies.

```sh
npm install express, jade, jungles --save
```

Now that we have our dependencies and project directory lets create a base application next.
