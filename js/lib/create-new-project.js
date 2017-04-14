'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = createNewProject;

var _path = require('path');

var _path2 = _interopRequireDefault(_path);

var _fsExtra = require('fs-extra');

var _fsExtra2 = _interopRequireDefault(_fsExtra);

var _prompt = require('prompt');

var _prompt2 = _interopRequireDefault(_prompt);

var _config = require('./config');

var _config2 = _interopRequireDefault(_config);

var _messages = require('./utils/messages');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _createNewProject() {
  var projectAlreadyExists = _fsExtra2.default.existsSync((0, _config2.default)().stylesDirectoryPath());
  if (projectAlreadyExists) {
    (0, _messages.newProjectErrorMessage)();
    return;
  }

  _fsExtra2.default.ensureDirSync((0, _config2.default)().data.pathToStyles);
  _fsExtra2.default.copySync(_path2.default.join(__dirname, '..', '..', '/styles/'), (0, _config2.default)().stylesDirectoryPath());
  _fsExtra2.default.renameSync(_path2.default.join((0, _config2.default)().stylesDirectoryPath(), 'index.scss'), _path2.default.join((0, _config2.default)().stylesDirectoryPath(), (0, _config2.default)().data.stylesFileName));
}

function createNewProject() {
  var schema = {
    properties: {
      pathToStyles: {
        description: 'path to styles directory:',
        default: './'
      },
      stylesDirectoryName: {
        description: 'styles directory name:',
        default: 'styles'
      },
      stylesFileName: {
        description: 'styles file name:',
        pattern: /(.*?).scss/,
        message: 'file must end with .scss',
        default: 'index.scss'
      }
    }
  };

  _prompt2.default.start();
  // remove the custom prompt message and delimiter
  _prompt2.default.message = '  ';
  _prompt2.default.delimiter = '';

  _prompt2.default.get(schema, function (err, result) {
    _fsExtra2.default.writeFileSync('./.cssburritorc', JSON.stringify(result, null, 2));
    _createNewProject();
    (0, _messages.newProjectSuccessMessage)();
  });
}