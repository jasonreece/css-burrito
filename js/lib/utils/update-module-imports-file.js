'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = updateModuleImportFile;

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _stripPartialFile = require('./strip-partial-file');

var _stripPartialFile2 = _interopRequireDefault(_stripPartialFile);

var _config = require('../config');

var _config2 = _interopRequireDefault(_config);

var _readModuleDirectory = require('./read-module-directory');

var _readModuleDirectory2 = _interopRequireDefault(_readModuleDirectory);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _updateModuleImportFileText() {
  var moduleFiles = (0, _readModuleDirectory2.default)();
  var moduleFilesText = '' + moduleFiles.map(function (moduleFile) {
    return '@import \'' + (0, _stripPartialFile2.default)(moduleFile) + '\';';
  }).join('\n');
  var text = '// - - - - - - - - - - - - - - - - - - -\n// - - modules\n// import new modules here\n\n' + moduleFilesText + '\n';

  return text;
}

function updateModuleImportFile() {
  _fsExtra2.default.writeFileSync(_path2.default.join(_config2.default.moduleImportPath()), _updateModuleImportFileText());
}