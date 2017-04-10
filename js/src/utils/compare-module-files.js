import process from 'process';

import readModuleDirectory from './read-module-directory';

import stripPartialFile from './strip-partial-file';

export default function compareModuleFiles() {
  const args = process.argv.splice(3);
  const moduleFiles = readModuleDirectory();

  if (!args.length) {
    return {};
  }

  return {
    newFiles: args.filter(fileName => !moduleFiles
      .map(oldFile => stripPartialFile(oldFile)).includes(fileName)),
    existingFiles: args.filter(fileName => moduleFiles
      .map(oldFile => stripPartialFile(oldFile)).includes(fileName)),
  };
}
