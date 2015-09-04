var fs = require('fs');
var path = require("path");
var wrench = require('wrench');

var configFile = './css-burrito-config.json';

// Config Constructor
var Config = function(sassDirectory, sassImportFile, modulesDirectory, modulesImportFile, pathToSassDirectory) {
  this.sassDirectory = sassDirectory;
  this.sassImportFile = sassImportFile;
  this.modulesDirectory = modulesDirectory;
  this.modulesImportFile = modulesImportFile;
  this.pathToSassDirectory = pathToSassDirectory;
};

// organizes Config Constructor data into object
Config.prototype.data = function() {
  if (this.sassImportFile.indexOf('.scss') === -1) {
    this.sassImportFile += '.scss';
  }

  if (this.modulesImportFile.indexOf('.scss') === -1) {
    this.modulesImportFile += '.scss';
  }

  return {
    settings:  {
      root:  {
        pathToSassDirectory: this.pathToSassDirectory,
        sassDirectory: this.sassDirectory,
        sassImportFile: this.sassImportFile
      },
      modules: {
        modulesDirectory: this.modulesDirectory,
        modulesImportFile: this.modulesImportFile,
        moduleFiles: sortModuleFiles(wrench.readdirSyncRecursive(path.join(this.pathToSassDirectory, this.sassDirectory, this.modulesDirectory)), this.modulesImportFile)
      }
    },
    template: sortTemplate(wrench.readdirSyncRecursive(path.join(this.pathToSassDirectory, this.sassDirectory)), this.sassImportFile, this.modulesDirectory)
  }
}

module.exports = {
  // writes the css-burrito-config.json file
  write: function(sassDirectory, sassImportFile, modulesDirectory, modulesImportFile, pathToSassDirectory) {
    // create a new instance of the Config constructor
    var config = new Config(sassDirectory, sassImportFile, modulesDirectory, modulesImportFile, pathToSassDirectory);
    // convert config.data to json string with 2 space pretty print
    var configToJSON = JSON.stringify(config.data(), null, 2);
    // write out the file
    fs.writeFileSync(configFile, configToJSON);
  },

  // read the css-burrito-config.json file
  read: function(){
    return JSON.parse(fs.readFileSync(configFile));
  },

  // provides simple paths to all needed files and directories
  getPath: function() {
    var pathToSass = path.join(this.read().settings.root.pathToSassDirectory, this.read().settings.root.sassDirectory);
    var pathToSassImport = path.join(this.read().settings.root.pathToSassDirectory, this.read().settings.root.sassDirectory, this.read().settings.root.sassImportFile);
    var pathToModules = path.join(this.read().settings.root.pathToSassDirectory, this.read().settings.root.sassDirectory, this.read().settings.modules.modulesDirectory);
    var pathToModulesImport = path.join(this.read().settings.root.pathToSassDirectory, this.read().settings.root.sassDirectory, this.read().settings.modules.modulesDirectory, this.read().settings.modules.modulesImportFile);

    return  {
      sassDirectory: pathToSass,
      sassImportFile: pathToSassImport,
      modulesDirectory: pathToModules,
      modulesImportFile: pathToModulesImport
    }
  },

  // rewrites config with latest data
  update: function() {
    var read = this.read();
    this.write(read.settings.root.sassDirectory, read.settings.root.sassImportFile, read.settings.modules.modulesDirectory, read.settings.modules.modulesImportFile, read.settings.root.pathToSassDirectory);
  }
};

// builds template directories and files
function sortTemplate(sassDirectory, sassImportFile, modulesDirectory) {
  // create an empty template object
  var template = {
    directories: [], // an array of directories
    files: [] // an array of files with the .scss extension
  };

  sassDirectory.filter(function(dir) {
    // if it doesn't have a dot, the modules directory name, or the sass imports file name
    // push it to the directories array
      if ( dir.indexOf(".") === -1 && dir.indexOf(modulesDirectory) === -1 && dir.indexOf(sassImportFile) === -1) {
        template.directories.push(dir);
      } else {
        // otherwise if it doesn't have the modules directory name, or the sass imports file name
        // push it to the files array
        if( dir.indexOf(modulesDirectory) === -1 && dir.indexOf(sassImportFile) === -1 ) {
          template.files.push(dir);
        }
      }
  });

  return template;
}

// builds module directory
function sortModuleFiles(modulesDirectory, modulesImportFile) {
  // create an empty template object
  var moduleFiles = [];

  modulesDirectory.forEach(function(file) {
    // if it has a dot, and it isn't the modulesImportFile, add it to the moduleFiles Array
    if ( file.indexOf(".") > -1 && file.indexOf(modulesImportFile) === -1 ) {
      moduleFiles.push(file);
    }
  });

  return moduleFiles;
}
