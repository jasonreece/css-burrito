var fs = require('fs');
var chalk = require('chalk');

var config = require('./config.js');

module.exports = {
  newBurritoSuccess: function() {
    logoSuccess();
    alertSuccess();
    console.log('  you have added css-burrito to your project\n');
    console.log('  your sass directory is named ' + chalk.underline(config.getPath().sassDirectory + '\n'));
    console.log('  your sass import file is named ' + chalk.underline(config.read().settings.root.sassImportFile + '\n'));
    console.log('  css-burrito will also add new modules to the project for you. \n');
    console.log('  just run: \n');
    console.log('  ' + chalk.inverse(' burrito -m (module name[s]) ') + ' or ' + chalk.inverse(' burrito --module (folder name[s]) \n'));
    console.log('  the new modules will be added here: ' + chalk.underline(config.getPath().modulesDirectory + '/_modules.scss\n'));
    console.log('  need to change where new modules are added? ');
    console.log('  just edit the ' + chalk.underline('css-burrito-config.json') + ' file\n');
    needHelp();
    console.log('  for more info, check out the readme:  https://github.com/jasonreece/css-burrito\n');
  },

  newModuleSuccess: function(successFiles, errorFiles){
    if ( successFiles.length ) {
      logoSuccess();
      alertSuccess();

      pluralizeMessage(successFiles,
        '  you have created the following file:\n',
        '  you have created the following files:\n'
      );

      // list the created files
      successFiles.forEach(function(file) {
        console.log(chalk.green('  _' + file + '.scss'));
      });

      pluralizeMessage(successFiles,
        '\n  and it has been imported into the project at:\n  ' + chalk.underline(config.getPath().modulesDirectory + '/_modules.scss\n'),
        '\n  and they have been imported into the project at:\n  '  + chalk.underline(config.getPath().modulesDirectory + '/_modules.scss\n')
      );
    }

    else {
      logoError();
    }

    if( errorFiles.length ) {
      pluralizeMessage(errorFiles,
        '  we tried to make the following file:\n',
        '  we tried to make the following files:\n'
      );

      errorFiles.forEach(function(file) {
        console.log('  ' + chalk.red('_' + file + '.scss'));
      });

      pluralizeMessage(errorFiles,
        '\n  but, the thing is, that file already exists...  so, we just left it alone.\n',
        '\n  but, the thing is, these files already exist...  so, we just left em alone.\n'
      );
    }

  },

  listModuleFiles: function(fileNames) {
    logoSuccess();
    pluralizeMessage( fileNames,
      '  You currently have the following file in your\n  ' + chalk.underline(config.getPath().modulesDirectory) + ' directory\n',
      '  You currently have the following files in your\n  ' + chalk.underline(config.getPath().modulesDirectory) + ' directory\n'
    );

    fileNames.forEach(function(file) {
      console.log('  ' + chalk.green('_' + file + '.scss'));
    });

    console.log('');
  },

  listIsEmpty: function() {
    logo('white', ' css-burrito ');
    console.log('  looks like the ' + chalk.underline(config.getPath().modulesDirectory) + ' directory is currently empty.\n');
  },

  removeModuleFiles: function(successFiles, errorFiles) {
    // display success or error
    if ( successFiles.length > 0 ) {
      logoSuccess();
    }
    else {
      logoError();
    }

    if ( successFiles.length ) {
      alertSuccess();
      pluralizeMessage(successFiles,
        '  you have removed the following file from your ' + chalk.underline(config.getPath().modulesDirectory) + ' directory\n',
        '  you have removed the following files from your ' + chalk.underline(config.getPath().modulesDirectory) + ' directory\n'
      );
    }

    // list the deleted files
    successFiles.forEach(function(file) {
      console.log('  ' + chalk.green('_' + file + '.scss'));
    });

    console.log('');

    if ( errorFiles.length > 0 ) {
      alertError();
      pluralizeMessage(errorFiles,
        '  we couldn\'t find a file named: \n',
        '  we couldn\'t find any files named: \n'
      );

      // list the errors
      errorFiles.forEach(function(errorFile) {
        console.log('  ' + chalk.red('_' + errorFile + '.scss'));
      });

      pluralizeMessage(errorFiles,
        '\n  so.... if you want to make it first, i guess we can delete it after that?\n',
        '\n  so.... if you want to make them first, i guess we can delete them after that?\n'
      );
    }
  },

  helpMessage: function() {
    logoSuccess();
    alertHelp();
    helpMessage();
  },

  hasConfigError: function() {
    logoError();
    alertError();
    console.log('  looks like you already have a css-burrito-config.json file\n');
    console.log('  if you need to create another instance of the template,\n');
    console.log('  please delete the config and try again  \n');
    console.log('  need help? run:\n');
    console.log('  ' + chalk.inverse(' burrito -h ') + ' or ' + chalk.inverse(' burrito --help \n'));
  },

  needConfigError: function() {
    logoError();
    alertError();
    console.log('  looks like you don\'t have a css-burrito-config.json file\n');
    console.log('  you\'ll need to create one before you can generate a new project\n');
    console.log('  need help? run:\n');
    console.log('  ' + chalk.inverse(' burrito -h ') + ' or ' + chalk.inverse(' burrito --help \n'));
  },

  projectExistsError: function(projectName) {
    logoError();
    alertError();
    console.log('  looks like you have already generated a project named ' + projectName);
    console.log('  we don\'t want to overwrite anything, so we just left it alone...\n');
    console.log('  need help? run:\n');
    console.log('  ' + chalk.inverse(' burrito -h ') + ' or ' + chalk.inverse(' burrito --help \n'));
  },

  hasTooManyArgsError: function() {
    logoError();
    alertError();
    console.log('  looks like you passed in too many arguments.\n');
    needHelp();
  },

  notEnoughArgsError: function() {
    logoError();
    alertError();
    console.log('  looks like you need at least one more argument\n');
    needHelp();
  }
};

