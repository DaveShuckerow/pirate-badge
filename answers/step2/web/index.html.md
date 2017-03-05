## Key notes on index.html
- The first \<script\> tag identifies the main file that implements the app. Here, it’s the main.dart file. The Dart VM launches the app using this file.
- The packages/browser/dart.js script checks for native Dart support (for example, Dartium) and either bootstraps the Dart VM or loads compiled JavaScript instead.
- When Angular detects the \<my-app\> selector, it loads an instance of the component associated with that selector. In this example, that’s the AppComponent class.
