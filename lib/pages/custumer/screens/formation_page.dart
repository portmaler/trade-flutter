import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trade_app1/main.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FormationPage extends StatefulWidget {
  const FormationPage({Key? key}) : super(key: key);

  @override
  State<FormationPage> createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * .4,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: MyApp.colors.goldcolor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: size.width * .7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0,
                                              top: 10.0,
                                              right: 40.0,
                                              bottom: 10.0),
                                          child: AutoSizeText(
                                            "Formations",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                            /*TextStyle(
                                                color: MyApp.colors.goldcolor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 50),*/
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/learn.png"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0,
                                      top: 10.0,
                                      right: 40.0,
                                      bottom: 10.0),
                                  child: AutoSizeText(
                                    "Decouvrir les derniers formation de la categorie Forex",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                    /*TextStyle(
                                            color: MyApp.colors.blackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 100),*/
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: NavBottons(size),
                        ),
                      ]),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: MyApp.colors.goldcolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Scrollbar(child: buildList()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding NavBottons(Size size) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, top: 10, right: 40.0, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: NavBottonsItem(
                size,
                Icon(
                  Icons.category,
                  color: MyApp.colors.greycolor,
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(5),
              child: NavBottonsItem(
                size,
                Icon(
                  Icons.bolt,
                  color: MyApp.colors.greycolor,
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(5),
              child: NavBottonsItem(
                size,
                Icon(
                  Icons.pinch,
                  color: MyApp.colors.greycolor,
                ),
              )),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InkWell NavBottonsItem(Size size, Icon icon) => InkWell(
        onTap: () {},
        child: Container(
            width: size.height * .4 * 3 / 14 - 10,
            height: size.height * .4 * 3 / 14,
            decoration: BoxDecoration(
              color: MyApp.colors.goldcolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: icon),
      );

  Widget buildList() => ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(15),
              child: ListTile(
                  title: Text(titles[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: Text(
                    subtitles[index][0] + '\n' + subtitles[index][1],
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Image.asset("assets/checklist.png"),
                  trailing: Icon(
                    icons[index],
                    color: Colors.black,
                    size: 35,
                  ))),
        );
      });

  final titles = ["Trading Su8bject", "Trading Su8bject", "Forex Subject"];
  final subtitles = [
    ["SL 11.10", "PM 10.12"],
    ["SL 11.10", "PM 10.12"],
    ["SL 11.10", "PM 10.12"],
  ];

  final icons = [Icons.save_alt_outlined, Icons.save_sharp, Icons.save];
}
