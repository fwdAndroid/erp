import 'package:erp/screens/add/add_invoice.dart';
import 'package:erp/screens/view/view_invoice.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/listTile_widget.dart';
import 'package:flutter/material.dart';

class InvoiceDashboard extends StatefulWidget {
  const InvoiceDashboard({super.key});

  @override
  State<InvoiceDashboard> createState() => _InvoiceDashboardState();
}

class _InvoiceDashboardState extends State<InvoiceDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddInvoice()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Image.asset("assets/notification.png")],
        title: const Text(
          "Invoice Dashboard",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTileWidget(
            title: "Title: Fawad Kaleem",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => ViewInvoice()),
              );
            },
            subTitle: "Created At: 21 December 2023",
          );
        },
      ),
    );
  }
}
