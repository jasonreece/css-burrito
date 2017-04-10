import fse from 'fs-extra';

import path from 'path';

import config from './config';

import compareModuleFiles from './utils/compare-module-files';

import updateModuleImportFile from './utils/update-module-imports-file';

import { notEnoughArgsErrorMessage, addModuleMessage } from './utils/messages';

function _fileText(fileName) {
  const text = `// - - - - - - - - - - - - - - - - - - -
// - - ${fileName} module
// styles for the ${fileName} module
`;

  return text;
}

export default function addModuleFile() {
  const files = compareModuleFiles();
  const notEnoughArgs = !Object.keys(files).length;

  if (notEnoughArgs) {
    notEnoughArgsErrorMessage();
    return;
  }

  const successFiles = files.newFiles;
  const errorFiles = files.existingFiles;

  addModuleMessage(successFiles, errorFiles);

  successFiles.forEach((fileName) => {
    fse.writeFileSync(path.join(config.moduleDirectoryPath(), `_${fileName}.scss`), _fileText(fileName));
  });

  updateModuleImportFile();
}
