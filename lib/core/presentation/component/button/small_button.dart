import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/constants/component_constant.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  static const double defaultWidth = 174;
  static const double height = 37;
  static const int textMaxLines = 1;
  static const Key gestureKey = Key('small button gesture');
  static const Key buttonContainerKey = Key('small button container');

  final String text;
  final VoidCallback onClick;
  final double? width;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
    this.width,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: SmallButton.gestureKey,
      onTap: widget.onClick,
      onTapDown: (details) {
        setState(() {
          isEnabled = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isEnabled = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isEnabled = true;
        });
      },
      child: Container(
        key: SmallButton.buttonContainerKey,
        width: widget.width ?? SmallButton.defaultWidth,
        height: SmallButton.height,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(ComponentConstant.borderRadius),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyles.smallerTextBold.copyWith(
              color: AppColors.white,
            ),
            maxLines: SmallButton.textMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
