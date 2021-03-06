'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = readModuleDirectory;

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _config = require('../config');

var _config2 = _interopRequireDefault(_config);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _isNotModulesImportFile(modulesImportFileName) {
  return !modulesImportFileName.includes('_modules.scss');
}

// if module file exists, return a list of everything in the directory,
// otherwise return an empty array
function readModuleDirectory() {
  return _fsExtra2.default.existsSync((0, _config2.default)().moduleDirectoryPath()) ? _fsExtra2.default.readdirSync((0, _config2.default)().moduleDirectoryPath(), function (err, files) {
    return files;
  }).filter(_isNotModulesImportFile) : [];
}