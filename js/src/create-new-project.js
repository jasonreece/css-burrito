import path from 'path';

import fse from 'fs-extra';

import config from './config';

import { newProjectSuccessMessage, newProjectErrorMessage } from './utils/messages';

export default function addNewProject() {
  const projectAlreadyExists = fse.existsSync(config.stylesDirectoryPath());
  if (projectAlreadyExists) {
    newProjectErrorMessage();
    return;
  }

  newProjectSuccessMessage();
  fse.ensureDirSync(config.data.pathToStyles);
  fse.copySync(path.join(__dirname, '..', '..', '/styles/'), path.join(config.data.pathToStyles, config.data.stylesDirectoryName));
}
