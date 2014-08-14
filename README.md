#**css-burrito**
##**An organizational Sass template**

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
####**1.  Application.css.scss**
- This section serves three purposes.
* It imports all of the files from the **Libs**, **Core** and **Module** sections.
* It has an **Inbox** section where developers that don't usually work on the project can leave temporary code that is easily seen by the maintainers of the project.
* It has a **Shame** section for quick fixes, hacks, and other questionable techniques.  Be sure to fix them later.

#### **2.  Libs**
This section can house third party CSS libraries like [Normalize](http://necolas.github.io/normalize.css/), [Bootstrap](http://getbootstrap.com/), or [Foundation](http://foundation.zurb.com/).
It also contains a ```_library-variable-overrides.scss``` file.  Any overrides to Bootstrap or other library variables should be made in this file to prevent unnecessary overwriting.
**Normalize** is included in the libs folder by default.

#### **3.  Core** -  There are six core components.
* **Settings** - @font-face and global variables
* **Helpers** - Placeholders, Extends, Mixins, Functions, etc.
* **Base** - Global defaults for Base-level tags (body, p, etc.)
* **Layout** - Global layout classes (margin, padding, floats, etc).
* **Skin** - Global skin classes (gradients, colors, box-shadows, etc).
* **Typography** - Global typography classes.

####**4.  Modules**
* Any unit of style that can be found across multiple pages (Buttons, Navigations, Modals).
* **Most of your styles should be found here.**

###Wrapping it all together.
This template should feel intuitive and easy to use.  The goal is to keep everything organized so that large projects will scale nicely without duplicating code, or having unnecessary increases in specificity.

#### Components

To avoid littering your markup with classes, and to promote code reuse, I suggest using the following pattern whenever possible.

The Markup:

        <div class="example-c-component">

The Sass:

        // ----- example-component ---- //

        %example-l-component {
          // write layout code here...
        }

        %example-s-component {
          // write skin code here...
        }

        %example-t-component {
          // write typography code here...
        }

        .example-c-component {
          @extend %example-l-component;
          @extend %example-s-component;
          @extend %example-t-component;
          // add and remove placeholders as needed...
        }

This pattern allows you to easily separate layout, skin, and typography within a given module.

##Automation
### Adding New Modules
To make adding new modules easy, css-burrito has a shell script that will add new modules for you.

**To use this feature:**

Open up the command line, and navigate to the project root.

```
cd ~/Desktop/css-burrito-master
```

Then run the following command:


```
./setup.sh
```

This will only need to be done once.

After that, navigate to the project directory that has a ```burrito.sh``` file.  (This should be a sibling to the stylesheets directory.)

From here, in the command line, you can type:

```
burrito example-module
```

This will create a file with some default comments, in this case named ```_example-module.scss``` and import it into the main ```_modules.scss``` file for you.

###Adding New Components
Using the above component pattern can be painful to type over and over.  Instead, use a snippet manager like [Dash](http://kapeli.com/dash) to write it for you.

This is the Dash snippet that I use:

        // ----- __1__-__2__ ---- //
        %__1__-l-__2__ {
          @cursor
        }

        %__1__-s-__2__ {

        }

        %__1__-t-__2__ {

        }

        .__1__-c-__2__ {
          @extend %__1__-l-__2__;
          @extend %__1__-s-__2__;
          @extend %__1__-t-__2__;
        }

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
* If a ```:hover``` pseudo class is styled, ```:focus``` should also be styled for accessibility. Focus styles should never be removed
