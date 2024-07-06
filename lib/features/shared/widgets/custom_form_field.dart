import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parent/core/constants/colors.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final Function(String?)? onSave;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isSecretValue;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final int lengthLimit;
  final bool enabled;

  const CustomFormField({
    required this.label,
    required this.validate,
    this.onSave,
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.name,
    this.isSecretValue = false,
    this.enabled = true,
    this.lengthLimit = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool obscure;

  switchObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  void initState() {
    super.initState();
    obscure = widget.isSecretValue;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: AppColors.primary),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: obscure,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).textTheme.button?.copyWith(
              color: AppColors.textPrimary,
            ),
        inputFormatters: widget.lengthLimit == 0
            ? null
            : [
                LengthLimitingTextInputFormatter(widget.lengthLimit),
              ],
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: widget.label,
          errorStyle: Theme.of(context).textTheme.caption!.copyWith(
                color: AppColors.fail,
              ),
          filled: true,
          fillColor: AppColors.fill,
          enabled: widget.enabled,
          labelStyle: const TextStyle(color: Colors.black),
          border: _noBorder,
          focusedBorder: _border,
          suffixIcon: widget.isSecretValue
              ? GestureDetector(
                  onTap: switchObscure,
                  child: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.lightGrey,
                  ),
                )
              : null,
        ),
        onChanged: widget.onChanged,
        validator: widget.validate,
        onSaved: widget.onSave,
      ),
    );
  }

  InputBorder get _border {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(
        width: 1.5,
        color: AppColors.primary,
      ),
    );
  }

  InputBorder get _noBorder {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none,
    );
  }
}
