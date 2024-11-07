import 'package:flutter/material.dart';

/// Represents an individual item in the DeluxeBottomBar.
///
/// Each item includes an icon and an optional tooltip, allowing the
/// bottom bar to display a series of interactive buttons.
class DeluxeBottomBarItem {
  /// Creates a DeluxeBottomBarItem with an icon and optional tooltip.
  ///
  /// [icon] is required and defines the visual representation of the item.
  /// [tooltip] provides additional context about the item when hovered.
  const DeluxeBottomBarItem({
    required this.icon,
    this.tooltip,
  });

  /// The icon displayed for this item in the bottom bar.
  ///
  /// This icon visually represents the item, providing quick access to the
  /// function it performs when tapped.
  final IconData icon;

  /// An optional tooltip that describes the item's purpose.
  ///
  /// Displayed when the user hovers over the item, offering additional
  /// information about its function.
  final String? tooltip;
}
