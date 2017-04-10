'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = listModuleFiles;

var _readModuleDirectory = require('./utils/read-module-directory');

var _readModuleDirectory2 = _interopRequireDefault(_readModuleDirectory);

var _messages = require('./utils/messages');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function listModuleFiles() {
  var moduleDirectory = (0, _readModuleDirectory2.default)();
  if (!moduleDirectory.length) {
    (0, _messages.listErrorMessage)();
    return;
  }

  (0, _messages.listSuccessMessage)((0, _readModuleDirectory2.default)());
}