#!/usr/bin/env node

import yargs from 'yargs';

import createNewProject from './create-new-project';

import addModuleFile from './add-module-file';

import removeModuleFile from './remove-module-file';

import listModuleFiles from './list-module-files';

import { helpMessage } from './utils/messages';

if (yargs.argv.n || yargs.argv.new) {
  createNewProject();
} else if (yargs.argv.m || yargs.argv.module) {
  addModuleFile();
} else if (yargs.argv.r || yargs.argv.remove) {
  removeModuleFile();
} else if (yargs.argv.l || yargs.argv.list) {
  listModuleFiles();
} else {
  helpMessage();
}
