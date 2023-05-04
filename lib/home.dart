import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:signup/genres.dart';
import 'package:signup/provider/genresProvider.dart';
import 'package:signup/provider/genresService.dart';
import 'package:signup/styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  bool inPerson = false;
  bool virtual = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<GenresProvider>(
                builder: (context, genresProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign Up",
                        style: wHeading3,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel_rounded,
                            size: 40,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "Let's create your ", style: wHeading1),
                    TextSpan(text: "Account", style: aHeading1)
                  ])),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "First Name *",
                    style: wHeading3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    cursorColor: Colors.amber,
                    style: wHeading3,
                    controller: firstName,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(RegExp("[0-9]")),
                    ],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.5), width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Last Name *",
                    style: wHeading3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    style: wHeading3,
                    cursorColor: Colors.amber,
                    controller: lastName,
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(RegExp("[0-9]")),
                    ],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.5), width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Mobile No *",
                    style: wHeading3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    cursorColor: Colors.amber,
                    controller: mobileNumber,
                    style: wHeading3,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(color: Colors.black, spreadRadius: 3),
                          ],
                        ),
                        //width: 50,
                        height: 52,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.fromLTRB(4, 0, 10, 0),
                        child: Text(
                          "+91",
                          style: wHeading3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.5), width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Email *",
                    style: wHeading3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    cursorColor: Colors.amber,
                    style: wHeading3,
                    controller: email,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z0-9.@]"))
                    ],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.5), width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Genres",
                    style: wHeading3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  genresProvider.filters.isEmpty
                      ? InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return const Genres();
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      : Wrap(spacing: 8.0, children: [
                          ...genresProvider.filters.map((e) {
                            return FilterChip(
                              onSelected: (bool value) {
                                setState(() {
                                  genresProvider.clearFilterGenres(del: e);
                                  genresProvider.getGenresModelProvider();
                                });
                              },
                              avatar: InkWell(
                                onTap: () {
                                  setState(() {
                                    genresProvider.clearFilterGenres(del: e);
                                    genresProvider.getGenresModelProvider();
                                  });
                                },
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              backgroundColor: Colors.amber,
                              label: Text(
                                e,
                                style: wHeading4,
                              ),
                            );
                          }).toList(),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Genres();
                                  });
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.amber,
                              size: 50,
                            ),
                          ),
                        ]),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Performance Type *",
                    style: wHeading3,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          side:
                              const BorderSide(color: Colors.amber, width: 3.0),
                          activeColor: Colors.amber,
                          value: inPerson,
                          onChanged: (newValue) {
                            setState(() {
                              inPerson = !inPerson;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "In Person",
                        style: wHeading3,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Checkbox(
                          side:
                              const BorderSide(color: Colors.amber, width: 3.0),
                          activeColor: Colors.amber,
                          value: virtual,
                          onChanged: (newValue) {
                            setState(() {
                              virtual = !virtual;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Virtual",
                        style: wHeading3,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: wHeading3,
                      ))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
