import chalk from 'chalk';

import config from '../config';

function _asciiLogoColor(color, text) {
  return chalk[color](text);
}

function _asciiLogo(color, text) {
  console.log('  ');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  //////////////////////////////////........./////////////////');
  console.log('  ///////////////////////////////.....mmmmm....///////////////');
  console.log('  /////////////////////////////.....mmmmmmmmmm.../////////////');
  console.log('  //////////////////////////.....mmmmmmmmmmmmmmmm...//////////');
  console.log('  ////////////////////////.....mmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  //////////////////////.....mmmmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  ////////////////////....mmmmmmmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  ///////////////////...mmmmmmmmmmmmmmmmmmmmmmmmmmm...////////');
  console.log('  /////////////////....mmmmmmmmmmmmmmmmmmmmmmmmmm..../////////');
  console.log('  ///////////////....mmmmmmmmmmmmmmmmmmmmmmmmmmm....//////////');
  console.log('  ////////////.....mmmmmmmmmmmmmmmmmmmmmmmmmmm....////////////');
  console.log('  /////////....mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm..../////////////');
  console.log(`  ///////....mmmmmmmmm ${_asciiLogoColor(color, text)} mmmmmmmmm...///////////////`);
  console.log('  //////...........mmmmmmmmmmmmmmmmmmmmmmm....////////////////');
  console.log('  //////....mmmmm....mmmmmmmmmmmmmmmmmmm....//////////////////');
  console.log('  //////....mmmmmmm....mmmmmmmmmmmmmmm....////////////////////');
  console.log('  ////////...mmmmmmmm....mmmmmmmmmmm....//////////////////////');
  console.log('  /////////.....mmmmmmm....mmmmmmm....////////////////////////');
  console.log('  ///////////....mmmmmmm....mmmm....//////////////////////////');
  console.log('  /////////////....mmmmmm...mm....////////////////////////////');
  console.log('  ///////////////....mmmmm......//////////////////////////////');
  console.log('  /////////////////........../////////////////////////////////');
  console.log('  /////////////////////....///////////////////////////////////');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  ////////////////////////////////////////////////////////////');
  console.log('  ');
}

function _pluralizeMessage(fileNames, singularMessage, pluralMessage) {
  if (fileNames.length === 1) {
    console.log(singularMessage);
  } else {
    console.log(pluralMessage);
  }
}

function _logoSuccessMessage() {
  _asciiLogo('green', 'css-burrito');
}

function _logoErrorMessage() {
  _asciiLogo('red', 'css-burrito');
}

function _alertSuccessMessage() {
  console.log(chalk.green('  - - - - - - - - - - - - - success! - - - - - - - - - - - - - \n'));
}

function _alertErrorMessage() {
  console.log(chalk.red('  - - - - - - - - - - - - - uh-oh! - - - - - - - - - - - - - - \n'));
}

export function helpMessage() {
  _logoSuccessMessage();
  console.log(chalk.green('  - - - - - - - - - how about a little help? - - - - - - - - - \n'));
  console.log('  to add a new instance of css-burrito into your project, run: \n');
  console.log(`  ${chalk.inverse(' burrito -n [folder name] ')} or ${chalk.inverse(' burrito --new [folder name] ')}\n`);
  console.log('  to create files in the modules directory,\n');
  console.log(`  and add them to the ${chalk.underline(config().moduleImportPath())} file, run: \n`);
  console.log(`  ${chalk.inverse(' burrito -m (module name[s]) ')} or ${chalk.inverse(' burrito --module (folder name[s]) ')}\n`);
  console.log('  to list the files in the module directory, run:\n');
  console.log(`  ${chalk.inverse(' burrito -l ')} or ${chalk.inverse(' burrito --list ')}\n`);
  console.log('  to delete files from the modules directory,\n');
  console.log(`  and remove them from the ${chalk.underline(config().moduleImportPath())} file, run: \n`);
  console.log(`  ${chalk.inverse(' burrito -r (module name[s]) ')} or ${chalk.inverse(' burrito --remove (folder name[s]) ')}\n`);
  console.log(`  want to override defaults with a ${chalk.underline('.cssburritorc')} file?\n`);
  console.log('  check out the readme:  https://github.com/jasonreece/css-burrito\n');
}

