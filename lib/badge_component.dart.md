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

### Step 5
- providers:
  - The providers part of @Component tells Angular what objects are available for injection in this component.
  - You can reformat your code by right-clicking in the editor view and selecting Format.
- \_nameService
  - A final variable can be set only once. \_nameService is a final field–an instance variable that’s declared final. Final fields must be set before the constructor body runs.
  - Whenever Angular creates a pirate-badge component, Angular’s dependency injection framework supplies the NameService object that the BadgeComponent constructor needs.
  - The @Injectable annotation on NameService, combined with the providers list containing NameService, lets Angular create the NameService object.
  - If you’ve used Java, you’ve seen this before. You can access local instance variables using this. Dart only uses this when necessary, otherwise Dart style omits it.
  - Note that the BadgeComponent constructor has no body. The this.\_nameService text in the argument list assigns the passed-in parameter to the \_nameService variable. Since the assignment happens in the argument list, and the constructor doesn’t need to do anything else, the body isn’t needed.

  - If \_nameService weren’t a final variable, this code could be replaced with:
  ```
  BadgeComponent(var nameService) {
    _nameService = nameService;
  }
  ```
  - But since \_nameService is final, it has to be initialized when it’s declared, or in the constructor’s argument list.
- setBadgeName
  - [String newName = ''] is an optional positional parameter with a default value of the empty string.

### Step 6
- ngOnInit() is one of the lifecycle hooks available in Angular. Angular calls ngOnInit() after the component is initialized.
- Mark the function body with async, so this function can use the await keyword.
- Asynchronous functions must return a Future.
- Specifying @override and Future\<Null\> is optional, but it makes the intent of the code clearer.
- Call the readyThePirates() function, which immediately returns a Future.
- When the Future returned by readyThePirates() successfully completes, set up the UI.
- Use try and catch to detect and handle errors.
