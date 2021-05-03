# Kids First Zeppelin Web Application

This application contains code for zeppelin frontend customization. Here the list of files we modified :
```
 src/app/home/home.css
 src/app/home/home.html
 src/app/jobmanager/jobmanager.css
 src/app/notebook/notebook.css
 src/assets/images/zeppelin-kf
 src/assets/images/zeppelin_svg_logo.svg
 src/components/navbar/navbar.css
 src/components/navbar/navbar.html
```

This application is built on top of Apache Zeppelin 0.9, tag v0.9-docker

## Development Guide 

### Local Development

It is recommended to install node 6.0.0+ since Zeppelin uses 6.9.1+ (see [creationix/nvm](https://github.com/creationix/nvm))

All build commands are described in [package.json](./package.json)

Before running this application, download and start zeppelin locally like describe [in official documentation](https://zeppelin.apache.org/docs/latest/quickstart/install.html)

```sh
# init submodules (only once)
$ git submodule update --init
# install required depepdencies and bower packages (only once)
$ npm install -g yarn
$ yarn install

# run frontend application only in dev mode (localhost:9000) 
# you need to run zeppelin backend instance also
$ yarn run dev
```

Supports the following options with using npm environment variable when running the web development mode.

```
# if you are using a custom port instead of default(8080), 
# you must use the 'SERVER_PORT' variable to run the web application development mode
$ SERVER_PORT=YOUR_ZEPPELIN_PORT yarn run dev

# if you want to use a web dev port instead of default(9000), 
# you can use the 'WEB_PORT' variable
$ WEB_PORT=YOUR_WEB_DEV_PORT yarn run dev
```

### Testing

```sh
# running unit tests
$ yarn run test

# running e2e tests: make sure that zeppelin instance started (localhost:8080)
$ yarn run e2e
```

- to write unit tests, please refer [Angular Test Patterns](https://github.com/daniellmb/angular-test-patterns)
- to write e2e tests, please refer [Protractor Tutorial](http://www.protractortest.org/#/tutorial#step-1-interacting-with-elements)

### Packaging 

If you want to package the zeppelin-web only, simply run this command in this folder.  
This will download all the dependencies including node (the binaries in the folder `zeppelin-web/node`)

```
$ mvn package 
```