export function newProjectSuccessMessage() {
  _logoSuccessMessage();
  _alertSuccessMessage();
  console.log('  you have added css-burrito to your project\n');
  console.log(`  you can find the project template here ${chalk.underline(config().stylesDirectoryPath())}\n`);
  console.log('  css-burrito will also add new modules to the project for you.\n');
  console.log('  just run:\n');
  console.log(`  ${chalk.inverse(' burrito -m (module name[s]) ')} or ${chalk.inverse(' burrito --module (folder name[s] ')}\n`);
  console.log(`  the new modules will be added here: ${chalk.underline(config().moduleImportPath())}\n`);
}

export function newProjectErrorMessage() {
  _logoErrorMessage();
  _alertErrorMessage();
  console.log(`  looks like you already have a project at ${chalk.underline(config().stylesDirectoryPath())}\n`);
  console.log('  we didn\'t want to overwrite anything, so we just left it alone...\n');
  console.log('  if you need to create another instance of the template,\n');
  console.log(`  please delete ${chalk.underline(config().stylesDirectoryPath())} and try again\n`);
  console.log('  need help? run:\n');
  console.log(`  ${chalk.inverse(' burrito -h ')} or ${chalk.inverse(' burrito --help ')}\n`);
}

export function addModuleMessage(successFiles, errorFiles) {
  if (successFiles.length) {
    _logoSuccessMessage();
    _pluralizeMessage(successFiles,
      '  you have created the following file:\n',
      '  you have created the following files:\n');

    successFiles.forEach(file => console.log(chalk.green(`  _${file}.scss`)));

    console.log('');

    _pluralizeMessage(successFiles,
      '  and it has been imported into the project at:',
      '  and they have been imported into the project at:');

    console.log(`  ${chalk.underline(config().moduleImportPath())}\n`);
  } else {
    _logoErrorMessage();
    _alertErrorMessage();
  }

  if (errorFiles.length) {
    _pluralizeMessage(errorFiles,
      '  we tried to make the following file:\n',
      '  we tried to make the following files:\n');

    errorFiles.forEach(file => console.log(chalk.red(`  _${file}.scss`)));

    console.log('');

    _pluralizeMessage(errorFiles,
      '  but, the thing is, that file already exists...  so, we just left it alone.\n',
      '  but, the thing is, these files already exist...  so, we just left em alone.\n');
  }
}

export function removeModuleMessage(successFiles, errorFiles) {
  if (successFiles.length) {
    _logoSuccessMessage();
    _pluralizeMessage(successFiles,
      '  you have removed the following file from your project\n',
      '  you have removed the following files from your project\n');

    successFiles.forEach(file => console.log(chalk.green(`  _${file}.scss`)));

    console.log('');

    _pluralizeMessage(successFiles,
      '  and it has also been removed from',
      '  and they have also been removed from');

    console.log(`  ${chalk.underline(config().moduleImportPath())}\n`);
  } else {
    _logoErrorMessage();
    _alertErrorMessage();
  }

  if (errorFiles.length) {
    _pluralizeMessage(errorFiles,
      '  we couldn\'t find a file named: \n',
      '  we couldn\'t find any files named: \n');

    errorFiles.forEach(file => console.log(chalk.red(`  _${file}.scss`)));

    console.log('');

    _pluralizeMessage(errorFiles,
      '  so... if you want to make it first, i guess we can delete it after that?\n',
      '  so... if you want to make them first, i guess we can delete them after that?\n');
  }
}

export function notEnoughArgsErrorMessage() {
  _logoErrorMessage();
  _alertErrorMessage();
  console.log('  looks like you need at least one more argument\n');
  console.log('  need help?  try running:\n');
  console.log(`  ${chalk.inverse(' burrito -h ')} or ${chalk.inverse(' burrito --help ')}\n`);
}

export function listSuccessMessage(fileNames) {
  _logoSuccessMessage();
  _pluralizeMessage(fileNames,
    '  You currently have the following file in your',
    '  You currently have the following file in your');

  console.log(`  ${chalk.underline(config().moduleDirectoryPath())} directory\n`);

  fileNames.forEach(fileName => console.log(`  ${chalk.green(fileName)}`));

  console.log('');
}

export function listErrorMessage() {
  _logoErrorMessage();
  console.log(`  looks like the ${chalk.underline(config().moduleDirectoryPath())} directory is currently empty.\n`);
  console.log('  to add some module files, run:\n');
  console.log(`  ${chalk.inverse(' burrito -m (module name[s]) ')} or ${chalk.inverse(' burrito --module (folder name[s] ')}\n`);
}
