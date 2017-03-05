## Key notes on badge_component.html
- Square brackets [] specify a property on the element. This example references the disabled property on the button.
- The [disabled] = "!isButtonEnabled" text enables or disables the button element, based on the value of the corresponding Dart variable.
- You will add isButtonEnabled to the Dart code in the next section.
- The (click)="generateBadge()" text sets up an event handler for button clicks. Whenever the user clicks the button, the generateBadge() method is called. You’ll add the generateBadge() event handler to the Dart code in the next section.
- The buttonText variable will soon be defined in the Dart code. The \<button ...\> {{buttonText}} \</button\> code tells Angular to display the value of buttonText on the button.
