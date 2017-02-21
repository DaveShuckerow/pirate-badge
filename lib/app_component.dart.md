## Key notes on app_component.dart (Step 1)
- Importing core.dart lets the app use Component and other common Angular types.
- The @Component annotation defines AppComponent as an Angular component.
- The @Component constructor has two named parameters: selector and template.
- The selector parameter specifies a CSS selector for this component. Angular creates and displays an instance of AppComponent when it encounters a \<my-app\> element in the HTML.
- The template parameter specifies the HTML that’s inserted whenever a \<my-app\> element appears in the app. This simple component displays a title.
- The double curly braces, {{ and }}, indicate an Angular interpolation binding expression. At runtime, Angular replaces {{name}} with the value of the component’s name property.
- For any nontrivial template, use a templateUrl parameter instead of template, and put the template code in its own HTML file. The next step shows how to use templateUrl.

## Key notes on app_component.dart (Step 2)
- A component imports the other components that it uses.
- By default, every Dart file is a separate library.
- When you have multiple Dart files under lib, they can import each other using relative paths, for example, import 'badge_component.dart'. However, any file that’s not under lib (web/main.dart, for example) must use a package: URL to import libraries defined under lib.
- After you import the library, the analyzer warns that you have an unused import. This error will go away later, when you add the BadgeComponent directive.

- Any components that this component directly uses are listed in the directives: field.
- When the app component is loaded, Angular detects the <pirate-badge> selector and loads the BadgeComponent class.
