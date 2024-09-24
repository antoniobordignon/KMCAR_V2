import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmcar/common/constants/text_style.dart';

class InputText extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle; 
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const InputText({
    super.key, 
    this.padding, 
    this.labelText,
    this.controller,
    this.keyboardType, 
    this.maxLength, 
    this.textInputAction,
    this.suffixIcon, 
    this.obscureText,
    this.inputFormatters, 
    this.validator, 
    this.helperText, 
    this.hintStyle
  });

  @override
  State<InputText> createState() => _InputTextState();
  }

class _InputTextState extends State<InputText> {

  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.teal,
    ), 
  );

  String? _helperText;
  
  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }
  // Imput text.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? 
        const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        ),
      child: Column(
        children: [
          Row(
            children: [
              Text('${widget.labelText ?? ''} :'),
            ],
          ),
          TextFormField(
            onChanged: (value) {
              if(value.isEmpty) {
                setState((){
                 _helperText = widget.helperText;
                });
              } else if (value.length  == 1){
                setState(() {
                  _helperText = null;
                });
              }
            },
            validator: widget.validator,
            style: AppTextStyle.inputText.copyWith(color: Theme.of(context).colorScheme.primary),
            inputFormatters: widget.inputFormatters,
            obscureText: widget.obscureText ?? false,
            textInputAction: widget.textInputAction,       
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            decoration: InputDecoration(
              counterText: '',
              errorMaxLines: 6, 
              helperText: _helperText,
              helperMaxLines: 3,
              errorStyle: const TextStyle(color: Colors.red),
              suffixIcon: widget.suffixIcon,
              hintStyle: widget.hintStyle ?? TextStyle(color: Theme.of(context).colorScheme.outline),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: AppTextStyle.inputLabelText.copyWith(color: Colors.black),
              border: defaultBorder,
              focusedBorder: defaultBorder,
              errorBorder: defaultBorder.copyWith(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: defaultBorder.copyWith(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              enabledBorder: defaultBorder.copyWith(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              disabledBorder: defaultBorder,
            )
          ),
        ],
      ),
    );
  }
}