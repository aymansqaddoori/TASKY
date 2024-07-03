import 'package:flutter/material.dart';

//normal text=====================================
class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextInputType inputType;
  final bool obscureText;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool? readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? enabled;
  final Color? fillColor;
  final BorderSide borderSide = const BorderSide();

  const CustomTextField({
    super.key,
    this.labelText,
    required this.inputType,
    required this.obscureText,
    this.hintText,
    this.contentPadding,
    this.maxLines,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
    this.validator,
    this.controller,
    this.enabled,
    this.fillColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? readOnly;
  bool? enabled;
  Color? fillColor;
  void Function()? onTap;
  String? Function(String?)? validator;
  TextEditingController? controller;
  @override
  void initState() {
    readOnly = widget.readOnly;
    onTap = widget.onTap;
    validator = widget.validator;
    controller = widget.controller;
    enabled = widget.enabled;
    fillColor = widget.fillColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled ?? true,
        readOnly: readOnly ?? false,
        enableInteractiveSelection: true,
        validator: validator,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        keyboardType: widget.inputType,
        obscureText: widget.obscureText,
        maxLines: widget.maxLines ?? 1,
        onTap: onTap,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: widget.contentPadding,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          hintText: widget.hintText ?? '',
          labelText: widget.labelText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

//drop down list======================

class DropdownMenuL extends StatefulWidget {
  final List<String>? list;
  final Widget? leadingIcon;
  final TextStyle? textStyle;
  final Color? suffixIconColor;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? initialSelection;
  final bool? enabled;
  const DropdownMenuL({
    super.key,
    this.list,
    this.leadingIcon,
    this.textStyle,
    this.suffixIconColor,
    this.controller,
    this.fillColor,
    this.initialSelection,
    this.enabled,
  });

  @override
  State<DropdownMenuL> createState() => _DropdownMenuLState();
}

class _DropdownMenuLState extends State<DropdownMenuL> {
  late List<String>? level;
  String? initialSelection;
  Color? fillColor;
  String? dropdownValue;
  Widget? leadingIcon;
  TextStyle? textStyle;
  Color? suffixIconColor;
  TextEditingController? controller;
  bool? enabled;
  @override
  void initState() {
    level = widget.list;
    leadingIcon = widget.leadingIcon;
    textStyle = widget.textStyle;
    suffixIconColor = widget.suffixIconColor;
    controller = widget.controller;
    fillColor = widget.fillColor;
    initialSelection = widget.initialSelection;
    enabled = widget.enabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      enabled: enabled ?? true,
      controller: controller,
      leadingIcon: leadingIcon,
      textStyle: textStyle,
      initialSelection: initialSelection ?? level!.first,
      inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: suffixIconColor,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none)),
      expandedInsets: const EdgeInsets.fromLTRB(15.0, 1.0, 15.0, 1.0),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries:
          level!.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
