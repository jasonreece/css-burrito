import path from 'path';

import fse from 'fs-extra';

import prompt from 'prompt';

import config from './config';

import { newProjectSuccessMessage, newProjectErrorMessage } from './utils/messages';

function _createNewProject() {
  const projectAlreadyExists = fse.existsSync(config().stylesDirectoryPath());
  if (projectAlreadyExists) {
    newProjectErrorMessage();
    return;
  }

  fse.ensureDirSync(config().data.pathToStyles);
  fse.copySync(path.join(__dirname, '..', '..', '/styles/'), config().stylesDirectoryPath());
  fse.renameSync(path.join(config().stylesDirectoryPath(), 'index.scss'), path.join(config().stylesDirectoryPath(), config().data.stylesFileName));
}

export default function createNewProject() {
  const schema = {
    properties: {
      pathToStyles: {
        description: 'path to styles directory:',
        default: './',
      },
      stylesDirectoryName: {
        description: 'styles directory name:',
        default: 'styles',
      },
      stylesFileName: {
        description: 'styles file name:',
        pattern: /(.*?).scss/,
        message: 'file must end with .scss',
        default: 'index.scss',
      },
    },
  };

  prompt.start();
  // remove the custom prompt message and delimiter
  prompt.message = '  ';
  prompt.delimiter = '';

  prompt.get(schema, (err, result) => {
    fse.writeFileSync('./.cssburritorc', JSON.stringify(result, null, 2));
    _createNewProject();
    newProjectSuccessMessage();
  });
}
