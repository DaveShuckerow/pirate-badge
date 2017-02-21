## Key notes on badge_component.html
- You’ve just defined a template for an Angular component. Angular templates use HTML but don’t have all the tags that HTML pages do. For example, Angular templates don’t have \<head\> or \<body\> tags.
- The \<div class =...\> code defines areas of content that you can style. Later in this step, you add a style sheet (a CSS file) that defines how the badge should be displayed. This lab doesn’t cover how to write CSS. The resources page has information on where you can learn more about CSS styling.
- You will add badgeName to the Dart code as an instance variable in the next section.
- All instance variables defined in an Angular component are available to the template for that component.
- The curly bracket notation, {{expression}}, is sometimes called double mustaches. This notation creates a one-way binding between the HTML template and the Dart code.
- The expression inside the curly brackets is evaluated using interpolation, a process where Angular evaluates the expression and converts it to a string.
- Angular’s expression interpolation is different from Dart’s string interpolation.
- In a double-mustache binding, data is copied from an expression into the UI. So, when the value of badgeName changes in the Dart code, the value in the UI automatically updates.
