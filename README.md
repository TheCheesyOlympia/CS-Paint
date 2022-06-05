# CS-Paint
## A paint-based editor to be implemented in Processing

PROTOTYPE LINK (Design Document)
===============================
https://docs.google.com/document/d/13OaHJZIVS8gO-R3T4ZWJIYjAqkdbErOZCEEILbbUY2Q/edit#

DEVELOPMENT LOG
==============
5/23: Git cloned repo to PC, created Processing file for project
5/24: started work on implementing all classes and methods for files, updated README to give a clear log of progress
5/25: Was on a school trip, didn't have time to code in class
5/26: implemented Mr K's base code for controller and input methods
5/28-5/30: Memorial Day Camping, was not able to code during this time
5/31: Started work on proper draw function, draw now applies a proper brushstroke to the screen,
fulfilling the proof of concept requirements

MVP Timeline:
-------------

have until 6/2 to implement basic GUI and features in time for extended MVP deadline:

### 6/1: Features implemented:
- color select works now, you can change the color of the brush using the inbuilt color picker
- taskbar now has selectable UI elements (WIP)
- brush recoded as it's own class, Brush, which has constructors that will allow for different types of brushes (ie translucent, eraser, fill, etc.), allows for more flexibility with brush

### 6/2: Features implemented:
- created button constructor class, that is responsible for drawing the physical component of the tool (eraser/color selector, etc.)
- buttons can be interacted with by the mouse, and visually display if they have been selected
- clicking on a button will trigger a specific action corresponding to said button based on the location
- 4 main draw modes: pencil, eraser, fill, and picker
- save and color picker work properly, skeleton buttons for unimplemented classes

Main Timeline (Additional Features):
-------------

### 6/3: Features implemented:
- divided button into subclasses color, popup, draw, and action, with each being modified in the future with their own attributes

### 6/4: Features implemented:
- mode selection now only works with drawmode buttons
- added save functionality, can save drawings as png files
- color selection works properly without glitching

### 6/5: Features implemented:
- attempted to add sketch (pgraphics constructor class), got stuck for several hours, gave up
