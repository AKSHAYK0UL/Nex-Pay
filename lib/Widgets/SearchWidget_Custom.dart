import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchWidget_Custom extends StatelessWidget {
  // final _controllerText = TextEditingController();
  IconData icon;
  final hinttext;
  Function Onclick;
  final keyboardInputFormat;
  SearchWidget_Custom({
    super.key,
    required this.icon,
    required this.hinttext,
    required this.Onclick,
    required this.keyboardInputFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .075,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        // controller: _controllerText,
        // onSubmitted: (value) => Onclick(value),
        onChanged: (value) => Onclick(value),

        keyboardType: keyboardInputFormat == 'Letters'
            ? TextInputType.name
            : TextInputType.number,
      ),
    );
  }
}
