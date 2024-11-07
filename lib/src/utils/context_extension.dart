part of '../widgets/deluxe_bottom_bar.dart';

/// Private extension on BuildContext to simplify width-based calculations.
///
/// This extension provides utility methods to get the width of the screen
/// or calculate a percentage of the screen width, which can be useful for
/// responsive UI layouts.
extension _ContextExtension on BuildContext {
  /// Retrieves the size of the current screen using MediaQuery.
  ///
  /// This size includes both the screen's width and height, allowing
  /// further customization for responsive layouts.
  Size get _size => MediaQuery.sizeOf(this);

  /// The width of the screen in logical pixels.
  ///
  /// This getter provides direct access to the screen width, which can
  /// be used in custom calculations or layouts.
  double get widthSize => _size.width;

  /// Calculates a percentage of the screen width based on a given factor.
  ///
  /// [value] should be a double between 0.0 and 1.0, where 1.0 represents
  /// 100% of the screen width. This method is useful for responsive
  /// width-based layouts.
  double width(double value) {
    return widthSize * value;
  }
}
