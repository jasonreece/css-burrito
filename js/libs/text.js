var path = require('path');

var pjson = require('../../package.json');
var config = require('./config.js');

module.exports = {
  // adds a comment to the top of any new module files
  createFileText: function(file) {
    var text = "// - - - - - - - - - - - - - - - - - - -\n";
    text += "// - - " + file + " module\n";
    text += "// styles for the " + file + " module\n";

    return text;
  },

  updateModuleText: function(fileNames) {
    // add comments
    var text = "// - - - - - - - - - - - - - - - - - - -\n";
    text += "// - - modules\n";
    text += "// import new modules here\n\n";

    // loop over the module files
    fileNames.forEach(function(file) {
      text += "@import '" + sanitize(file) + "';\n";
    });

    return text;
  },

  // imports all non module files into the main import file
  sassImportFileText: function() {
    var fileNames = config.read().template.files;
    var modulesDirectory = config.read().settings.modules.modulesDirectory;
    var modulesImportFile = config.read().settings.modules.modulesImportFile;

    var text = "@charset 'utf-8';\n\n"

    text += "// - - css-burrito v" + pjson.version + " | mit license | github.com/jasonreece/css-burrito\n\n";

    text += "// - - - - - - - - - - - - - - - - - - -\n"
    text += "// - - " + config.read().settings.root.sassImportFile + "\n";
    text += "// contains an import section for all files, an inbox,\n";
    text += "// and a shame section for quick fixes and hacks.\n\n";

    fileNames.filter(function(file, i) {
      // get all parent directories
      var filePath = file.split("/").slice(0, -1).join("/").toString();
      // get the base of the filename
      var fileBase = file.split( "/" ).slice(-1).toString();
      // import the sanitized file
      text +="@import '" + path.join(filePath, sanitize(fileBase)) + "';\n\n";
    });

    text += "\n// - - - - - - - - - - - - - - - - - - -\n";
    text += "// - - modules\n";
    text += "// add new modules to the " + path.join(modulesDirectory, modulesImportFile) + " file and they\'ll get pulled in here.\n\n";
    text += "@import '" + path.join(modulesDirectory, sanitize(modulesImportFile)) + "';\n";

    text += "\n\n// - - - - - - - - - - - - - - - - - - -\n";
    text += "// - - inbox\n";
    text += "// the inbox allows developers, and those not actively working on the project\n";
    text += "// to quickly add styles that are easily seen by the maintainer of the file.\n\n";

    text += "\n// - - - - - - - - - - - - - - - - - - -\n";
    text += "// - - shame\n";
    text += "// need to add a quick fix, hack, or questionable technique?  add it here, fix it later.\n";

    return text;
  },

  sanitize: function(file) {
    return sanitize(file);
  }
}

// removes the file extension and underscore
function sanitize(file) {
  // remove the leading _ from the file name
  file = file.slice(1);
  //remove the .scss extension from the file name
  file = file.slice(0, -5);

  return file;
}
