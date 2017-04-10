import readModuleDirectory from './utils/read-module-directory';

import { listSuccessMessage, listErrorMessage } from './utils/messages';

export default function listModuleFiles() {
  const moduleDirectory = readModuleDirectory();
  if (!moduleDirectory.length) {
    listErrorMessage();
    return;
  }

  listSuccessMessage(readModuleDirectory());
}
