import 'package:flutter/material.dart';
import 'package:to_do/widgets/color.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double roundness;
  final double? width;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final Widget? trailingWidget;
  final Function? onPressed;
  final Color? backgroundColor;
  final Color? textcolor;

  const AppButton(
      {super.key,
      required this.label,
      this.roundness = 10.0,
      this.fontWeight = FontWeight.bold,
      this.padding = const EdgeInsets.symmetric(vertical: 24),
      this.trailingWidget,
      this.onPressed,
      this.width,
      this.backgroundColor,
      this.textcolor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          onPressed?.call();
        },
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundness),
          ),
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          textStyle: TextStyle(
            color: textcolor ?? Colors.white,
            fontWeight: fontWeight,
          ),
          padding: padding,
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: fontWeight,
                  color: textcolor ?? Colors.white,
                ),
              ),
            ),
            if (trailingWidget != null)
              Positioned(
                top: 0,
                right: 25,
                child: trailingWidget!,
              ),
          ],
        ),
      ),
    );
  }
}
