'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = compareModuleFiles;

var _process = require('process');

var _process2 = _interopRequireDefault(_process);

var _readModuleDirectory = require('./read-module-directory');

var _readModuleDirectory2 = _interopRequireDefault(_readModuleDirectory);

var _stripPartialFile = require('./strip-partial-file');

var _stripPartialFile2 = _interopRequireDefault(_stripPartialFile);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function compareModuleFiles() {
  var args = _process2.default.argv.splice(3);
  var moduleFiles = (0, _readModuleDirectory2.default)();

  if (!args.length) {
    return {};
  }

  return {
    newFiles: args.filter(function (fileName) {
      return !moduleFiles.map(function (oldFile) {
        return (0, _stripPartialFile2.default)(oldFile);
      }).includes(fileName);
    }),
    existingFiles: args.filter(function (fileName) {
      return moduleFiles.map(function (oldFile) {
        return (0, _stripPartialFile2.default)(oldFile);
      }).includes(fileName);
    })
  };
}