var fs = require('fs');

var config = require('./config.js');
var messages = require('./messages.js');

module.exports = {
  init: function(arguments) {
    if ( arguments.length === 0 ) {
      messages.newModuleArguments();
      return;
    }

    // if any of the new files exist, exit
    if ( compareFiles(arguments) > 0 ) {
      return;
    }
    
    // create new files
    createFiles(arguments);

    // update the _module.scss file
    updateModulefile();

    // display a success message
    messages.newModuleSuccess(arguments);
  }
};

// compares new module files to be created with existing files in directory
// returns an array length of existing files
function compareFiles(fileNames) {
  // create an array to store any duplicate file names
  var fileArray = [];

  // loop over the files in the modules directory
  var modulesDirectory = fs.readdirSync(config.readConfig().path);
  modulesDirectory.map(function(modulesFile) {
    // sanitize modulesFile
    modulesFile = sanitize(modulesFile);

    // loop over the new files to be created
    fileNames.map(function(newFile) {
      // if they already exist, push the name into the array
      if ( newFile === modulesFile ) {
        fileArray.push(modulesFile);
      } 
    });
  });

  // display an error for any files that already exist
  if( fileArray.length > 0 ) {
    messages.fileExistsError(fileArray);
  }

  return fileArray.length;
}

// create new module file(s)
function createFiles(fileNames) {
  fileNames.map(function(file) {
    // write a new file for each file name
    fs.writeFileSync('./' + config.readConfig().path + '_'+ file +'.scss', createFileText(file));
  });
}

// adds default comments to any new file(s)
function createFileText(file) {
  var text = '// - - - - - - - - - - - - - - - - - - -\n';
  text += '// - - ' + file + ' module\n';
  text += '// styles for the ' + file + ' module\n';

  return text;
}

// @imports all module files into the _modules.scss file
function updateModulefile() {
  fs.readdir(config.readConfig().path, function(err, fileNames){
    // write out the _modules.scss file with comments and @imports
    fs.writeFileSync('./' + config.readConfig().path + '_modules.scss', updateModuleText(fileNames));
  });
}

// format the text for the _modules.scss file
function updateModuleText(fileNames) {
  // add comments
  var text = '// - - - - - - - - - - - - - - - - - - -\n';
  text += '// - - modules\n';
  text += '// add new modules here\n\n';

  // loop over the sanitized fileNames
  fileNames.map(function(file, i) {
    file = sanitize(file);

    if (file ) {
      // import the file
      text += '@import ' + file + ';\n';
    }
  });

  return text;
}

// cleans up the file names so they can be @imported into the _module.scss file
function sanitize(file) {
  //remove the _ prefix from the file name
  file = file.slice(1);
  //remove the .scss extension from the file name
  file = file.slice(0, -5);

  // set _modules.scss file to undefined so it doesn't get added @imported into itself
  if( file === 'modules' ) {
    file = undefined;
  }

  return file;
}
