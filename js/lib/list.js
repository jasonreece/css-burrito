'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _config = require('./config');

var _config2 = _interopRequireDefault(_config);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function isNotModulesImportFile(modulesImportFileName) {
  return !modulesImportFileName.includes(_config2.default.data.modulesImportFileName);
}

var list = _fsExtra2.default.readdirSync(_config2.default.data.modulesDirectoryName, function (err, files) {
  if (err) throw err;
  return files;
}).filter(isNotModulesImportFile);

exports.default = list;