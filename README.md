# **css-burrito**
## **A SMACSS based Sass template with superpowers**

### Quick Install

Clone the Repo or install with npm.

```
npm install -g css-burrito
```

In the command line, navigate to the folder that you want to install the project.

You can provide a custom name for the **sass directory**, a custom name for the **main sass import file**, and any **parent directories** (for example, an assets directory).

This will generate a ```css-burrito-config.json``` file, that can later be edited to further customize the template.

```
burrito -n [folder-name] [file-name] [path-to-sass-directory]
```

### Adding New Modules
css-burrito will add new modules files, and @import them into the project for you!

To use this feature run:

```
burrito -m (file-name[s])
```

### Remove Modules
css-burrito will also delete unnecessary modules files, and remove the @import from the project for you!

To use this feature run:

```
burrito -r (file-name[s])
```

### List the Files in the Modules Directory
css-burrito will list your module files for you.

To use this feature run:

```
burrito -l
```

### Want to use your own template instead of ours?

You can, and you'll still get all the superpowers!  You'll just need to edit the template directories and files in the ``` css-burrito-config.json ``` file.

So this:
```
...
"template": {
  "directories": [
    "global",
    "libs"
  ],
  "files": [
    "libs/_library-variable-overrides.scss",
    "libs/_normalize.scss",
    "global/_settings.scss",
    "global/_utilities.scss",
    "global/_base.scss",
    "global/_layout.scss",
    "global/_skin.scss",
    "global/_typography.scss"
  ]
}
```

Becomes this:
```
...
"template": {
  "directories": [
    "global",
    "libs",
    "new-directory",
    "new-directory/nested"
  ],
  "files": [
    "new-directory/_new-file.scss",
    "new-directory/nested/_new-nested-file.scss",
    "libs/_library-variable-overrides.scss",
    "libs/_normalize.scss",
    "global/_settings.scss",
    "global/_utilities.scss",
    "global/_base.scss",
    "global/_layout.scss",
    "global/_skin.scss",
    "global/_typography.scss"
  ]
}
```

Then generate the new project:

```
burrito -g
```

### What's in our burrito template?

css-burrito has four main ingredients.
#### **1.  application.scss**
* This file imports all of the other files from the **libs**, **global** and **module** sections.
* It has an **inbox** section where developers that don't usually work on the project can leave temporary code that is easily seen by the maintainers of the project.
* It also has a **shame** section for quick fixes, hacks, and other questionable techniques.  Be sure to fix them later.

#### **2.  libs**
* This section houses third party CSS libraries like [Normalize](http://necolas.github.io/normalize.css/), [Bootstrap](http://getbootstrap.com/), or [Foundation](http://foundation.zurb.com/).
* It also contains a ```_library-variable-overrides.scss``` file for overriding third party variables.
* Normalize v3.0.2 is included in the libs folder by default.

#### **3.  global** -  There are six global components.
* **settings** - @font-face and global variables
* **utilities** - placeholders, extends, mixins, functions, etc.
* **base** - global defaults for base-level tags (body, p, etc.)
* **layout** - global layout classes (margin, padding, floats, etc).
* **skin** - global skin classes (gradients, colors, box-shadows, etc).
* **typography** - global typography classes.

#### **4.  modules**
* Any unit of style that can be found across multiple pages (Buttons, Navigations, Modals).
* **Most of your styles should be found here.**

### Need Help?

```
burrito -h
```
