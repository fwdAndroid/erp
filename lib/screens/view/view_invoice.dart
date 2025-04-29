import 'package:erp/screens/update/update_invoice.dart';
import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class ViewInvoice extends StatefulWidget {
  const ViewInvoice({super.key});

  @override
  State<ViewInvoice> createState() => _ViewInvoiceState();
}

class _ViewInvoiceState extends State<ViewInvoice> {
  TextEditingController emailController = TextEditingController();
  TextEditingController preController = TextEditingController();
  TextEditingController termController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Invoice',
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
                  "View Invoice",
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
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Fawad Kaleem",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: colorBlack),
                  ),
                ),
                controller: emailController,
              ),
            ),
            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "View Item",
                style: TextStyle(color: buttonColor, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Quantity: 23"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Unit Price: \$"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Item Total: 234"),
            ),
            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Discount",
                style: TextStyle(color: buttonColor, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Discount Name: Every"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Discount Value: 10"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Discount Type: %"),
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
            Divider(),

            Text(
              "Other Charges (Discount, Shipping, Other Amount)",
              style: TextStyle(color: buttonColor, fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Discount %: 56"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Shipping Charges: 32"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Other Charges:10"),
            ),
            Divider(),
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
              child: Text(
                "View Tax Details",
                style: TextStyle(color: colorBlack, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Tax Name: GTS"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text("Tax Percentage: 34%"),
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
                      readOnly: true,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "fsaafffs",
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
                      readOnly: true,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "sdffdsfdssfd",
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
                      MaterialPageRoute(builder: (builder) => UpdateInvoice()),
                    );
                  },
                  child: Text(
                    "Update",
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
