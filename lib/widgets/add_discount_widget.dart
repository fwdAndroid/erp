import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class AddDiscountWidget extends StatefulWidget {
  const AddDiscountWidget({super.key});

  @override
  State<AddDiscountWidget> createState() => _AddDiscountWidgetState();
}

class _AddDiscountWidgetState extends State<AddDiscountWidget> {
  TextEditingController discountController = TextEditingController();
  TextEditingController discountValueController = TextEditingController();
  TextEditingController preController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Add Discount",
              style: TextStyle(
                fontSize: 22,
                color: colorBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: ListBody(
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
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Close"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Add Discount"),
        ),
      ],
    );
  }
}
