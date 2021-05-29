import 'package:flutter/cupertino.dart';
import 'package:task/presentation/colors_value.dart';

class LineWidget extends StatelessWidget
{
  final Color startColor;
  final Color endColor;

  const LineWidget({ this.startColor=ColorsValue.line100, this.endColor=ColorsValue.line0}) ;
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [startColor, endColor])));
  }

}