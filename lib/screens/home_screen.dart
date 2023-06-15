// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:keep_note/components.dart';
import 'package:keep_note/constants.dart';
import 'package:keep_note/screens/add_entry_screen.dart';
import 'package:keep_note/screens/read_entries_screen.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: h,
            width: w,
            decoration: kScreenBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('images/notes.png'),
                  width: w * 0.31,
                  height: h * 0.23,
                ),
                const SizedBox(),
                const Keep_Title(),
                SizedBox(
                  height: h * 0.35,
                ),
                KeepButton(
                  label: 'Read Entries',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Read_Entries_Screen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                KeepButton(
                  label: 'Add Entry',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Add_Entry_Screen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
