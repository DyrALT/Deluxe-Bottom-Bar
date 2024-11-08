import 'package:flutter/material.dart';

/// A style configuration class for the buttons in the DeluxeBottomBar.
///
/// This class allows customization of button colors for both selected
/// and unselected states, providing flexible styling for the bottom bar.
class DeluxeBottomBarButtonStyle {
  /// Creates a style configuration for the buttons in the DeluxeBottomBar.
  ///
  /// [selectedButtonBackgroundColor] defines the background color of the
  /// selected button. [selectedButtonIconColor] sets the icon color for
  /// the selected button. [iconColor] sets the icon color for unselected
  /// buttons.
  ///
  /// [iconSize] sets the size of the icon in the button.
  /// Defaults to 20.
  const DeluxeBottomBarButtonStyle({
    this.selectedButtonBackgroundColor,
    this.selectedButtonIconColor,
    this.iconColor,
    this.iconSize = 20,
  });

  /// The background color of the selected button.
  ///
  /// If null, the theme's primary color will typically be used.
  final Color? selectedButtonBackgroundColor;

  /// The color of the icon displayed in the selected button.
  ///
  /// If null, this will default to a contrasting color for visibility.
  final Color? selectedButtonIconColor;

  /// The icon color for unselected buttons.
  ///
  /// If not specified, this defaults to black.
  final Color? iconColor;

  /// The size of the icon in the button.
  final double iconSize;
}
