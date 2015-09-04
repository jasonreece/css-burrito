#!/usr/bin/env node

var Getopt = require('node-getopt');

var init = require('./libs/init.js');
var modules = require('./libs/modules.js');
var messages = require('./libs/messages.js');

var getopt = new Getopt([
  ['g', 'generate'],
  ['h', 'help'],
  ['m', 'module'],
  ['n', 'new'],
  ['r', 'remove'],
  ['l', 'list']
]);

// getopt, lets shut down your error messages, messages.helpMessage() will take care of this for you
getopt.error(function() {
  return;
});

// strip out the first two arguments: ['node', path/to/file]
var opt = getopt.parseSystem();

if ( opt.options.n || opt.options.new ) {
  // create a new instance of the burrito template
  init.generateDefault(opt.argv);
}

else if ( opt.options.g || opt.options.generate ) {
  // generate a custom template based off of the config file
  init.generateTemplate(opt.argv);
}

else if ( opt.options.m || opt.options.module ) {
  // add new file(s) to the modulesDirectory and the modulesImportFile
  modules.create(opt.argv);
}

else if ( opt.options.r || opt.options.remove ) {
  // remove file(s) from the modulesDirectory and the modulesImportFile
  modules.remove(opt.argv);
}

else if ( opt.options.l || opt.options.list ) {
  // list the file[s] in modules directory
  modules.list(opt.argv);
}

else {
  // show the help message
  messages.helpMessage();
}
