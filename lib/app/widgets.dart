import 'package:flutter/material.dart';
import 'theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.width,
    this.height = 50.0,
    this.color,
    this.textColor,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final double? width;
  final double height;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppTheme.primary,
          foregroundColor: textColor ?? Colors.white,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 18.0),
                  SizedBox(width: 8.0),
                  Text(
                    text,
                    style: AppTheme.titleMedium.copyWith(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: AppTheme.titleMedium.copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.buttonSize = 40.0,
    this.iconSize = 24.0,
    this.iconColor,
    this.backgroundColor,
    this.borderRadius = 30.0,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onPressed;
  final double buttonSize;
  final double iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: iconColor,
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

