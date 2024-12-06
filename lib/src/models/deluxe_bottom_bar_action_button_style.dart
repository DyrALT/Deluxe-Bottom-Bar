import 'package:flutter/material.dart';

/// A style configuration class for the action button in the DeluxeBottomBar.
///
/// This class allows customization of the action button's appearance,
/// including its background and icon colors, to match the overall
/// design of the bottom bar.
class DeluxeBottomBarActionButtonStyle {
  /// Creates a style configuration for the DeluxeBottomBar's action button.
  ///
  /// [backgroundColor] defines the button's background color.
  /// [iconColor] defines the color of the button's icon.
  /// [icon] sets the icon displayed in the action button.
  const DeluxeBottomBarActionButtonStyle({
    this.backgroundColor,
    this.iconColor,
    this.icon = Icons.add,
  });

  /// The background color of the action button.
  ///
  /// If left null, the default background color will be used.
  final Color? backgroundColor;

  /// The color of the icon displayed in the action button.
  ///
  /// If null, the icon color will default to a standard value.
  final Color? iconColor;

  /// The icon displayed in the action button.
  ///
  /// If not provided, the icon will default to the add icon.
  final IconData icon;


}
