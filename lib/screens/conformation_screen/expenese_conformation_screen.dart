import 'package:erp/screens/main/main_dashboard.dart';
import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class ExpenseConformationScreen extends StatefulWidget {
  const ExpenseConformationScreen({super.key});

  @override
  State<ExpenseConformationScreen> createState() =>
      _ExpenseConformationScreenState();
}

class _ExpenseConformationScreenState extends State<ExpenseConformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        title: Text(
          'Conformation',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'Expense Added',
              style: TextStyle(fontSize: 32, color: buttonColor),
            ),
          ),
          Center(
            child: Text(
              'You added the expense successfully',
              style: TextStyle(fontSize: 18, color: hintColor),
            ),
          ),
          Image.asset('assets/success.png', height: 400, width: 200),
          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => MainDashboard()),
                  );
                },
                child: Text(
                  "Finished",
                  style: TextStyle(fontSize: 18, color: colorWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
