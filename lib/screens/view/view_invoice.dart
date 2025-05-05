import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/listTile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewInvoice extends StatefulWidget {
  const ViewInvoice({super.key});

  @override
  State<ViewInvoice> createState() => _ViewInvoiceState();
}

class _ViewInvoiceState extends State<ViewInvoice> {
  TextEditingController emailController = TextEditingController();
  TextEditingController preController = TextEditingController();
  TextEditingController termController = TextEditingController();

  // Function to format Firestore Timestamp into readable date
  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }

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
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('invoices')
                .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory, size: 40, color: buttonColor),
                  const Text("No Invoice available"),
                ],
              ),
            );
          }

          var posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTileWidget(
                  title: "Customer Name:  ${post['customerName']}" ?? "No Name",
                  subTitle:
                      post['timestamp'] != null
                          ? formatTimestamp(post['timestamp'])
                          : "No Date",
                  onTap: () {
                    // Navigate to detailed invoice view if needed
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
