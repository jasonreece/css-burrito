# **css-burrito**
An architectural Sass template that will:
* create and @import new modules for you.
* remove modules that are no longer needed and un-@import them.
* list all modules files, just in case you need a quick peek..

## Quick Install

Clone the Repo or install with npm.

```
npm install -g css-burrito
```

## Add the template to your project.

In the command line, navigate to the root of your project and run:

```
burrito -n
```

This creates a new instance of css-burrito in the root of your project.

The file structure looks like this:

```
styles/
	index.scss
	global/
    	_base.scss
        _layout.scss
        _settings.scss
        _skin.scss
        _typography.scss
        _utilities.scss
    libs/
    	_libs-variable-overrides.scss
    modules/
    	_modules.scss
```

If you'd like to change where the template is installed, or rename any of the main files, you can do this in a `.cssburritorc` or `.cssburritorc.json` file.  or you can create a burrito object inside of `package.json`.

```
// in package.json
"burrito": {
  pathToStyles: 'path/to/burrito',
  stylesDirectoryName: 'custom-styles-directory-name',
  stylesFileName: 'custom-styles-file-name.scss'
}
```

or

```
// in .cssburritorc
{
  pathToStyles: 'path/to/burrito',
  stylesDirectoryName: 'custom-styles-directory-name',
  stylesFileName: 'custom-styles-file-name.scss'
}
```


## Adding New Modules
css-burrito will add new modules files, and @import them into the project for you!

To use this feature run:

```
burrito -m (file-name[s])
```

## Removing Modules
css-burrito will also delete unnecessary modules files, and remove the @import from the project for you!

To use this feature run:

```
burrito -r (file-name[s])
```

## List the Files in the Modules Directory
css-burrito will list your module files for you.

To use this feature run:

```
burrito -l
```

## Need Help?
It's always there for you.
```
burrito -h
```

## What's in our burrito template?

css-burrito has four main ingredients.
### **1.  index.scss**
* This file imports all of the other files from the **libs**, **global** and **module** sections.
* It has an **inbox** section where developers that don't usually work on the project can leave temporary code that is easily seen by the maintainers of the project.
* It also has a **shame** section for quick fixes, hacks, and other questionable techniques.  Be sure to fix them later.

### **2.  libs**
* This section houses third party CSS libraries like [Normalize](http://necolas.github.io/normalize.css/), [Bootstrap](http://getbootstrap.com/), or [Foundation](http://foundation.zurb.com/).
* It also contains a ```_libs-variable-overrides.scss``` file for overriding third party variables.

### **3.  global** -  There are six global components.
* `_settings.scss` - global maps and variables
* `_utilities.scss` - extends, mixins, functions, and utilities.
* `_base.scss` - global defaults for base-level tags (body, p, etc.)
* `_layout.scss` - global layout classes (margin, padding, floats, etc).
* `_skin.scss` - global skin classes (gradients, colors, box-shadows, etc).
* `_typography.scss` - global typography classes.

### **4.  modules**
* Any unit of style that can be found across multiple pages (Buttons, Navigations, Modals).
* **Most of your styles should be found here.**
