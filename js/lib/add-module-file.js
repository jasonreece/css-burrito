'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = addModuleFile;

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _config = require('./config');

var _config2 = _interopRequireDefault(_config);

var _compareModuleFiles = require('./utils/compare-module-files');

var _compareModuleFiles2 = _interopRequireDefault(_compareModuleFiles);

var _updateModuleImportsFile = require('./utils/update-module-imports-file');

var _updateModuleImportsFile2 = _interopRequireDefault(_updateModuleImportsFile);

var _messages = require('./utils/messages');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _fileText(fileName) {
  var text = '// - - - - - - - - - - - - - - - - - - -\n// - - ' + fileName + ' module\n// styles for the ' + fileName + ' module\n';

  return text;
}

function addModuleFile() {
  var files = (0, _compareModuleFiles2.default)();
  var notEnoughArgs = Object.keys(files).length === 0;

  if (notEnoughArgs) {
    (0, _messages.notEnoughArgsErrorMessage)();
    return;
  }

  var successFiles = files.newFiles;
  var errorFiles = files.existingFiles;

  (0, _messages.addModuleMessage)(successFiles, errorFiles);

  successFiles.forEach(function (fileName) {
    _fsExtra2.default.writeFileSync(_path2.default.join((0, _config2.default)().moduleDirectoryPath(), '_' + fileName + '.scss'), _fileText(fileName));
  });

  (0, _updateModuleImportsFile2.default)();
}