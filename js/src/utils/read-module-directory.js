import fse from 'fs-extra';

import config from '../config';

function _isNotModulesImportFile(modulesImportFileName) {
  return !modulesImportFileName.includes('_modules.scss');
}

// if module file exists, return a list of everything in the directory,
// otherwise return an empty array
export default function readModuleDirectory() {
  return fse.existsSync(config().moduleDirectoryPath()) ?
    fse.readdirSync(
      config().moduleDirectoryPath(),
      (err, files) => files).filter(_isNotModulesImportFile) :
    [];
}
