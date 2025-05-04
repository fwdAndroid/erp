import 'package:erp/screens/add/add_invoice.dart';
import 'package:erp/screens/invoice_tab/invoice_activity.dart';
import 'package:erp/screens/view/view_invoice.dart';
import 'package:flutter/material.dart';

class InvoiceDashboard extends StatefulWidget {
  const InvoiceDashboard({super.key});

  @override
  State<InvoiceDashboard> createState() => _InvoiceDashboardState();
}

class _InvoiceDashboardState extends State<InvoiceDashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.edit), text: "Edit"),
              Tab(icon: Icon(Icons.view_agenda), text: "View"),
              Tab(icon: Icon(Icons.attractions), text: "Action"),
            ],
          ),

          automaticallyImplyLeading: false,
          actions: [Image.asset("assets/notification.png")],
          title: const Text(
            "Invoice Dashboard",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [AddInvoice(), ViewInvoice(), InvoiceActivity()],
        ),
        // ListView.builder(
        //   itemBuilder: (context, index) {
        //     return ListTileWidget(
        //       title: "Title: Fawad Kaleem",
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (builder) => ViewInvoice()),
        //         );
        //       },
        //       subTitle: "Created At: 21 December 2023",
        //     );
        //   },
        // ),
      ),
    );
  }
}
