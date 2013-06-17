# Jungles CMS - Tutorial

In this tutorial you'll learn how to setup your own basic portfolio site using [Jungles CMS](https://github.com/Enome/jungles). For this tutorial you'll need to know Node.js, NPM and Express.js. The code for this tutorial can be found in the **/code** directory.

Since most of the Jungles parts are sub-apps, middleware and modules it's really easy to include it in an already existing Node.js HTTP server application.

# Need help or want to help?

If you need help or want to help, discovered bugs, typos or random weirdness don't hesitate and contact me:

- IRC: pickels at freenode #jungles
- Github: You can use the issues page
- Twitter: @enome 
- Email: geert.pasteels@gmail.com

## Demo

You can find the back-end [here](http://enome-code.nodejitsu.com/administrator). The front-end depends on the content, if there is a content item named `Projects` than you can find it at `/projects`.

## Structure

Jungles stores it's data inside a hierarchical tree so before starting on our project it's recommended to have some sort of blueprint on how our tree is going to be structured.

```
- Root
-- Projects (list)
--- Project-01 (detail)
--- Project-02 (detail)
--- Project-03 (detail)
```
