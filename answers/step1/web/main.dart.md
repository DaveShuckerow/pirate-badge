## Key notes on main.dart
- The main() function is the single entry point for the app.
- main() is a top-level function. A top-level variable or function is one that is declared outside a class definition.
- The top lines import two libraries.
- The package: syntax specifies the location of the library.
- This app depends on the angular2 package, which the pub tool downloads from pub.dartlang.org. Files that call bootstrap() import platform/browser.dart from the angular package.
- The second import, app_component.dart, loads the app component, AppComponent. The package:pirate_badge/app_component.dart text tells the pub tool to look for this file under the lib directory of this app.
- By convention, Dart filenames are lower_case_with_underscores, while Dart class names are CamelCase. So, the app_component.dart file defines the AppComponent class.
- Calling bootstrap() starts your app, with the specified component as the app’s root component.
