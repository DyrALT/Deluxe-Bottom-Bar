import 'package:flutter/material.dart';

/// A style configuration class for the action button in the DeluxeBottomBar.
///
/// This class allows customization of the action button's appearance,
/// including its background to match the overall
/// design of the bottom bar.
class DeluxeBottomBarActionButtonStyle {
  /// Creates a style configuration for the DeluxeBottomBar's action button.
  ///
  /// [backgroundColor] defines the button's background color.
  /// [widget] sets the icon displayed in the action button.
  const DeluxeBottomBarActionButtonStyle({
    this.widget,
    this.backgroundColor,
  });

  /// The background color of the action button.
  ///
  /// If left null, the default background color will be used.
  final Color? backgroundColor;

  /// The icon displayed in the action button.
  final Widget? widget;
}
