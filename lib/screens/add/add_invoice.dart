import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/screens/conformation_screen/conformation_invoice_screen.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/uitl/show_message_bar.dart';
import 'package:erp/widgets/add_item_invoice_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

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

  bool isLoading = false;

  double calculateSubtotal() {
    final discount = double.tryParse(itemSummary?['discount'] ?? '0') ?? 0;
    final tax = double.tryParse(itemSummary?['tax'] ?? '0') ?? 0;
    final total = double.tryParse(itemSummary?['total'] ?? '0') ?? 0;
    return total + discount - tax;
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

            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                        //I want t0 See Sub Total Here

                        //Below this I want to see the discount and tax
                        // Quanity Value * price = Answer
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        itemSummary != null
                            ? _summaryRow(
                              "${itemSummary!['quantity'] ?? '0'} x Rs. ${itemSummary!['unitPrice'] ?? '0'}",
                              "Rs. ${(int.tryParse(itemSummary!['quantity'] ?? '0')! * double.tryParse(itemSummary!['unitPrice'] ?? '0')!).toStringAsFixed(2)}",
                            )
                            : Text("RS 0.00 * 10"),
                  ),
                  Divider(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(color: colorBlack, fontSize: 12),
                        ),
                        const SizedBox(width: 10),
                        itemSummary != null
                            ? Text(
                              "Rs. ${calculateSubtotal().toStringAsFixed(2)}",
                              style: TextStyle(color: colorBlack, fontSize: 12),
                            )
                            : Text(
                              " 0 X Rs. 0.00",
                              style: TextStyle(color: colorBlack, fontSize: 12),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            buildInvoiceSummary(),
            TextButton(
              onPressed: () {},
              child: Text(
                "Add Attachment",
                style: TextStyle(color: buttonColor, fontSize: 17),
              ),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Text("Payment Information"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "About Payment Method",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Payment Status"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Select Payment Status",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Terms & Conditions"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Terms & Conditions",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Payment Status"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Select Payment Status",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Default Message"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Default Message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Payment Status"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Select Payment Status",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await saveInvoiceToFirestore();
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (builder) => const InvoiceConformationScreen(),
                        ),
                      );
                      showMessageBar("Invoice Created", context);
                      ;
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
                _summaryRow(" Total", "Rs. ${total.toStringAsFixed(2)}"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Future<void> saveInvoiceToFirestore() async {
    var uuid = Uuid().v4();
    if (itemSummary == null || emailController.text.isEmpty) return;

    final quantity = itemSummary!['quantity'] ?? '0';
    final unitPrice = itemSummary!['unitPrice'] ?? '0';
    final discount = itemSummary!['discount'] ?? '0';
    final tax = itemSummary!['tax'] ?? '0';
    final total = itemSummary!['total'] ?? '0';

    final subtotal = calculateSubtotal();

    final invoiceData = {
      "uuid": uuid,
      "uid": FirebaseAuth.instance.currentUser!.uid,
      'customerName': emailController.text,
      'timestamp': FieldValue.serverTimestamp(),
      'item': {
        'quantity': quantity,
        'unitPrice': unitPrice,
        'discount': discount,
        'tax': tax,
        'total': total,
      },
      'subtotal': subtotal.toStringAsFixed(2),
      'discount': discount,
      'tax': tax,
      'finalTotal': total,
    };

    await FirebaseFirestore.instance
        .collection('invoices')
        .doc(uuid)
        .set(invoiceData);
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
