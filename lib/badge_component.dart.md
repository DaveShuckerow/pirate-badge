## Key notes from badge_component.dart
- ngOnInit() is one of the lifecycle hooks available in Angular. Angular calls ngOnInit() after the component is initialized.
- Mark the function body with async, so this function can use the await keyword.
- Asynchronous functions must return a Future.
- Specifying @override and Future\<Null\> is optional, but it makes the intent of the code clearer.
- Call the readyThePirates() function, which immediately returns a Future.
- When the Future returned by readyThePirates() successfully completes, set up the UI.
- Use try and catch to detect and handle errors.
