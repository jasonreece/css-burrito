**css-burrito** -  an organizational Sass template  

To understand why you would want to use this template, it is a great idea to familiarize yourself with the following css architectures:  

####[OOCSS](http://oocss.org/) - Object Oriented CSS

* **Separate structure and skin** - Structure properties like width and height should be separated from skin properties like background and border.
* **Separate content from container** - Content modules like buttons and lists should not be dependent on their parent containers.  

####[SMACSS] (http://smacss.com/) - Scalable and Modular Architecture for CSS

* Increase the semantic value of HTML and content.
* Decrease the expectation of a specific HTML structure. 
* Organize your css files into sections like **base rules**, **layout rules**, and **modules** so that the styling will be flexible and easily maintainable.

####[MVCSS] (http://mvcss.github.io/) - A Sass based CSS architecture and style guide.  



Ok, now that you're familiar with those concepts, are you hungry for some burrito?

### What is css-burrito?  
css-burrito is a sass template to help integrate suggested best practices into any project.

To use this template, just delete your current stylesheets directory (or whatever the folder that houses your CSS files is named), and replace it with this one. Then update your path on your projects index page if necessary.

**Note for Rails Users:** 
Any new .scss files that are created by generating Rails controls will not be used, and can be deleted.

###What is in this burrito?

css-burrito has four main ingredients.  
####**1.  Application.css.scss**
- This section serves three purposes.  
* It imports all of the files from the **Libs**, **Core** and **Module** sections.  
* It has an **Inbox** section where developers that don't usually work on the project can leave temporary files that are easily seen by the maintainers of the project
* It has a **Shame** section for quick fixes, hacks, and other questionable techniques.  Be sure to fix them later.

#### **2.  Libs**
This section will house CSS libraries like [Normalize](http://necolas.github.io/normalize.css/), [Compass](http://compass-style.org/), [Bootstrap](http://getbootstrap.com/), [Foundation](http://foundation.zurb.com/), or [Pure](http://purecss.io/).  
It also contains a **library-variable-overrides** file.  Any overrides to Bootstrap or other library variables should be made in this file to prevent unnecessary overwriting.  
**Normalize** is included in the libs folder by default.
  
#### **3.  Core** -  There are five core components.
* **Settings** - @font-face and global variables
* **Helpers** - Extends, Functions, Mixins
* **Base** - Base-level tags (body, p, etc.)
* **Typography** - Base-level typography (colors, fonts).
* **Layouts** - Base-level layout (margin, padding, sizing).  

####**4.  Modules**  
Any unit of style that can be found across multiple pages (Buttons, Navigations, Modals).  
**Most of your styles should be found here.**

###Lets talk about States.

Inside the **layouts** file and in the **example-module** file, there is a section for styling states.

* States are styles that override all other styles.  Usually via javascript.  
* States are generally applied to the same element as a layout rule, or to the same element as a base module.
* An example would be a navigation drop down, or a message that displays a success or error state. 
* State classnames should be written as a boolean.  For example, .is-collapsed or is-error.
* When state rules are added to specific modules, the module name should be included in the classname.  For example, an active tab state could be written as .is-tab-active.

###Wrapping it all together.
This template should feel intuitive and easy to use.  The goal is to keep everything organized so that large projects will scale nicely without duplicating code, or having unnecessary increases in specificity.

See something that could be improved?  Tweet [@jason_reece](https://twitter.com/Jason_Reece) with your thoughts.