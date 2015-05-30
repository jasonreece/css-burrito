#**css-burrito**
##**An organizational Sass template**

### Quick Install

Clone the Repo or install with npm.

```
npm install -g css-burrito
```

In the command line, navigate to the folder that you want to install the project, and run:

```
burrito -n
```

### Adding New Modules
css-burrito will add new modules for you!

To use this feature navigate to the modules folder and run:

```
burrito example-module
```

This will create a new module file, in this case named ```_example-module.scss``` and import it into the main ```_modules.scss``` file for you.

### Why css-burrito?

To understand why you would want to use this template, it is a great idea to familiarize yourself with the following css architectures:

####[OOCSS](http://oocss.org/) - Object Oriented CSS

* **Separate structure and skin** - Structure properties like padding and margin should be separated from skin properties like background and border.
* **Separate content from container** - Content modules like buttons and lists should not be dependent on their parent containers.

####[SMACSS](http://smacss.com/) - Scalable and Modular Architecture for CSS

* Increase the semantic value of HTML and content.
* Decrease the expectation of a specific HTML structure.
* Organize your css files into sections like **base rules**, **layout rules**, and **modules** so that the styling will be flexible and easily maintainable.

Ok, now that you're familiar with those concepts, are you hungry for some burrito?

###What's in this burrito?

css-burrito has four main ingredients.
####**1.  application.scss**
* This file imports all of the other files from the **libs**, **core** and **module** sections.
* It has an **inbox** section where developers that don't usually work on the project can leave temporary code that is easily seen by the maintainers of the project.
* It also has a **shame** section for quick fixes, hacks, and other questionable techniques.  Be sure to fix them later.

#### **2.  libs**
* This section houses third party CSS libraries like [Normalize](http://necolas.github.io/normalize.css/), [Bootstrap](http://getbootstrap.com/), or [Foundation](http://foundation.zurb.com/).
* It also contains a ```_library-variable-overrides.scss``` file for overriding third party variables.
* Normalize v3.0.2 is included in the libs folder by default.

#### **3.  core** -  There are six core components.
* **settings** - @font-face and global variables
* **utilities** - placeholders, extends, mixins, functions, etc.
* **base** - global defaults for base-level tags (body, p, etc.)
* **layout** - global layout classes (margin, padding, floats, etc).
* **skin** - global skin classes (gradients, colors, box-shadows, etc).
* **typography** - global typography classes.

####**4.  modules**
* Any unit of style that can be found across multiple pages (Buttons, Navigations, Modals).
* **Most of your styles should be found here.**

###Wrapping it all together.
This template should feel intuitive and easy to use.  The goal is to keep everything organized so that large projects will scale nicely without duplicating code, or having unnecessary increases in specificity.

##Suggested Styleguide

####General Styling
* Avoid using ID's.  Use classes instead.
* All CSS class names should use dashes instead of underscores or camel case.
* All CSS class names should begin with a prefix describing the filename where the styles will be written.
* For example:
    * A layout class name should be written as: ```l-example-classname```
    * A typography class name should be written as: ```t-example-classname```
    * A module class name should be written as: ```modulename-example-classname```
    * Utility class names should be written as: ```u-example-classname```
* Do not over-qualify selectors.  Keep specificity as low as possible.
* Use one discrete, comma separated selector per line in multi-selector rulesets.

####Preprocessors
* Do not nest deeper than 3 levels (with the exception of pseudo/hover states).
* Declare ```@extend``` followed by ```@include``` statements first in a declaration block whenever possible.
* If a ```:hover``` pseudo class is styled, ```:focus``` should also be styled for accessibility. Focus styles should never be removed.
