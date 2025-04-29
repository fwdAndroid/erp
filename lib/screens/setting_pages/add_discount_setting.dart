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
  TextEditingController preController = TextEditingController();

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
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Percentage/Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorBlack),
                ),
              ),
              controller: preController,
            ),
          ),
          Spacer(),
          Padding(
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
                onPressed: () {
                  Navigator.pop(context);
                  showMessageBar("Discount is Added", context);
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
