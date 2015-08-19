var fs = require('fs');
var chalk = require('chalk');

var config = require('./config.js');

module.exports = {
  newBurritoSuccess: function() {
    success();
    console.log('  you have added css-burrito to your project');
    console.log('  your main stylesheet folder is named ' + chalk.underline(config.readConfig().name + '\n'));
    console.log('  css-burrito will also add new modules to the project for you. \n');
    console.log('  just run: \n');
    console.log('  ' + chalk.inverse(' burrito -m (module-name[s]) ') + '\n');
    console.log('  the new modules will be added here: ' + chalk.underline(config.readConfig().path + '_modules.scss\n'));
    console.log('  need to change where new modules are added? ');
    console.log('  just edit the path in the ' + chalk.underline('css-burrito-config.json') + ' file\n');
    console.log('  need help?  try running:\n');
    console.log('  ' + chalk.inverse(' burrito -h ') + '\n');
    console.log('  for more info, check out the readme:  https://github.com/jasonreece/css-burrito\n');
  },

  newModuleSuccess: function(fileNames){
    success();
    // fix the plurals
    if( fileNames.length === 1) {
      console.log('  you have created the following file:\n');
    } else {
      console.log('  you have created the following files:\n');
    }
    // list the created files
    fileNames.map(function(file) {
      console.log(chalk.green('  _' + file + '.scss'));
    });
    console.log('');
    // fix the plurals
    if( fileNames.length === 1) {
      console.log('  and it has been imported into the project at:');
      console.log('  ' + chalk.underline(config.readConfig().path + '_modules.scss\n'))
    } else {
      console.log('  and they have been imported into the project at:');
      console.log('  '  + chalk.underline(config.readConfig().path + '_modules.scss\n'))
    }
  },

  helpMessage: function() {
    logo('blue', ' css-burrito ');
    console.log(chalk.blue('  - - - - - - - - - how about a little help? - - - - - - - - - \n'));
    help();
  },

  hasConfigError: function() {
    error();
    console.log('  looks like you already have a css-burrito-config.json file.');
    console.log('  if you need to create another template, please delete the config and run: \n');
    console.log('  ' + chalk.inverse(' burrito -n (folder-name) ' + '\n'));
  },

  hasTooManyArgsError: function() {
    error();
    console.log('  looks like you passed in too many arguments.\n');
    help();
  },

  newModuleArguments: function() {
    error();
    console.log('  looks like you need at least one more argument\n');
    help();
  },

  fileExistsError: function(fileNames) {
    error();
    if ( fileNames.length === 1 ) {
      console.log('  looks like the following file already exists in the project: \n');
    } else {
      console.log('  looks like the following files already exist in the project: \n');
    }
    fileNames.map(function(file) {
      console.log(chalk.red('  _' + file + '.scss'));
    });
    console.log('');
    console.log('  no files were created to make sure nothing was overwritten \n');
  }
};

function error(){
  logo('red', ' css-burrito ');
  console.log(chalk.red('  - - - - - - - - - - - - - uh-oh! - - - - - - - - - - - - - - \n'));
}

function success() {
  logo('green', ' css-burrito ');
  console.log(chalk.green('  - - - - - - - - - - - - - success! - - - - - - - - - - - - - \n'));
}

function setMessageColor(color, text) {
  var messageColor = chalk[color](text);
  return messageColor;
}


function logo(color, text){
  console.log('  ');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  //////////////////////////////////........./////////////////');
  console.log('  ///////////////////////////////.....mmmmm....///////////////');
  console.log('  /////////////////////////////.....mmmmmmmmmm.../////////////');
  console.log('  //////////////////////////.....mmmmmmmmmmmmmmmm...//////////');
  console.log('  ////////////////////////.....mmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  //////////////////////.....mmmmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  ////////////////////....mmmmmmmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  ///////////////////...mmmmmmmmmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  /////////////////....mmmmmmmmmmmmmmmmmmmmmmmmmm..../////////');
  console.log('  ///////////////....mmmmmmmmmmmmmmmmmmmmmmmmmmm....//////////');
  console.log('  ////////////.....mmmmmmmmmmmmmmmmmmmmmmmmmmm....////////////');
  console.log('  /////////....mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm..../////////////');
  console.log('  ///////....mmmmmmmmm' + setMessageColor(color, text) + 'mmmmmmmmm...///////////////');
  console.log('  //////...........mmmmmmmmmmmmmmmmmmmmmmm....////////////////');
  console.log('  //////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////');
  console.log('  //////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////');
  console.log('  ////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////');
  console.log('  /////////.....mmmmmmm....mmmmmmm....////////////////////////');
  console.log('  ///////////....mmmmmmm....mmmm....//////////////////////////');
  console.log('  /////////////....mmmmmm...mm....////////////////////////////');
  console.log('  ///////////////....mmmmm......//////////////////////////////');
  console.log('  /////////////////........../////////////////////////////////');
  console.log('  /////////////////////....///////////////////////////////////');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  ////////////////////////////////////////////////////////////\n');
}

function help() {
  console.log('  to add a new instance of css-burrito into your project, run: \n');
  console.log('  ' + chalk.inverse(' burrito -n [folder name] ') + ' or ' + chalk.inverse(' burrito --new [folder name] \n'));
  console.log('  to create new module files, and @import them into the project, run: \n');
  console.log('  ' + chalk.inverse(' burrito -m (module name[s]) ') + ' or ' + chalk.inverse(' burrito --module (folder name[s]) \n'));
  console.log('  need to change where new modules are added?');
  console.log('  just edit the path in the ' + chalk.underline('css-burrito-config.json') + ' file\n');
  console.log('  for more info, check out the readme:  https://github.com/jasonreece/css-burrito\n');
}
