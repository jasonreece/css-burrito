#!/usr/bin/env node

var Getopt = require('node-getopt');

var createNewBurrito = require('./libs/create-new-burrito.js');
var createNewModules = require('./libs/create-new-modules.js');
var messages = require('./libs/messages.js');

var getopt = new Getopt([
  ['h', 'help'],
  ['m', 'module'],
  ['n', 'new']
]);

// getopt, lets shut down your error messages, messages.helpMessage() will take care of that
getopt.error( function() {
  return;
});

// parseSystem strips out the first two arguments: ['node', path/to/file]
var opt = getopt.parseSystem();

if ( opt.options.n || opt.options.new ) {
  // create a new instance of burrito
  createNewBurrito.init(opt.argv);
}

else if ( opt.options.m || opt.options.module ) {
  // create new file(s) and @import them into the _modules file.
  createNewModules.init(opt.argv);
}

else {
  // show the help message
  messages.helpMessage();
}
