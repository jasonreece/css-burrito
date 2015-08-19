var fs = require('fs');

var configFile = './css-burrito-config.json';

module.exports = {
  // check to see if config file exists
  checkConfig: function() {
    try {
      fs.readFileSync(configFile,'utf8');
    } catch(err) {
      // if config doesn't exist, return false, so we can write one
      if( err.code == 'ENOENT' ) {
        return false;
      }
    }
    // otherwise, return true, we've already got one
    return true;
  },

  // create a css-burrito-config.json file
  writeConfig: function(folderName) {
    fs.writeFileSync(configFile, convertConfig(folderName));
  },

  // read the css-burrito-config.json file
  readConfig: function(){
    return JSON.parse(fs.readFileSync(configFile));
  }
};

// set up the config object
function configObj(folderName) {
  return {
    name: folderName,
    path: folderName + '/modules/'
  };
}

// convert config object to json string with 2 space pretty print
function convertConfig(folderName) {
  return JSON.stringify(configObj(folderName), null, 2);
}
