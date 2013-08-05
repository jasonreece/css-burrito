#CSS Burrito  
#An organizational Sass Template. 

This template pulls heavily from the following CSS Architectures:  

OOCSS  
[http://oocss.org/] (http://oocss.org/)

SMACSS  
[http://smacss.com/] (http://smacss.com/)

MVCSS  
[http://mvcss.github.io/] (http://mvcss.github.io/)

##How to add the template to your project:
It's simple, just delete your current stylesheets directory (or whatever the folder that houses your CSS files is named), and replace it with this one.  Then update your path on your projects index page if necessary.

**Note for Rails Users:** 
Any new .scss files that are created by generating Rails controls will not be used, and can be deleted.

##Whats in the template, and how do I use it?
There are four main sections in this Template.  **Application.css.scss**, **Libs**, **Core**, and **Modules**.

####**Application.css.scss**
- This section serves three purposes.  
* It imports all of the files from the **Libs**, **Core** and **Module** sections.  
* It has an **Inbox** section where developers that don't usually work on the project can leave temporary files that are easily seen by the maintainers of the project
* It has a **Shame** section for quick fixes, hacks, and other questionable techniques.  Be sure to fix them later.

#### **Libs**
This section will house CSS libraries like **Normalize**, **Bootstrap**, **Foundation**, or **Pure**.  
It also contains a **library-variable-overrides** file.  Be sure to make any library variable changes here.
  
#### **Core** -  There are five core components.
* **Settings** - @font-face and global variables
* **Helpers** - Extends, Functions, Mixins
* **Base** - Base-level tags (body, p, etc.)
* **Typography** - Base-level typography (colors, fonts).
* **Layouts** - Base-level layout (margin, padding, sizing).  

**Modules**  
Any unit of style that can be found across multiple pages (Buttons, Navigations, Modals).  
**Most of your styles should be found here.**  

##What are States?
* States are styles that override all other styles.  Usually via javascript.  
* States are generally applied to the same element as a layout rule, or to the same element as a base module.
* An example would be a navigation drop down, or a message that displays a success or error state. 
* State classnames should be written as a boolean.  For example, .is-collapsed or is-error.
* When state rules are added to specific modules, the module name should be included in the classname.  For example, an active tab state could be written as .is-tab-active.

##Suggested Styleguide

####General Styling  
* Avoid using ID's.  Use classes instead.
* All CSS class names should use dashes instead of underscores or camel case.
* Each indentation level is made up of two spaces. Avoid using tabs.
* Do not over-qualify class name selectors with an element type unless you are specifying exceptions to the default styling of a particular class.
* Use one discrete, comma separated selector per line in multi-selector rulesets.

####Preprocessors 
* Do not nest deeper than 3 levels (with the exception of pseudo/hover states).
* Declare @extend followed by @include statements first in a declaration block whenever possible.
* If :hover pseudo class is styled, :focus should also be styled for accessibility. Focus styles should never be removed.
