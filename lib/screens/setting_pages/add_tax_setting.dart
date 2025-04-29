import 'package:erp/uitl/colors.dart';
import 'package:erp/uitl/show_message_bar.dart';
import 'package:flutter/material.dart';

class AddTaxSetting extends StatefulWidget {
  const AddTaxSetting({super.key});

  @override
  State<AddTaxSetting> createState() => _AddTaxSettingState();
}

class _AddTaxSettingState extends State<AddTaxSetting> {
  TextEditingController discountController = TextEditingController();
  TextEditingController discountValueController = TextEditingController();
  TextEditingController preController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Tax",
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
              "Tax Name",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "VAT",
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
              "Tax Percentage %",
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
              "Description (optional)",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Description (optional)",
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
                  showMessageBar("Tax is Added", context);
                },
                child: Text(
                  "Add Tax",
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
