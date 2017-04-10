'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = addNewProject;

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _config = require('./config');

var _config2 = _interopRequireDefault(_config);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function addNewProject() {
  _fsExtra2.default.ensureDirSync(_config2.default.data.pathToStyles);
  _fsExtra2.default.copySync(_path2.default.join('./stylesheets/'), _path2.default.join(_config2.default.data.pathToStyles, _config2.default.data.stylesDirectoryName));
}