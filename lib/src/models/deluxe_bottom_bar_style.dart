import 'package:flutter/material.dart';

/// A style configuration class for the overall DeluxeBottomBar appearance.
///
/// This class allows customization of the bottom bar's background color,
/// helping it to blend seamlessly with the rest of the app's design.
class DeluxeBottomBarStyle {
  /// Creates a DeluxeBottomBarStyle with optional background color.
  ///
  /// [backgroundColor] sets the background color of the entire bottom bar.
  ///
  /// [bottomPadding] sets the padding at the bottom of the bottom bar.
  ///
  /// [boxShadow] applies a shadow effect to the action button.
  const DeluxeBottomBarStyle({
    this.backgroundColor,
    this.bottomPadding = 25,
    this.boxShadow,
  });

  /// The background color of the bottom bar.
  ///
  /// If left null, the theme's surface color will typically be used,
  /// allowing the bottom bar to match the app's general style.
  final Color? backgroundColor;

  /// The padding at the bottom of the bottom bar.
  /// Defaults to 25.
  final double bottomPadding;

  /// The shadow of the action button.
  final List<BoxShadow>? boxShadow;
}
