import 'package:erp/screens/view/view_expense.dart';
import 'package:flutter/material.dart';

class ExpenseTileWidget extends StatelessWidget {
  final String subTitle;
  final String onTap;
  final String title; // Optional onChanged callback

  const ExpenseTileWidget({
    Key? key,
    required this.subTitle,

    required this.onTap,

    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => ViewExpense()),
          );
        },
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
        trailing: Text(
          onTap,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
