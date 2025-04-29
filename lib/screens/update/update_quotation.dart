import 'package:erp/screens/main/main_dashboard.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class UpdateQuotation extends StatefulWidget {
  const UpdateQuotation({super.key});

  @override
  State<UpdateQuotation> createState() => _UpdateQuotationState();
}

class _UpdateQuotationState extends State<UpdateQuotation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bussinessController = TextEditingController();

  TextEditingController taxCategoryController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ipdate Quotation',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "View Quotation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorBlack,
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormInputFeildWidget(
              controller: nameController,
              hintText: "Quotation Name",
              textInputType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextFormInputFeildWidget(
              controller: emailController,
              hintText: "1000\$",
              textInputType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: SizedBox(
              height: 100,
              child: TextFormInputFeildWidget(
                maxlines: 5,
                controller: bussinessController,
                hintText: "Software House",
                textInputType: TextInputType.text,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: TextFormInputFeildWidget(
              controller: taxCategoryController,
              hintText: "12/12/21",
              textInputType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: TextFormInputFeildWidget(
              controller: taxCategoryController,
              hintText: "22/21/12",
              textInputType: TextInputType.text,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                    MaterialPageRoute(builder: (builder) => MainDashboard()),
                  );
                },
                child: Text(
                  "Updated",
                  style: TextStyle(fontSize: 18, color: colorWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