function helpMessage() {
  console.log('  to add a new instance of css-burrito into your project, run: \n');
  console.log('  ' + chalk.inverse(' burrito -n [folder name] ') + ' or ' + chalk.inverse(' burrito --new [folder name] \n'));
  console.log('  to create files in the modules directory,\n  and add them to the ' + chalk.underline(config.getPath().modulesImportFile) + ' file, run: \n');
  console.log('  ' + chalk.inverse(' burrito -m (module name[s]) ') + ' or ' + chalk.inverse(' burrito --module (folder name[s]) \n'));

  console.log('  to list the files in the module directory, run:\n')
  console.log('  ' + chalk.inverse(' burrito -l ') + ' or ' + chalk.inverse(' burrito --list \n'));
  console.log('  to delete files from the modules directory,\n  and remove them from the ' + chalk.underline(config.getPath().modulesImportFile) + ' file, run: \n');
  console.log('  ' + chalk.inverse(' burrito -r (module-file[s]) ') + ' or ' + chalk.inverse(' burrito --remove (module-file[s]) \n'));
  console.log('  need to change how things are organized?');
  console.log('  just edit the ' + chalk.underline('css-burrito-config.json') + ' file, and run: \n');
  console.log('  ' + chalk.inverse(' burrito -g ') + ' or ' + chalk.inverse(' burrito --generate \n'));
  console.log('  for more info, check out the readme:\n  https://github.com/jasonreece/css-burrito\n');
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

// sets the text color and text for logoSuccess and logoError
function setMessageColor(color, text) {
  var messageColor = chalk[color](text);
  return messageColor;
}

function logoSuccess() {
  logo('green', ' css-burrito ');
}

function logoError(){
  logo('red', ' css-burrito ');
}

function alertSuccess() {
  console.log(chalk.green('  - - - - - - - - - - - - - success! - - - - - - - - - - - - - \n'));
}

function alertError() {
  console.log(chalk.red('  - - - - - - - - - - - - - uh-oh! - - - - - - - - - - - - - - \n'));
}

function alertHelp() {
 console.log(chalk.green('  - - - - - - - - - how about a little help? - - - - - - - - - \n'));
}

function needHelp() {
  console.log('  need help?  try running:\n');
  console.log('  ' + chalk.inverse(' burrito -h ') + ' or ' + chalk.inverse(' burrito --help \n'));
}

function pluralizeMessage( fileNames, singularMessage, pluralMessage ) {
  if ( fileNames.length === 1 ) {
    console.log(singularMessage);
  }
  else {
   console.log(pluralMessage);
  }
}
