## Key notes from name_service.dart
### Step 5
- Imports
  - The show keyword lets you import only the classes, top-level functions, or top-level variables that you need.
  - Random provides a random number generator.
  - The angular2/core.dart library gives you access to the Injectable class that you’ll add next.
- Constructor
  - Dependency injection, also referred to as DI, allows you to write more robust code that is easier to test.
  - When Angular detects the @Injectable() annotation, it generates necessary metadata so that the annotated object is injectable.
  - Later, you’ll add a constructor to BadgeComponent that enables injecting an instance of NameService.
- \_indexGen
  - The static annotation makes the field a class variable, rather than an instance variable. Therefore, the random number generator is shared with all instances of this class.
  - final variables must be initialized and cannot change.
  - Private variables start with underscore (\_); Dart has no private keyword.
  - The new keyword indicates a call to the constructor.
- \_names and \_apellations
  - Lists are built into the language and are similar to arrays in other languages. The \_names and \_appellations lists are created using list literals.
  - The List class provides the API for lists.
  - The \<String\> before the \[ indicates that the list contains only strings.
  - You could specify the type for \_names and \_appellations by changing final to final List\<String\>, but you don’t need to. Dart can get the type information from the initial value.

- \_getRandomFirstName and \_getRandomApellation
  - The code uses a random number as an index into the list.
  - The fat arrow ( => expr; ) syntax is a shorthand for { return expr; }.
  - The nextInt() function gets a new random integer from the random number generator.
  - Use square brackets ([ and ]) to index into a list.
  - The length property returns the number of items in a list.
- getPirateName
  - String interpolation ('$firstName the ${_randomAppellation()}') lets you easily build strings from other objects. To insert the value of an expression, use ${expr}. You can drop the curly brackets when the expression is an identifier: $id.
  - Dart’s string interpolation is different from Angular’s expression interpolation.
