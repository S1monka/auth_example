import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final String? title;
  final Widget? customTitle;
  final Function() onTap;
  final Color? primaryColor;
  final EdgeInsets? margin;
  final double? height;
  final Color? borderColor;
  final double? width;
  const CustomRoundButton({
    Key? key,
    this.title,
    this.margin,
    this.height,
    required this.onTap,
    this.customTitle,
    this.borderColor,
    this.width,
    this.primaryColor,
  })  : assert((customTitle == null && title != null) ||
            (customTitle != null && title == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width ?? double.maxFinite,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
          textStyle: Theme.of(context).textTheme.bodyText1,
          shape: const StadiumBorder(),
          padding: EdgeInsets.zero,
        ),
        onPressed: onTap,
        child: customTitle ??
            Text(
              title!,
            ),
      ),
    );
  }
}
