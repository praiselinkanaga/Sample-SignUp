import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/model/getGenresModel.dart';
import 'package:signup/provider/genresProvider.dart';
import 'package:signup/provider/genresService.dart';
import 'package:signup/styles.dart';

class Genres extends StatefulWidget {
  const Genres({Key? key}) : super(key: key);

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  List<String> tempfilters = <String>[];

  setProviders() {
    var filterGenresProvider =
        Provider.of<GenresProvider>(context, listen: false);
    if (filterGenresProvider.filters.isNotEmpty) {
      tempfilters = filterGenresProvider.filters;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setProviders();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GenresProvider>(builder: (context, genresProvider, child) {
      return Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 10),
            width: double.infinity,
            height: 400,
            color: const Color(0xFF000d1a),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genres",
                      style: aHeading4,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FutureBuilder<GetGenresModel?>(
                        future: GenresService().getGenresApi(),
                        builder: (BuildContext context,
                            AsyncSnapshot<GetGenresModel?> snapshot) {
                          Widget result;
                          if (snapshot.hasData) {
                            result = Wrap(
                              spacing: 8.0,
                              children: snapshot.data!.data!.genres!.map((e) {
                                return FilterChip(
                                    showCheckmark: false,
                                    backgroundColor: Colors.white,
                                    selected: tempfilters.contains(e.name),
                                    selectedColor: Colors.amber,
                                    label: Text(
                                      e.name!,
                                      style: wHeading4,
                                    ),
                                    onSelected: (bool value) {
                                      setState(() {
                                        if (value) {
                                          if (!tempfilters.contains(e.name)) {
                                            tempfilters.add(e.name!);
                                          }
                                        } else {
                                          tempfilters
                                              .removeWhere((String name) {
                                            return name == e.name;
                                          });
                                        }
                                      });
                                    });
                              }).toList(),
                            );
                          } else if (snapshot.hasError) {
                            result = Text('Error: ${snapshot.error}');
                          } else {
                            result = const Center(
                                child: CircularProgressIndicator(
                              color: Colors.amber,
                            ));
                          }
                          return result;
                        })
                  ]),
            ),
          ),
          Positioned(
              bottom: 10,
              // top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xFF000d1a),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        //genresProvider.clearFilterGenres(del: tempfilters);
                        print(tempfilters);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: aHeading4,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        genresProvider.addOrRemoveGenres(val: tempfilters);
                        print(tempfilters);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Ok",
                        style: aHeading4,
                      ),
                    )
                  ],
                ),
              ))
        ],
      );
    });
  }
}
