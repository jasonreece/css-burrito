var fs = require('fs');
var path = require("path");

var config = require('./config.js');
var messages = require('./messages.js');
var text = require('./text.js');

module.exports = {
  create: function(arguments) {
    if ( arguments.length === 0 ) {
      messages.notEnoughArgsError();
      return;
    }

    // call compareFiles on the passed in arguments
    var passedInArgs = compareFiles(arguments);

    // create any passed in files that don't already exist
    createFiles(passedInArgs.mismatchingFiles);

    // update the config file
    config.update();

    // update the moduleImportFile file
    updateModulefile(config.read().settings.modules.moduleFiles);

    // provide a success message for any passedInArgs.mismatchingFiles files
    // provide an error message for any passedInArgs.matchingFiles files
    messages.newModuleSuccess(passedInArgs.mismatchingFiles, passedInArgs.matchingFiles);
  },

  list: function(arguments) {
    // check for too many arguments
    if ( arguments.length > 0 ) {
      messages.hasTooManyArgsError();
      return;
    }

    if ( getModuleFiles().length === 0 ){
      messages.listIsEmpty();
    }

    else {
      messages.listModuleFiles(getModuleFiles());
    }
  },

  remove: function(arguments) {
    // check for too many arguments
    if ( arguments.length === 0 ) {
      messages.notEnoughArgsError();
      return;
    }

    // call compareFiles on the passed in arguments
    var passedInArgs = compareFiles(arguments);

    // if any passed in arguments exist in the module directory, delete em
    if ( passedInArgs.matchingFiles.length ) {
      removeFiles(passedInArgs.matchingFiles);
    }

    // update the config file
    config.update();

    // update the modulesImportFile file
    updateModulefile(config.read().settings.modules.moduleFiles);

    // provide a success message for any passedInArgs.matchingFiles files
    // provide an error message for any passedInArgs.mismatchingFiles files
    messages.removeModuleFiles(passedInArgs.matchingFiles, passedInArgs.mismatchingFiles);
  }
};

// reads the config and returns a sanitized array of the module files
function getModuleFiles() {
  var modulesDirectory = config.read().settings.modules.moduleFiles;
  var modulesArray = [];
  modulesDirectory.forEach(function(file) {
    file = text.sanitize(file);
    modulesArray.push(file);
  });

  return modulesArray;
}

function compareFiles(fileNames) {
  // create an object to store the arrays to compare
  var compareFilesObj = {
    matchingFiles: [], // files that have been passed in as an argument and are in the modules directory
    mismatchingFiles: [] // files that have been passed in as an argument but are not in the modules directory
  };

  // get the existing files in the modules directory
  getModuleFiles().forEach(function(modulesFile) {
    // then loop over the passed in fileName array
    fileNames.forEach(function(passedInFile) {
      // if they already exist in the modules directory,
      // push the name of the modulesFile into the matchingFiles array in the compareFilesObj
      if ( modulesFile === passedInFile ) {
        compareFilesObj.matchingFiles.push(modulesFile);
      }
    });
  });

  // if any passed in files are not currently listed in the modules directory,
  // add them to the mismatchingFiles array in the compareFilesObj
  fileNames.forEach(function(file) {
    if ( getModuleFiles().indexOf(file) === -1 ) {
      compareFilesObj.mismatchingFiles.push(file);
    }
  });

  return compareFilesObj;
}

// create new module file(s)
function createFiles(fileNames) {
  fileNames.forEach(function(file) {
    // write a new file for each file name
    fs.writeFileSync(path.join(config.getPath().modulesDirectory, '_'+ file +'.scss'), text.createFileText(file));
  });
}

// delete modules file(s)
function removeFiles(fileNames) {
  fileNames.forEach(function(file) {
    fs.unlinkSync(path.join(config.getPath().modulesDirectory, '_' + file + '.scss'));
  });
}

// @imports all module files into the _modules.scss file
function updateModulefile(fileNames) {
  // write out the moduleImportFile with comments and @imports
  fs.writeFileSync(config.getPath().modulesImportFile, text.updateModuleText(fileNames));
}
