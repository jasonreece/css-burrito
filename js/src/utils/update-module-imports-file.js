import fse from 'fs-extra';

import path from 'path';

import stripPartialFile from './strip-partial-file';

import config from '../config';

import readModuleDirectory from './read-module-directory';

function _updateModuleImportFileText() {
  const moduleFiles = readModuleDirectory();
  const moduleFilesText = `${moduleFiles.map(moduleFile => `@import '${stripPartialFile(moduleFile)}';`).join('\n')}`;
  const text = `// - - - - - - - - - - - - - - - - - - -
// - - modules
// import new modules here

${moduleFilesText}
`;

  return text;
}

export default function updateModuleImportFile() {
  fse.writeFileSync(path.join(config.moduleImportPath()), _updateModuleImportFileText());
}
