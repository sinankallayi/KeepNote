// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../components.dart';
import '../constants.dart';

class Read_Entries_Details_Screen extends StatefulWidget {
  final String title;
  final String entry;
  final String date;
  const Read_Entries_Details_Screen(
      {super.key,
      required this.title,
      required this.entry,
      required this.date});

  @override
  State<Read_Entries_Details_Screen> createState() =>
      _Read_Entries_Details_ScreenState();
}

class _Read_Entries_Details_ScreenState
    extends State<Read_Entries_Details_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Keep_Title(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 2.5,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '  ${widget.date.substring(5, 17).trim()}\n ${widget.date.substring(0, 5).trim()} ${widget.date.substring(17).trim()}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.title,
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                print("Title Edit");
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 255, 255, 255),
                          thickness: 5,
                          endIndent: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.entry,
                                softWrap: true,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            print("Entry Edit");
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              KeepButton(
                label: "BACK",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
