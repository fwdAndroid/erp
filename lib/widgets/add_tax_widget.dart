import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class AddTaxWidget extends StatefulWidget {
  const AddTaxWidget({super.key});

  @override
  State<AddTaxWidget> createState() => _AddTaxWidgetState();
}

class _AddTaxWidgetState extends State<AddTaxWidget> {
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
              "Add Tax",
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
          child: Text("Add Tax"),
        ),
      ],
    );
  }
}
