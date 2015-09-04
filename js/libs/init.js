var fs = require('fs');
var path = require("path");
var wrench = require('wrench');

var config = require('./config.js');
var messages = require('./messages.js');
var text = require('./text.js');

var configFile = './css-burrito-config.json';

module.exports = {
  generateDefault: function(options){
    // setting defaults
    var sassDirectory = options[0] || 'stylesheets';
    var sassImportFile = options[1] || 'application.scss';
    var pathToSassDirectory = options[2] || './';
    var modulesDirectory = 'modules';
    var modulesImportFile = '_modules.scss';

    // if too many options were passed in provide an error message and exit
    if (options.length > 3) {
      messages.hasTooManyArgsError();
      return;
    }

    // if there is already a css-burrito-config.json file, provide an error message and exit
    if ( itemExists(fs.readFileSync, configFile,'utf8') ) {
      messages.hasConfigError();
      return;
    }

    // if the template has already been created, provide an error
    if ( itemExists(fs.readdirSync, path.join(pathToSassDirectory, sassDirectory)) ) {
      messages.projectExistsError(path.join(pathToSassDirectory, sassDirectory));
      return;
    }

    // copy a new instance of the burrito template
    copyTemplate(pathToSassDirectory, sassDirectory);

    // write the css-burrito-config.json file
    config.write(sassDirectory, sassImportFile, modulesDirectory, modulesImportFile, pathToSassDirectory);

    // set the main application file to sassImportFile
    renameImportFile(pathToSassDirectory, sassDirectory, sassImportFile);

    // display a success message
    messages.newBurritoSuccess();
  },

  generateTemplate: function(options) {
    // if too many options were passed in provide an error message and exit
    if (options.length > 0) {
      messages.hasTooManyArgsError();
      return;
    }

    // if there isn't a configFile, provide an error
    if ( ! itemExists(fs.readFileSync, configFile,'utf8') ) {
      messages.needConfigError();
      return;
    }

    // if the template has already been created, provide an error
    if ( itemExists(fs.readdirSync, path.join(config.getPath().sassDirectory)) ) {
      messages.projectExistsError(path.join(config.getPath().sassDirectory));
      return;
    }

    // create the template files and folders
    generateTemplate();

    // create the module files and folder
    generateModules();

    // display a success message
    messages.newBurritoSuccess();
  }
};

// copies stylesheet folder into users project using wrench
function copyTemplate(pathToSassDirectory, sassDirectory) {
  wrench.mkdirSyncRecursive(pathToSassDirectory, 0777);
  wrench.copyDirSyncRecursive(path.join(__dirname, '..', '..', '/stylesheets/'), path.join(pathToSassDirectory, sassDirectory));
}

// renames application.scss file to users custom name
function renameImportFile() {
  fs.renameSync(path.join(config.getPath().sassDirectory, 'application.scss'), path.join(config.getPath().sassImportFile));
}

// checks to see if the template already exists
function itemExists(fn, item) {
  try {
    fn(item);
  } catch( err ) {
    // if the item doesn't exist, return false
    if( err ) {
      return false;
    }
  }
  // otherwise, return true
  return true;
}

// generates the users custom template based on the configFile
function generateTemplate(template) {
  // get reference to directories and files
  var directories = config.read().template.directories;
  var files = config.read().template.files;
  // create sass directory
  wrench.mkdirSyncRecursive(config.getPath().sassDirectory, 0777);
  // create sass import file
  fs.writeFileSync(path.join(config.getPath().sassImportFile), text.sassImportFileText());

  directories.map(function(directory) {
    wrench.mkdirSyncRecursive(path.join(config.getPath().sassDirectory, directory), 0777);
    directory += '/';

    // then loop through the files to set up file structure
    files.map(function(file) {
      if (file.indexOf(directory) > -1 ) {
        file = file.slice(directory.length );
        if ( file.split('/').length === 1) {
          fs.writeFileSync(path.join(config.getPath().sassDirectory, directory, file), text.createFileText(file));
        }
      }
    });
  });
}

// generates the modules directory based on the configFile
function generateModules() {
  var moduleFiles = config.read().settings.modules.moduleFiles;
  // create modules directory
  wrench.mkdirSyncRecursive(config.getPath().modulesDirectory, 0777);
  // create modules import file
  fs.writeFileSync(path.join(config.getPath().modulesImportFile), text.updateModuleText(moduleFiles));

  // write out module files
  moduleFiles.map(function(file) {
    fs.writeFileSync(path.join(config.getPath().modulesDirectory, file), text.createFileText(text.sanitize(file)));
  });
}
