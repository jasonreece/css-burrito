'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.helpMessage = helpMessage;
exports.newProjectSuccessMessage = newProjectSuccessMessage;
exports.newProjectErrorMessage = newProjectErrorMessage;
exports.addModuleMessage = addModuleMessage;
exports.removeModuleMessage = removeModuleMessage;
exports.notEnoughArgsErrorMessage = notEnoughArgsErrorMessage;
exports.listSuccessMessage = listSuccessMessage;
exports.listErrorMessage = listErrorMessage;

var _chalk = require('chalk');

var _chalk2 = _interopRequireDefault(_chalk);

var _config = require('../config');

var _config2 = _interopRequireDefault(_config);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _asciiLogoColor(color, text) {
  return _chalk2.default[color](text);
}

function _asciiLogo(color, text) {
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
  console.log('  ///////....mmmmmmmmm ' + _asciiLogoColor(color, text) + ' mmmmmmmmm...///////////////');
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
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  ');
}

function _pluralizeMessage(fileNames, singularMessage, pluralMessage) {
  if (fileNames.length === 1) {
    console.log(singularMessage);
  } else {
    console.log(pluralMessage);
  }
}

function _logoSuccessMessage() {
  _asciiLogo('green', 'css-burrito');
}

function _logoErrorMessage() {
  _asciiLogo('red', 'css-burrito');
}

function _alertSuccessMessage() {
  console.log(_chalk2.default.green('  - - - - - - - - - - - - - success! - - - - - - - - - - - - - \n'));
}

function _alertErrorMessage() {
  console.log(_chalk2.default.red('  - - - - - - - - - - - - - uh-oh! - - - - - - - - - - - - - - \n'));
}

function helpMessage() {
  _logoSuccessMessage();
  console.log(_chalk2.default.green('  - - - - - - - - - how about a little help? - - - - - - - - - \n'));
  console.log('  to add a new instance of css-burrito into your project, run: \n');
  console.log('  ' + _chalk2.default.inverse(' burrito -n [folder name] ') + ' or ' + _chalk2.default.inverse(' burrito --new [folder name] ') + '\n');
  console.log('  to create files in the modules directory,\n');
  console.log('  and add them to the ' + _chalk2.default.underline((0, _config2.default)().moduleImportPath()) + ' file, run: \n');
  console.log('  ' + _chalk2.default.inverse(' burrito -m (module name[s]) ') + ' or ' + _chalk2.default.inverse(' burrito --module (folder name[s]) ') + '\n');
  console.log('  to list the files in the module directory, run:\n');
  console.log('  ' + _chalk2.default.inverse(' burrito -l ') + ' or ' + _chalk2.default.inverse(' burrito --list ') + '\n');
  console.log('  to delete files from the modules directory,\n');
  console.log('  and remove them from the ' + _chalk2.default.underline((0, _config2.default)().moduleImportPath()) + ' file, run: \n');
  console.log('  ' + _chalk2.default.inverse(' burrito -r (module name[s]) ') + ' or ' + _chalk2.default.inverse(' burrito --remove (folder name[s]) ') + '\n');
  console.log('  want to override defaults with a ' + _chalk2.default.underline('.cssburritorc') + ' file?\n');
  console.log('  check out the readme:  https://github.com/jasonreece/css-burrito\n');
}

function newProjectSuccessMessage() {
  _logoSuccessMessage();
  _alertSuccessMessage();
  console.log('  you have added css-burrito to your project\n');
  console.log('  you can find the project template here ' + _chalk2.default.underline((0, _config2.default)().stylesDirectoryPath()) + '\n');
  console.log('  css-burrito will also add new modules to the project for you.\n');
  console.log('  just run:\n');
  console.log('  ' + _chalk2.default.inverse(' burrito -m (module name[s]) ') + ' or ' + _chalk2.default.inverse(' burrito --module (folder name[s] ') + '\n');
  console.log('  the new modules will be added here: ' + _chalk2.default.underline((0, _config2.default)().moduleImportPath()) + '\n');
}

