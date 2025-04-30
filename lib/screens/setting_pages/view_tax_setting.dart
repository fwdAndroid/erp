import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/screens/setting_pages/add_tax_setting.dart';
import 'package:erp/uitl/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewTaxSetting extends StatefulWidget {
  const ViewTaxSetting({super.key});

  @override
  State<ViewTaxSetting> createState() => _ViewTaxSettingState();
}

class _ViewTaxSettingState extends State<ViewTaxSetting> {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tax Settings",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaxSetting()),
          );
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: colorWhite),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('goals')
                .where("uid", isEqualTo: currentUserId)
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
                  Icon(Icons.account_balance, size: 40, color: buttonColor),
                  Text("No Tax available"),
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
                child: Card(
                  child: ListTile(
                    title: Text(post['taxName']),
                    subtitle: Text(
                      "Tax Percentage: ${post['taxPercentage']} + %",
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('goals')
                            .doc(posts[index].id)
                            .delete();
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
