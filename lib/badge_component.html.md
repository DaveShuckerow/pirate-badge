## Key notes on badge_component.html

### Step 2
- You’ve just defined a template for an Angular component. Angular templates use HTML but don’t have all the tags that HTML pages do. For example, Angular templates don’t have \<head\> or \<body\> tags.
- The \<div class =...\> code defines areas of content that you can style. Later in this step, you add a style sheet (a CSS file) that defines how the badge should be displayed. This lab doesn’t cover how to write CSS. The resources page has information on where you can learn more about CSS styling.
- You will add badgeName to the Dart code as an instance variable in the next section.
- All instance variables defined in an Angular component are available to the template for that component.
- The curly bracket notation, {{expression}}, is sometimes called double mustaches. This notation creates a one-way binding between the HTML template and the Dart code.
- The expression inside the curly brackets is evaluated using interpolation, a process where Angular evaluates the expression and converts it to a string.
- Angular’s expression interpolation is different from Dart’s string interpolation.
- In a double-mustache binding, data is copied from an expression into the UI. So, when the value of badgeName changes in the Dart code, the value in the UI automatically updates.

### Step 3
- \<input...\> defines an HTML5 input element.
- The (input)="updateBadge(...)" text creates an event binding.
- The target of the event appears to the left of the equals sign in parentheses, (input). This event binding listens for an input event on the input field.
- The template statement, updateBadge($event.target.value), appears (in quotes) to the right of the equals sign.
- This template statement calls a method called updateBadge() that you’ll define soon in Dart code. The argument is the value that the user entered.
- As you can see, a template statement can use functions and variables defined in a component’s Dart code.
- The event object, $event, contains the value of the raised event. In this example, the event object represents the DOM event object, so the new value resides in $event.target.value.
- The template statement executes whenever an input event occurs on this element.
- By convention, a template statement is short—more complex logic should be placed in a function and called from the template statement.
- The maxLength="15" text limits user input to 15 characters.

### Step 4
- Square brackets [] specify a property on the element. This example references the disabled property on the button.
- The [disabled] = "!isButtonEnabled" text enables or disables the button element, based on the value of the corresponding Dart variable.
- You will add isButtonEnabled to the Dart code in the next section.
- The (click)="generateBadge()" text sets up an event handler for button clicks. Whenever the user clicks the button, the generateBadge() method is called. You’ll add the generateBadge() event handler to the Dart code in the next section.
- The buttonText variable will soon be defined in the Dart code. The \<button ...\> {{buttonText}} \</button\> code tells Angular to display the value of buttonText on the button.

### Step 6
- isInputEnabled refers to a property that you’ll add to this component’s Dart file.
