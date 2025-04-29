import 'package:erp/screens/conformation_screen/conformation_invoice_screen.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/add_item_invoice_widget.dart';
import 'package:erp/widgets/add_tax_widget.dart';
import 'package:erp/widgets/other_charges_widget.dart';
import 'package:flutter/material.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({super.key});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  TextEditingController emailController = TextEditingController();
  TextEditingController preController = TextEditingController();
  TextEditingController termController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Creating Invoice',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  "Invoice",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorBlack,
                    fontSize: 19,
                  ),
                ),
                subtitle: Column(
                  children: [
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Invoice No:  ",
                          style: TextStyle(color: colorBlack),
                        ),
                        Text("123456789", style: TextStyle(color: colorBlack)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Invoice Date:  ",
                          style: TextStyle(color: colorBlack),
                        ),
                        Text("12/12/1", style: TextStyle(color: colorBlack)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Text(
                "Client Name or Email",
                style: TextStyle(color: colorBlack, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Client Name or Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: colorBlack),
                  ),
                ),
                controller: emailController,
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddItemInvoiceWidget();
                  },
                );
              },
              child: Text(
                "Add Item",
                style: TextStyle(color: buttonColor, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SubTotal",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "PKR 1000",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return OtherChargesWidget();
                  },
                );
              },
              child: Text(
                "Other Charges (Discount, Shipping, Other Amount)",
                style: TextStyle(color: buttonColor, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Shipping Charges",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "1000",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total (Exculding Tax)",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "1000",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddTaxWidget();
                  },
                );
              },
              child: Text("Add Tax", style: TextStyle(color: buttonColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total Inclusive Tax",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "50",
                      style: TextStyle(color: colorBlack, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: colorBlack, height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text("Notes"),
                children: [
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text("Terms & Condition"),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextFormField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Terms & Condition",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: colorBlack),
                        ),
                      ),
                      controller: termController,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: colorBlack, height: 1),
            TextButton(
              onPressed: () {},
              child: Text(
                "Add Attachment [upload files]",
                style: TextStyle(color: buttonColor, fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Payment Details",
                style: TextStyle(color: buttonColor, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Auto Fetch From Setting",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: colorBlack),
                  ),
                ),
                controller: termController,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => InvoiceConformationScreen(),
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
      ),
    );
  }
}