function newProjectErrorMessage() {
  _logoErrorMessage();
  _alertErrorMessage();
  console.log('  looks like you already have a project at ' + _chalk2.default.underline((0, _config2.default)().stylesDirectoryPath()) + '\n');
  console.log('  we didn\'t want to overwrite anything, so we just left it alone...\n');
  console.log('  if you need to create another instance of the template,\n');
  console.log('  please delete ' + _chalk2.default.underline((0, _config2.default)().stylesDirectoryPath()) + ' and try again\n');
  console.log('  need help? run:\n');
  console.log('  ' + _chalk2.default.inverse(' burrito -h ') + ' or ' + _chalk2.default.inverse(' burrito --help ') + '\n');
}

function addModuleMessage(successFiles, errorFiles) {
  if (successFiles.length) {
    _logoSuccessMessage();
    _pluralizeMessage(successFiles, '  you have created the following file:\n', '  you have created the following files:\n');

    successFiles.forEach(function (file) {
      return console.log(_chalk2.default.green('  _' + file + '.scss'));
    });

    console.log('');

    _pluralizeMessage(successFiles, '  and it has been imported into the project at:', '  and they have been imported into the project at:');

    console.log('  ' + _chalk2.default.underline((0, _config2.default)().moduleImportPath()) + '\n');
  } else {
    _logoErrorMessage();
    _alertErrorMessage();
  }

  if (errorFiles.length) {
    _pluralizeMessage(errorFiles, '  we tried to make the following file:\n', '  we tried to make the following files:\n');

    errorFiles.forEach(function (file) {
      return console.log(_chalk2.default.red('  _' + file + '.scss'));
    });

    console.log('');

    _pluralizeMessage(errorFiles, '  but, the thing is, that file already exists...  so, we just left it alone.\n', '  but, the thing is, these files already exist...  so, we just left em alone.\n');
  }
}

function removeModuleMessage(successFiles, errorFiles) {
  if (successFiles.length) {
    _logoSuccessMessage();
    _pluralizeMessage(successFiles, '  you have removed the following file from your project\n', '  you have removed the following files from your project\n');

    successFiles.forEach(function (file) {
      return console.log(_chalk2.default.green('  _' + file + '.scss'));
    });

    console.log('');

    _pluralizeMessage(successFiles, '  and it has also been removed from', '  and they have also been removed from');

    console.log('  ' + _chalk2.default.underline((0, _config2.default)().moduleImportPath()) + '\n');
  } else {
    _logoErrorMessage();
    _alertErrorMessage();
  }

  if (errorFiles.length) {
    _pluralizeMessage(errorFiles, '  we couldn\'t find a file named: \n', '  we couldn\'t find any files named: \n');

    errorFiles.forEach(function (file) {
      return console.log(_chalk2.default.red('  _' + file + '.scss'));
    });

    console.log('');

    _pluralizeMessage(errorFiles, '  so... if you want to make it first, i guess we can delete it after that?\n', '  so... if you want to make them first, i guess we can delete them after that?\n');
  }
}

function notEnoughArgsErrorMessage() {
  _logoErrorMessage();
  _alertErrorMessage();
  console.log('  looks like you need at least one more argument\n');
  console.log('  need help?  try running:\n');
  console.log('  ' + _chalk2.default.inverse(' burrito -h ') + ' or ' + _chalk2.default.inverse(' burrito --help ') + '\n');
}

function listSuccessMessage(fileNames) {
  _logoSuccessMessage();
  _pluralizeMessage(fileNames, '  You currently have the following file in your', '  You currently have the following file in your');

  console.log('  ' + _chalk2.default.underline((0, _config2.default)().moduleDirectoryPath()) + ' directory\n');

  fileNames.forEach(function (fileName) {
    return console.log('  ' + _chalk2.default.green(fileName));
  });

  console.log('');
}

function listErrorMessage() {
  _logoErrorMessage();
  console.log('  looks like the ' + _chalk2.default.underline((0, _config2.default)().moduleDirectoryPath()) + ' directory is currently empty.\n');
  console.log('  to add some module files, run:\n');
  console.log('  ' + _chalk2.default.inverse(' burrito -m (module name[s]) ') + ' or ' + _chalk2.default.inverse(' burrito --module (folder name[s] ') + '\n');
}