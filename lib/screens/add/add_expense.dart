import 'package:erp/screens/conformation_screen/expenese_conformation_screen.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Expense',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "NAME",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Fawad Kaleem",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: nameController,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Category Name",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Vendor",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: categoryController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Amount",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "\$ 69.00",
                suffixIcon: TextButton(
                  onPressed: () {
                    emailController.clear();
                  },
                  child: Text("Clear", style: TextStyle(color: buttonColor)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Date",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    dateController.clear();
                  },
                  icon: Icon(Icons.date_range, color: buttonColor),
                ),
                hintText: "Tue, 22 Feb 2022",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: dateController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Invoice",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (builder) => InvoiceConformationScreen(),
                  //   ),
                  // );
                },
                child: Text(
                  "Add Invoice",
                  style: TextStyle(fontSize: 18, color: colorWhite),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8),
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
                    MaterialPageRoute(
                      builder: (builder) => ExpenseConformationScreen(),
                    ),
                  );
                },
                child: Text(
                  "Continue",
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
