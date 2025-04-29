import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String subTitle;
  final VoidCallback? onTap;
  final String title; // Optional onChanged callback

  const ListTileWidget({
    Key? key,
    required this.subTitle,

    this.onTap,

    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(fontSize: 14, color: Color(0xffA3A8AC)),
        ),
        trailing: TextButton(
          onPressed: onTap,
          child: Text("View", style: TextStyle(color: buttonColor)),
        ),
      ),
    );
  }
}
