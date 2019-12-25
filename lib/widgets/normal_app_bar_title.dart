import 'package:flutter/widgets.dart';
import 'package:flutter_travel/configs/app_config.dart';

class NormalAppBarTitle extends StatelessWidget {
  final Color color;
  final String title;

  NormalAppBarTitle({@required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == null ? primaryColor : color,
        fontSize: 16,
      ),
    );
  }
}
