import 'package:flutter/material.dart';

import '../services/theme_services.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.text,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  final String text;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: titleStyle),
          Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ThemeManager.deepBlue,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: ThemeManager.gryVu,
                        readOnly: widget != null ? true : false,
                        style: subtitleStyle,
                        controller: controller,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: subtitleStyle,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    widget ?? Container(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
