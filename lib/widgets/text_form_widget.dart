import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/view_models/auth_view_model.dart';
import '../resources/constants/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);

  final String hintText;
  TextEditingController textEditingController;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText:
          widget.hintText == "Password" || widget.hintText == "Confirm Password"
              ? isObsecure
              : false,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: primaryColor),
        suffixIcon: widget.hintText == "Password"
            ? IconButton(
                onPressed: () {
                  setState(() {
                    if (isObsecure == true) {
                      isObsecure = false;
                    } else {
                      isObsecure = true;
                    }
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: isObsecure == false ? primaryColor : Colors.grey,
                ),
              )
            : null,
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 1.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
