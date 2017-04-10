'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = strip;

var _config = require('../config');

var _config2 = _interopRequireDefault(_config);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var fileExtension = _config2.default.data.fileExtension;

function strip(fileName) {
  var sanitizedFileName = fileName;
  if (fileName.includes(fileExtension)) {
    sanitizedFileName = sanitizedFileName.slice(0, '-' + fileExtension.length);
  }

  if (fileName.charAt(0) === '_') {
    sanitizedFileName = sanitizedFileName.slice(1);
  }

  return sanitizedFileName;
}