var fs = require('fs');
var path = require("path");
var ncp = require('ncp');

var messages = require('./messages.js');
var config = require('./config.js');

module.exports = {
  init: function(folderName){
    // if there is already a css-burrito-config.json file,
    // provide an error message and exit
    if ( config.checkConfig() ) {
      messages.hasConfigError();
      return;
    }

    // if too many arguments were passed in
    // provide an error message and exit
    if (folderName.length > 1) {
      messages.hasTooManyArgsError();
      return;
    }

    // set folder name to the first item in the folderName array
    folderName = folderName.shift();

    // set a default folder name if one didn't get passed in
    if (folderName === undefined) {
      folderName = 'stylesheets';
    }

    // write the css-burrito-config.json file
    config.writeConfig(folderName);

    // copy a new instance of the burrito template
    copyTemplate(folderName);

    // display a success message
    messages.newBurritoSuccess();
  }
};

// copies stylesheet folder into users project
function copyTemplate(folderName) {
  // uses mkdir to create a folder with the passed in foldername
  // and uses ncp to copy the stylesheets directory into the project
  fs.mkdirSync(folderName, ncp(path.join(__dirname, '..', '..', '/stylesheets/'), './' + folderName));
}
