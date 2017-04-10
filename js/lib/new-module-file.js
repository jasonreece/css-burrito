'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _process = require('process');

var _process2 = _interopRequireDefault(_process);

var _list = require('./list');

var _list2 = _interopRequireDefault(_list);

var _strip = require('./utils/strip');

var _strip2 = _interopRequireDefault(_strip);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function newModule() {
  var newFiles = _process2.default.argv.splice(3).map(function (newFile) {
    return (0, _strip2.default)(newFile);
  });

  var oldFiles = _list2.default.map(function (oldFile) {
    return (0, _strip2.default)(oldFile);
  });

  newFiles.map(function (newFile) {
    if (oldFiles.includes(newFile)) {
      console.log('already got it');
    } else {
      console.log('dont got it');
    }
  });
} // import fse from 'fs-extra';

exports.default = newModule;