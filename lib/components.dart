// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:keep_note/constants.dart';
import 'package:keep_note/functions.dart';
import 'package:keep_note/screens/read_entries_details_screen.dart';

class Keep_Title extends StatelessWidget {
  const Keep_Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Keep Note',
          style: TextStyle(
              fontFamily: 'Schyler',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 7
                ..color = const Color.fromARGB(255, 141, 13, 66)),
        ),
        const Text(
          'Keep Note',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'schyler',
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class KeepButton extends StatelessWidget {
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final isLoading;
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  const KeepButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w * 0.45,
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(width: 3, color: Colors.white),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  label,
                  style: kButtonText,
                ),
        ),
      ),
    );
  }
}

class Entry_Title extends StatelessWidget {
  final String id;
  final String title;
  final String entry;
  final String dateTime;
  const Entry_Title(
      {super.key,
      required this.id,
      required this.title,
      required this.entry,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        11,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 3,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Read_Entries_Details_Screen(
                title: title,
                entry: entry,
                date: dateTime,
              ),
            ),
          );
        },
        contentPadding: const EdgeInsets.all(3),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          entry,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        tileColor: Colors.white,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${dateTime.substring(5, 11)} ${dateTime.substring(0, 3)}',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   '  ${dateTime.substring(17).trim()}',
            //   style: const TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.black),
            // ),

            InkWell(
              onTap: () {
                deleteData(id);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
