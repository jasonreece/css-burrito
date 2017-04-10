"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = stripPartialFile;
function stripPartialFile(fileName) {
  return fileName.slice(0, -5).slice(1);
}