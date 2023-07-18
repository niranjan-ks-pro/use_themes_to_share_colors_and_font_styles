# use_themes_to_share_colors_and_font_styles
 https://docs.flutter.dev/cookbook/design/themes#creating-an-app-theme
Use themes to share colors and font styles
==========================================

1.  [Cookbook](https://docs.flutter.dev/cookbook)
2.  [Design](https://docs.flutter.dev/cookbook/design)
3.  [Themes](https://docs.flutter.dev/cookbook/design/themes)

To share colors and font styles throughout an app, use themes. You can either define app-wide themes, or use `Theme` widgets that define the colors and font styles for a particular part of the application. In fact, app-wide themes are just `Theme` widgets created at the root of an app by the `MaterialApp`.

After defining a Theme, use it within your own widgets. Flutter's Material widgets also use your Theme to set the background colors and font styles for AppBars, Buttons, Checkboxes, and more.

[](https://docs.flutter.dev/cookbook/design/themes#creating-an-app-theme)Creating an app theme
----------------------------------------------------------------------------------------------

To share a Theme across an entire app, provide a [`ThemeData`](https://api.flutter.dev/flutter/material/ThemeData-class.html) to the `MaterialApp` constructor.

If no `theme` is provided, Flutter creates a default theme for you.

content_copy

```
MaterialApp(
  title: appName,
  theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
    ),
  ),
  home: const MyHomePage(
    title: appName,
  ),
);
```

See the [`ThemeData`](https://api.flutter.dev/flutter/material/ThemeData-class.html) documentation to see all of the colors and fonts you can define.

[](https://docs.flutter.dev/cookbook/design/themes#themes-for-part-of-an-application)Themes for part of an application
----------------------------------------------------------------------------------------------------------------------

To override the app-wide theme in part of an application, wrap a section of the app in a `Theme` widget.

There are two ways to approach this: creating a unique `ThemeData`, or extending the parent theme.

info Note: To learn more, watch this short Widget of the Week video on the Theme widget:

### [](https://docs.flutter.dev/cookbook/design/themes#creating-unique-themedata)Creating unique `ThemeData`

If you don't want to inherit any application colors or font styles, create a `ThemeData()` instance and pass that to the `Theme` widget.

content_copy

```
Theme(
  // Create a unique theme with `ThemeData`
  data: ThemeData(
    splashColor: Colors.yellow,
  ),
  child: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
);
```

### [](https://docs.flutter.dev/cookbook/design/themes#extending-the-parent-theme)Extending the parent theme

Rather than overriding everything, it often makes sense to extend the parent theme. You can handle this by using the [`copyWith()`](https://api.flutter.dev/flutter/material/ThemeData/copyWith.html) method.

content_copy

```
Theme(
  // Find and extend the parent theme using `copyWith`. See the next
  // section for more info on `Theme.of`.
  data: Theme.of(context).copyWith(splashColor: Colors.yellow),
  child: const FloatingActionButton(
    onPressed: null,
    child: Icon(Icons.add),
  ),
);
```

[](https://docs.flutter.dev/cookbook/design/themes#using-a-theme)Using a Theme
------------------------------------------------------------------------------

Now that you've defined a theme, use it within the widgets' `build()` methods by using the `Theme.of(context)` method.

The `Theme.of(context)` method looks up the widget tree and returns the nearest `Theme` in the tree. If you have a standalone `Theme` defined above your widget, that's returned. If not, the app's theme is returned.

In fact, the `FloatingActionButton` uses this technique to find the `accentColor`.

content_copy

```
Container(
  color: Theme.of(context).colorScheme.secondary,
  child: Text(
    'Text with a background color',
    style: Theme.of(context).textTheme.titleLarge,
  ),
),
```

`\
`
