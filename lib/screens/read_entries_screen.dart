// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keep_note/components.dart';
import 'package:keep_note/constants.dart';

import 'add_entry_screen.dart';

class Read_Entries_Screen extends StatefulWidget {
  const Read_Entries_Screen({super.key});

  @override
  State<Read_Entries_Screen> createState() => _Read_Entries_ScreenState();
}

class _Read_Entries_ScreenState extends State<Read_Entries_Screen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Entries')
      .orderBy("Date", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Keep_Title(),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }

                    const EmptyView();

                    return ListView(
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Column(
                            children: [
                              Entry_Title(
                                id: document.id,
                                title: data['Title'],
                                entry: data['Entry'],
                                dateTime: data['Date'],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              KeepButton(
                label: "Back",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Keep_Title(),
        const SizedBox(
          height: 20,
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Please Add Entry',
              style: kButtonText,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
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
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
