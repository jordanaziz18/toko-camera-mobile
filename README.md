
## Assignment 7


### 1
Stateless Widgets
- Definition: Stateless widgets are immutable. They represent the part of the user interface that does not change over time. These widgets are built once and never rebuild unless they are re-rendered by their parent widget.
- Example: Text, Icon, Row, Column, Container.
- Use-Case: When the user interface only needs to display static information or visuals.

Stateful Widgets
- Definition: Stateful widgets are dynamic and can rebuild their UI when their internal state changes. They maintain a mutable state and have a lifecycle that lets them rebuild based on state updates.
- Example: Checkbox, Slider, TextField, custom widgets that need to update UI dynamically.
- Use-Case: Used when a widget needs to handle user interactions, dynamic updates, or asynchronous data.

### 2
- Scaffold: Provides the basic structure for the app (AppBar, Body, Drawer, etc.).
- AppBar: Displays the title and navigation controls at the top.
- FutureBuilder: Used to handle asynchronous data fetching (e.g., from the Django API).
- ListView.builder: Efficiently creates a scrollable list of products.
- Container: Used for styling, such as padding, margins, and colors for individual product cards.
- Text: Displays product details like name, price, and description.
- GestureDetector: Captures user interactions, like taps, to navigate to the details page.
- Provider & CookieRequest: Handle the state of authentication and API requests.

### 3
- Purpose: setState is used to update the state of a StatefulWidget and trigger a rebuild of the widget's UI.
- When to Use:
    Whenever the underlying data displayed by a widget changes (e.g., a new API response, a user interaction like a button click, or a counter update).

### 4
 final is used when we want to create a variable that can be assigned once but whose value can be determined at runtime. While const is used when we want to define a variable whose value is fixed at compile time and can’t change at runtime.






## Assignment 8

### 1
* Purpose of const in Flutter
- Definition: The const keyword in Flutter defines objects that are immutable and can be assigned at compile time.

- Purpose: 
    - Improves performance by enabling Flutter to reuse widget instances without re-creating them.
    - Reduces memory usage by ensuring compile-time constants are shared across the app.

* Advantages of Using const
1. Widget Optimization: Widgets marked with const are created only once during compile-time and are reused whenever possible.
2. Improved Performance: Avoids unnecessary rebuilds, which is particularly useful for large widget trees.
3. Better Readability and Maintenance: Explicitly shows which widgets are immutable.
4. Consistency: Helps prevent accidental modification of values that should not change.


### 2
Column and Row in Flutter
 - Column:

    * Aligns its children vertically.
    * Expands in the vertical direction but restricts horizontal space.
    * Often used for stacking widgets in a vertical list.
- Row:

    * Aligns its children horizontally.
    * Expands in the horizontal direction but restricts vertical space.
    * Often used for side-by-side alignment.

### 3
Input elements I used in this assignment is the:

Textfield:
```dart
child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                ),
                onChanged: (String? value) {
                    setState(() {
                    _productName = value!;
                    });
                },
                validator: (String? value) {
                    if (value == null || value.isEmpty) {
                    return "Product name cannot be empty!";
                    }
                    if (value.length > 150) {
                    return "Product name cannot be longer than 150 characters!";
                    }
                    return null;
                },
                ),
```
Input Elements I did Not use are the:

* Checkbox
* Switch
* Slider
* DropdownButton
* Radio

### 4
Theme in Flutter

- Purpose:
    * Ensure consistency across the app for colors, fonts, and visual aesthetics.
    * Makes it easier to implement changes globally (e.g., switching themes).

    ```dart
    theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepOrange,
          ).copyWith(secondary: Colors.deepOrange[400]),
        ),
    ```

### 5
- Managing navigation in multi-paged flutter apps are usually handled using the Navigator widget. The navigator works like the stack data structure in a sense where:

- Navigator.push() Is used to go to a new page
- Navigator.pop() Is used to return to a previous page


