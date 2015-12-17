/*jshint node:true*/
/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    fingerprint: {
      exclude: ['main.js'],
    },
  });

  // Use `app.import` to add additional libraries to the generated
  // output files.
  //
  // If you need to use different assets in different
  // environments, specify an object as the first parameter. That
  // object's keys should be the environment name and the values
  // should be the asset to use in that environment.
  //
  // If the library that you are including contains AMD or ES6
  // modules that you would like to import into your application
  // please specify an object with the list of modules as keys
  // along with the exports of each module as its value.

  app.import("bower_components/bootstrap/dist/css/bootstrap.css");
  app.import("vendor/libs/phaser.js");
  app.import("vendor/libs/pilasengine.js");
  app.import("vendor/libs/browser.js");


  // Iconos
  app.import("vendor/ionicons2/css/ionicons.css");
  app.import("vendor/ionicons2/fonts/ionicons.eot", {destDir: "fonts"});
  app.import("vendor/ionicons2/fonts/ionicons.svg", {destDir: "fonts"});
  app.import("vendor/ionicons2/fonts/ionicons.ttf", {destDir: "fonts"});
  app.import("vendor/ionicons2/fonts/ionicons.woff", {destDir: "fonts"});
  app.import("vendor/raleway.woff2");

  return app.toTree();
};
