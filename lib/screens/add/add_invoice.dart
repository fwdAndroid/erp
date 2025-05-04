import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/screens/conformation_screen/conformation_invoice_screen.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/add_item_invoice_widget.dart';
import 'package:flutter/material.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({super.key});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  TextEditingController emailController = TextEditingController();
  List<Map<String, dynamic>> customers = [];

  Map<String, String>? itemSummary;

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('customer').get();
    final List<Map<String, dynamic>> customerList =
        snapshot.docs.map((doc) {
          return {
            'customerName': doc['customerName'],
            'customerEmail': doc['customerEmail'],
          };
        }).toList();

    setState(() {
      customers = customerList;
    });
  }

  void showCustomerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Customer"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return ListTile(
                  title: Text("Name ${customer['customerName']}"),
                  subtitle: Text("Email ${customer['customerEmail']}"),
                  onTap: () {
                    emailController.text = customer['customerName'];
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void openAddItemDialog() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => AddItemInvoiceWidget(),
    );

    if (result != null) {
      setState(() {
        itemSummary = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Client Name or Email",
              style: TextStyle(color: colorBlack, fontSize: 12),
            ),
            TextFormField(
              controller: emailController,
              readOnly: true,
              onTap: showCustomerDialog,
              decoration: InputDecoration(
                hintText: "Select Client",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.arrow_drop_down),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: openAddItemDialog,
                  child: Text(
                    "Add Item",
                    style: TextStyle(color: buttonColor, fontSize: 17),
                  ),
                ),
                Text(
                  "Rs: ${itemSummary != null ? itemSummary!['total'] ?? '0.00' : '0.00'}",
                  style: TextStyle(color: buttonColor, fontSize: 17),
                ),
              ],
            ),

            const SizedBox(height: 10),

            buildInvoiceSummary(),

            SizedBox(
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
                      builder: (builder) => const InvoiceConformationScreen(),
                    ),
                  );
                },
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: colorWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInvoiceSummary() {
    final quantity = itemSummary?['quantity'] ?? '0';
    final unitPrice = itemSummary?['unitPrice'] ?? '0';
    final discountStr = itemSummary?['discount'] ?? '0';
    final taxStr = itemSummary?['tax'] ?? '0';
    final totalStr = itemSummary?['total'] ?? '0';

    final discount = double.tryParse(discountStr) ?? 0;
    final tax = double.tryParse(taxStr) ?? 0;
    final total = double.tryParse(totalStr) ?? 0;

    final subtotal = total + discount - tax;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        _summaryRow("Quantity", quantity),
        _summaryRow("Price", unitPrice),
        _summaryRow("Discount", "- Rs. ${discount.toStringAsFixed(2)}"),
        _summaryRow("Tax", " VAT. ${tax.toStringAsFixed(2)}"),
        _summaryRow("Total", "Rs. ${total.toStringAsFixed(2)}"),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _summaryRow("Subtotal", "Rs. ${subtotal.toStringAsFixed(2)}"),
                _summaryRow("Discount", "- Rs. ${discount.toStringAsFixed(2)}"),
                _summaryRow("Tax", "+ VAT Rs. ${tax.toStringAsFixed(2)}"),
                const Divider(),
                _summaryRow("Grand Total", "Rs. ${total.toStringAsFixed(2)}"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

Widget _summaryRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14)),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
