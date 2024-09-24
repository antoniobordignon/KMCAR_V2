import 'package:flutter/material.dart';
import 'package:kmcar/common/constants/text_style.dart';

class AddButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Icon? icon;
  final double height;
  
  const AddButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.height = 48.0,
  });

  final BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(24.0));

// Botão padrão da interface para conseguir adicionar informações.
  @override
  Widget build(BuildContext context) {    
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon!.icon,
                    color: Colors.white,
                    size: icon!.size,
                  ),
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    text,
                    style: AppTextStyle.mediumText.copyWith(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}