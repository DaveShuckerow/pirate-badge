## Key notes on app_component.dart
- Importing core.dart lets the app use Component and other common Angular types.
- The @Component annotation defines AppComponent as an Angular component.
- The @Component constructor has two named parameters: selector and template.
- The selector parameter specifies a CSS selector for this component. Angular creates and displays an instance of AppComponent when it encounters a \<my-app\> element in the HTML.
- The template parameter specifies the HTML that’s inserted whenever a \<my-app\> element appears in the app. This simple component displays a title.
- The double curly braces, {{ and }}, indicate an Angular interpolation binding expression. At runtime, Angular replaces {{name}} with the value of the component’s name property.
- For any nontrivial template, use a templateUrl parameter instead of template, and put the template code in its own HTML file. The next step shows how to use templateUrl.
