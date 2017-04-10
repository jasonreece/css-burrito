#!/usr/bin/env node
'use strict';

var _yargs = require('yargs');

var _yargs2 = _interopRequireDefault(_yargs);

var _createNewProject = require('./create-new-project');

var _createNewProject2 = _interopRequireDefault(_createNewProject);

var _addModuleFile = require('./add-module-file');

var _addModuleFile2 = _interopRequireDefault(_addModuleFile);

var _removeModuleFile = require('./remove-module-file');

var _removeModuleFile2 = _interopRequireDefault(_removeModuleFile);

var _listModuleFiles = require('./list-module-files');

var _listModuleFiles2 = _interopRequireDefault(_listModuleFiles);

var _messages = require('./utils/messages');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

if (_yargs2.default.argv.n || _yargs2.default.argv.new) {
  (0, _createNewProject2.default)();
} else if (_yargs2.default.argv.m || _yargs2.default.argv.module) {
  (0, _addModuleFile2.default)();
} else if (_yargs2.default.argv.r || _yargs2.default.argv.remove) {
  (0, _removeModuleFile2.default)();
} else if (_yargs2.default.argv.l || _yargs2.default.argv.list) {
  (0, _listModuleFiles2.default)();
} else {
  (0, _messages.helpMessage)();
}