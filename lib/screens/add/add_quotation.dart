import 'package:erp/screens/conformation_screen/quotation_conformation_screen.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class AddQuotation extends StatefulWidget {
  const AddQuotation({super.key});

  @override
  State<AddQuotation> createState() => _AddQuotationState();
}

class _AddQuotationState extends State<AddQuotation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Quotation',
          style: TextStyle(fontWeight: FontWeight.bold, color: colorBlack),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Quotation",
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
                hintText: "Name",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: TextFormInputFeildWidget(
                controller: priceController,
                hintText: "Price",
                textInputType: TextInputType.text,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Container(
                height: 100,
                child: TextFormInputFeildWidget(
                  controller: descriptionController,
                  hintText: "Description",
                  textInputType: TextInputType.text,
                  maxlines: 5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: TextFormInputFeildWidget(
                controller: startDateController,
                hintText: "Start Date",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: TextFormInputFeildWidget(
                controller: endDateController,
                hintText: "End Date",
                textInputType: TextInputType.text,
              ),
            ),

            TextButton(
              onPressed: () {
                // Handle save action
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AddItemWidget();
                //   },
                // );
              },
              child: Text(
                'Share Via',
                style: TextStyle(color: buttonColor, fontSize: 18),
              ),
            ),

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
                      MaterialPageRoute(
                        builder: (builder) => QuotationConformationScreen(),
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
