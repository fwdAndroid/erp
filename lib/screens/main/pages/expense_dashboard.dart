import 'package:erp/screens/add/add_expense.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/expense_tile_widget.dart';
import 'package:flutter/material.dart';

class ExpenseDashboard extends StatefulWidget {
  const ExpenseDashboard({super.key});

  @override
  State<ExpenseDashboard> createState() => _ExpenseDashboardState();
}

class _ExpenseDashboardState extends State<ExpenseDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpense()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Image.asset("assets/notification.png")],
        title: const Text(
          "Expense Dashboard",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpenseTileWidget(
            title: "Upwork",
            onTap: "+83443",
            subTitle: "Created At: 21 December 2023",
          );
        },
      ),
    );
  }
}
