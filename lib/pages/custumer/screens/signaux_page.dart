import 'package:flutter/material.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/models/list_item_signal.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Signaux extends StatefulWidget {
  Signaux({Key? key}) : super(key: key);

  @override
  State<Signaux> createState() => _SignauxState();
}

class _SignauxState extends State<Signaux> {
  late List<SignalItem> signalList;
  late List<Icon> icons;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    icons = [
      const Icon(Icons.arrow_downward_rounded, color: Colors.red, size: 35),
      const Icon(Icons.arrow_upward_rounded, color: Colors.pink, size: 35),
      const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 35)
    ];

    signalList = [
      SignalItem("Trading", "SL 11.10", "PM 10.12", icons[0]),
      SignalItem("hhading", "SL 11.10", "PM 10.12", icons[1]),
      SignalItem("Trading", "SL 11.10", "PM 10.12", icons[2])
    ];
  }

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
                                            "Signaux",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/signal.png"),
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
                                    "Decouvrir les derniers sighaux ajoute de trading et forex",
                                    style:
                                        Theme.of(context).textTheme.headline2,
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
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyApp.colors.goldcolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Scrollbar(
                          child: buildList(),
                        ),
                      ),
                    ))
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
              padding: const EdgeInsets.all(5), child: NavBottonsItem(size)),
          Padding(
              padding: const EdgeInsets.all(5), child: NavBottonsItem(size)),
          Padding(
              padding: const EdgeInsets.all(5), child: NavBottonsItem(size)),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InkWell NavBottonsItem(Size size) => InkWell(
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
          child: Icon(
            Icons.category,
            color: MyApp.colors.greycolor,
          ),
        ),
      );

  Widget buildList() => ListView.builder(
      itemCount: signalList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(15),
              child: ListTile(
                  title: Text(signalList[index].title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: Container(
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(signalList[index].subtitle1,
                            style: TextStyle(fontSize: 13)),
                        Text(signalList[index].subtitle2,
                            style: TextStyle(fontSize: 13)),
                      ],
                    )),
                  ),
                  leading: Image.asset("assets/signal.png"),
                  trailing: signalList[index].icon)),
        );
      });
}
