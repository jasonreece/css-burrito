import fse from 'fs-extra';

import path from 'path';

import config from './config';

import compareModuleFiles from './utils/compare-module-files';

import updateModuleImportFile from './utils/update-module-imports-file';

import { notEnoughArgsErrorMessage, removeModuleMessage } from './utils/messages';

export default function removeModuleFile() {
  const files = compareModuleFiles();
  const notEnoughArgs = !Object.keys(files).length;

  if (notEnoughArgs) {
    notEnoughArgsErrorMessage();
    return;
  }

  const successFiles = files.existingFiles;
  const errorFiles = files.newFiles;

  removeModuleMessage(successFiles, errorFiles);

  successFiles.forEach((fileName) => {
    fse.unlinkSync(path.join(config.moduleDirectoryPath(), `_${fileName}.scss`));
  });

  updateModuleImportFile();
}
