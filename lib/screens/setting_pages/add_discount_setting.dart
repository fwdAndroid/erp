import 'package:erp/screens/main/main_dashboard.dart';
import 'package:erp/services/database.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/uitl/show_message_bar.dart';
import 'package:flutter/material.dart';

class AddDiscountSetting extends StatefulWidget {
  const AddDiscountSetting({super.key});

  @override
  State<AddDiscountSetting> createState() => _AddDiscountSettingState();
}

class _AddDiscountSettingState extends State<AddDiscountSetting> {
  TextEditingController discountController = TextEditingController();
  TextEditingController discountValueController = TextEditingController();
  String selectedType = 'Amount'; // Default selection
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Discount",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Discount Name",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Special Discount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: discountController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Discount Value",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "10",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: discountValueController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: Text(
              "Discount Type",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: DropdownButtonFormField<String>(
              value: selectedType,
              decoration: InputDecoration(labelText: 'Select Type'),
              items:
                  ['Amount', 'Percentage'].map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
            ),
          ),
          Spacer(),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width, 55),
                    ),
                    onPressed: () async {
                      if (discountController.text.isEmpty) {
                        showMessageBar("Discount Name is Required", context);
                      } else if (discountValueController.text.isEmpty) {
                        showMessageBar(
                          "Discount Percentage is Required",
                          context,
                        );
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        await Database().addDiscount(
                          discountName: discountController.text,
                          discountType: selectedType,
                          discoutValue: double.parse(
                            discountValueController.text,
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainDashboard(),
                          ),
                        );
                        showMessageBar("Discount is Added", context);
                      }
                    },
                    child: Text(
                      "Add Discount",
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
