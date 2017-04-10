'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = undefined;

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _constants = require('./constants');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Config = function () {
  function Config(data) {
    _classCallCheck(this, Config);

    this.data = data;
  }

  _createClass(Config, [{
    key: 'data',
    value: function data() {
      return Object.assign({}, this.data);
    }
  }, {
    key: 'stylesDirectoryPath',
    value: function stylesDirectoryPath() {
      return _path2.default.join(this.data.pathToStyles, this.data.stylesDirectoryName);
    }
  }, {
    key: 'stylesFilePath',
    value: function stylesFilePath() {
      return _path2.default.join(this.data.pathToStyles, this.data.stylesDirectoryName, this.data.stylesFileName);
    }
  }, {
    key: 'moduleDirectoryPath',
    value: function moduleDirectoryPath() {
      return _path2.default.join(this.data.pathToStyles, this.data.stylesDirectoryName, this.data.modulesDirectoryName);
    }
  }, {
    key: 'moduleImportPath',
    value: function moduleImportPath() {
      return _path2.default.join(this.data.pathToStyles, this.data.stylesDirectoryName, this.data.modulesDirectoryName, this.data.modulesImportFileName);
    }
  }]);

  return Config;
}();

function readUserConfig(configFile) {
  var configExists = _fsExtra2.default.existsSync(configFile);
  var configObj = {};
  if (configExists) {
    var file = _fsExtra2.default.readFileSync(configFile);
    var configJSON = JSON.parse(file);
    if (configFile === 'package.json') {
      configObj = configJSON.burrito;
    } else {
      configObj = configJSON;
    }
  }
  return configObj;
}

var userConfig = _constants.CONFIG_TYPES.reduce(function (userConfigFiles, userConfigFile) {
  return Object.assign(userConfigFiles, readUserConfig(userConfigFile));
}, _constants.CONFIG_DEFAULTS);

var config = new Config(userConfig);

exports.default = config;