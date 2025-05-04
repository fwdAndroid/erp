import 'package:flutter/material.dart';
import 'package:erp/uitl/colors.dart';

class AddItemInvoiceWidget extends StatefulWidget {
  const AddItemInvoiceWidget({super.key});

  @override
  State<AddItemInvoiceWidget> createState() => _AddItemInvoiceWidgetState();
}

class _AddItemInvoiceWidgetState extends State<AddItemInvoiceWidget> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController unitpriceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();

  String discountType = 'Percentage';
  String taxType = 'VAT 10%';

  double amount = 0.0;
  double discount = 0.0;
  double tax = 0.0;
  double total = 0.0;

  void calculateValues() {
    final quantity = double.tryParse(quantityController.text) ?? 0;
    final unitPrice = double.tryParse(unitpriceController.text) ?? 0;
    final discountInput = double.tryParse(discountValueController.text) ?? 0;

    amount = quantity * unitPrice;

    if (discountType == 'Percentage') {
      discount = amount * (discountInput / 100);
    } else {
      discount = discountInput;
    }

    double taxableAmount = amount - discount;

    if (taxType == 'VAT 5%') {
      tax = taxableAmount * 0.05;
    } else if (taxType == 'VAT 10%') {
      tax = taxableAmount * 0.10;
    } else {
      tax = 0;
    }

    total = taxableAmount + tax;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    quantityController.addListener(calculateValues);
    unitpriceController.addListener(calculateValues);
    discountValueController.addListener(calculateValues);
  }

  @override
  void dispose() {
    quantityController.dispose();
    unitController.dispose();
    unitpriceController.dispose();
    discountValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Description",
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _inputField(
                    "Quantity",
                    controller: quantityController,
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: _inputField("Price", controller: unitpriceController),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: _inputField("Unit", controller: unitController),
                ),
              ],
            ),
            SizedBox(height: 12),
            _labelWithValue("Amount", "Rs. ${amount.toStringAsFixed(2)}"),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: discountType,
                    items:
                        ['Percentage', 'Fixed']
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (val) {
                      setState(() {
                        discountType = val!;
                        calculateValues();
                      });
                    },
                    decoration: InputDecoration(labelText: "Discount Type"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _inputField(
                    "Discount Value",
                    suffixText: discountType == 'Percentage' ? "%" : "Rs",
                    controller: discountValueController,
                  ),
                ),
              ],
            ),
            _labelWithValue("Discount", "- Rs. ${discount.toStringAsFixed(2)}"),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: taxType,
              items:
                  ['VAT 5%', 'VAT 10%', 'None']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: (val) {
                setState(() {
                  taxType = val!;
                  calculateValues();
                });
              },
              decoration: InputDecoration(labelText: "Tax"),
            ),
            _labelWithValue("Tax", "+ Rs. ${tax.toStringAsFixed(2)}"),
            SizedBox(height: 12),
            _labelWithValue("Total", "Rs. ${total.toStringAsFixed(2)}"),
            SizedBox(height: 12),
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Notes (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Save to Items List"),
                Switch(value: false, onChanged: (val) {}),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text("Save"),
                  onPressed: () {
                    final result = {
                      'quantity': quantityController.text,
                      'unitPrice': unitpriceController.text,
                      'discount': discount.toStringAsFixed(2),
                      'total': total.toStringAsFixed(2),
                      'tax': tax.toStringAsFixed(2),
                    };
                    Navigator.pop(context, result); // Pass the result back
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _inputField(
  String label, {
  String? suffixText,
  TextEditingController? controller,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    decoration: InputDecoration(
      labelText: label,
      suffixText: suffixText,
      border: OutlineInputBorder(),
    ),
  );
}

Widget _labelWithValue(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(fontSize: 16)),
      Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  );
}
