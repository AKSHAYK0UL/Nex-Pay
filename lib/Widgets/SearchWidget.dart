import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Search_controller = TextEditingController();

  SearchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .075,
          width: MediaQuery.of(context).size.width * 0.80,
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: TextField(
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Pay to merchants and more',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              hintStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            controller: Search_controller,
            onSubmitted: (value) => print(Search_controller.text),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          height: MediaQuery.of(context).size.height * 0.070,
          width: MediaQuery.of(context).size.width * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
