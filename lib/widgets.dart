library bloom.widgets;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// FIXME:
import 'package:flutter/material.dart' show Colors, Icons, MaterialPageRoute;
import 'package:provider/provider.dart';

part 'widgets/bloom_theme.dart';
part 'widgets/bloom_icon_button.dart';

part 'widgets/bloom_app.dart';
part 'widgets/bloom_scaffold.dart';

part 'widgets/bloom_appbar.dart';
part 'widgets/bloom_right_window_controls.dart';

// Elevation settings.
enum BloomElevation {
  none,
  border,
  shadow
}

void _noOp() {}

// Internal extensions.

extension _WidgetE on Widget {
  Widget border(
      {Key key,
      bool top = false,
      bool bottom = false,
      bool left = false,
      bool right = false,
      double width = 1.0,
      Color color}) {
    return Builder(
        key: key,
        builder: (context) {
          final theme = BloomTheme.of(context);

          final border =
              BorderSide(color: color ?? theme.dividerColor, width: width ?? 1);

          return DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                  border: Border(
                      top: top ? border : BorderSide.none,
                      bottom: bottom ? border : BorderSide.none,
                      left: left ? border : BorderSide.none,
                      right: right ? border : BorderSide.none)),
              child: this);
        });
  }

  Widget center() {
    return Center(child: this);
  }

  Widget align(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  Widget padding(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }
}