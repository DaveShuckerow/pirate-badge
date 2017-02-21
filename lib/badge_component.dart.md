## Key notes from badge_component.dart

### Step 2
- The pirate badge component manages the portion of the UI that displays the pirate badge. By the end of this code lab, the pirate badge component will also provide an input field for entering a name, and a button for generating a pirate name.
- Metadata gives additional information about code. In Dart, a metadata annotation (usually just called an annotation) begins with the character @, followed by either a reference to a compile-time constant or a call to a constant constructor.
- The styleUrls parameter to the Component constructor specifies the file that contains the CSS styling for this component.
- The code [\<value\>] creates a list that contains a single value (in this case the name of the CSS file).
- The const modifier on the list literal, const ['badge_component.css'], converts the collection to a compile-time constant. Recall that Component(...) is a constant constructor, and all arguments to constant constructors must be compile-time constants.

### Step 3
- When an input event occurs on the badge component, Angular calls updateBadge() with the value entered by the user.

### Step 4
- All instance variables defined in an Angular component are visible to the template for that component.
- As you’ve seen, the HTML template uses isButtonEnabled when determining whether to display the button.
- Clicking the button displays “Davy Jones” on the pirate badge. In Step 5, you replace this with more interesting logic.
- Enable the button if the input field is empty, otherwise disable it.
- The text on the button also changes depending on whether it’s enabled.
