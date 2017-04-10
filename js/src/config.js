import fse from 'fs-extra';

import path from 'path';

import { CONFIG_TYPES, CONFIG_DEFAULTS } from './constants';

class Config {
  constructor(data) {
    this.data = data;
  }

  data() {
    return Object.assign({}, this.data);
  }

  stylesDirectoryPath() {
    return path.join(
      this.data.pathToStyles,
      this.data.stylesDirectoryName,
    );
  }

  stylesFilePath() {
    return path.join(
      this.data.pathToStyles,
      this.data.stylesDirectoryName,
      this.data.stylesFileName,
    );
  }

  moduleDirectoryPath() {
    return path.join(
      this.data.pathToStyles,
      this.data.stylesDirectoryName,
      this.data.modulesDirectoryName,
    );
  }

  moduleImportPath() {
    return path.join(
      this.data.pathToStyles,
      this.data.stylesDirectoryName,
      this.data.modulesDirectoryName,
      this.data.modulesImportFileName,
    );
  }
}

function readUserConfig(configFile) {
  const configExists = fse.existsSync(configFile);
  let configObj = {};
  if (configExists) {
    const file = fse.readFileSync(configFile);
    const configJSON = JSON.parse(file);
    if (configFile === 'package.json') {
      configObj = configJSON.burrito;
    } else {
      configObj = configJSON;
    }
  }
  return configObj;
}

const userConfig = CONFIG_TYPES.reduce((userConfigFiles, userConfigFile) => (
  Object.assign(userConfigFiles, readUserConfig(userConfigFile))
), CONFIG_DEFAULTS);

const config = new Config(userConfig);

export { config as default };
