## Key notes on app_component.dart
- A component imports the other components that it uses.
- By default, every Dart file is a separate library.
- When you have multiple Dart files under lib, they can import each other using relative paths, for example, import 'badge_component.dart'. However, any file that’s not under lib (web/main.dart, for example) must use a package: URL to import libraries defined under lib.
- After you import the library, the analyzer warns that you have an unused import. This error will go away later, when you add the BadgeComponent directive.

- Any components that this component directly uses are listed in the directives: field.
- When the app component is loaded, Angular detects the <pirate-badge> selector and loads the BadgeComponent class.
