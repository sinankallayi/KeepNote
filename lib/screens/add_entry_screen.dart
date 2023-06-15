// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keep_note/components.dart';
import 'package:keep_note/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class Add_Entry_Screen extends StatefulWidget {
  const Add_Entry_Screen({super.key});

  @override
  State<Add_Entry_Screen> createState() => _Add_Entry_ScreenState();
}

class _Add_Entry_ScreenState extends State<Add_Entry_Screen> {
  var isLoading = false;
  TextEditingController titleControl = TextEditingController();
  TextEditingController entryControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Keep_Title(),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: w * 0.88,
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                decoration: kTextField,
                child: Center(
                  child: TextFormField(
                    controller: titleControl,
                    cursorColor: Colors.white,
                    maxLength: 40,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  width: w * 0.88,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        15,
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    reverse: entryControl.text.length > 20 ? true : false,
                    child: Center(
                      child: TextFormField(
                        controller: entryControl,
                        cursorColor: Colors.white,
                        maxLines: 20,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Create Entry',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              KeepButton(
                label: "SAVE",
                isLoading: isLoading,
                onTap: isLoading
                    ? null
                    : () async {
                        if (titleControl.text.trim().isEmpty ||
                            entryControl.text.trim().isEmpty) {
                          addEntryAlert(context);
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          await FirebaseFirestore.instance
                              .collection('Entries')
                              .add({
                                'Title': titleControl.text,
                                'Entry': entryControl.text,
                                'Date': DateFormat.yMMMEd()
                                    .add_jm()
                                    .format(DateTime.now()),
                              })
                              .then(
                                (value) => addEntryAlert(context),
                              )
                              .whenComplete(() {
                                setState(() {
                                  isLoading = false;
                                });
                              });

                          //.catchError(
                          //(error) => print("Entry not added due ro $error"));
                          titleControl.clear();
                          entryControl.clear();
                          // ignore: use_build_context_synchronously
                          //Navigator.pop(context);
                        }
                      },
              ),
              const SizedBox(
                height: 10,
              ),
              KeepButton(
                label: "Back",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addEntryAlert(BuildContext ctx) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (titleControl.text.isEmpty || entryControl.text.isEmpty) {
      const addAlertErrorMessage = 'Please enter Title and Entry';
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
          content: Text(addAlertErrorMessage),
        ),
      );
    } else {
      const addAlertSuccessMessage = 'Entry added Successfully';

      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
          content: Text(addAlertSuccessMessage),
        ),
      );
    }
  }

  @override
  void dispose() {
    titleControl.dispose();
    entryControl.dispose();
    super.dispose();
  }
}
