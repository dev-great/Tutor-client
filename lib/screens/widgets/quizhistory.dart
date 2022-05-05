import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor/states/myquizestate.dart';

class QuizHistory extends StatefulWidget {
  QuizHistory({Key? key}) : super(key: key);

  @override
  State<QuizHistory> createState() => _QuizHistoryState();
}

class _QuizHistoryState extends State<QuizHistory> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding =
          await Provider.of<MyQuizeState>(context, listen: false).getMyQuize();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<MyQuizeState>(context, listen: false).myquizes;
    int lnt = history.length;
    if (!_isLoding) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "History",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 32,
                          color: Color(0xFF003D21),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "All complited quizzes",
                        style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontSize: 17,
                            color: const Color(0xFF006838).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              const Center(
                child: Image(image: AssetImage("assets/images/connecting.gif")),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 4));
              Provider.of<MyQuizeState>(context, listen: false).getMyQuize();
            },
            color: const Color.fromARGB(255, 0, 39, 75),
            backgroundColor: Colors.white,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  toolbarHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Padding(
                      padding:
                          const EdgeInsets.only(top: 55, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "History",
                            style: TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 32,
                                color: Color.fromARGB(255, 0, 39, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "All complited quizzes",
                              style: TextStyle(
                                  fontFamily: "GTWalsheimPro",
                                  fontSize: 17,
                                  color: const Color.fromARGB(255, 0, 39, 75)
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Image.network(
                                          "${history[i].image}",
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Grade:",
                                            style: TextStyle(
                                                fontFamily: "GTWalsheimPro",
                                                fontSize: 21,
                                                color: Color.fromARGB(
                                                    255, 0, 39, 75),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            color:
                                                Color.fromARGB(255, 0, 39, 75),
                                            child: Center(
                                              child: Text(
                                                "${history[i].score.toString()}%",
                                                style: const TextStyle(
                                                    fontFamily: "GTWalsheimPro",
                                                    fontSize: 21,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                35,
                                          ),
                                          const Text(
                                            "Questions:",
                                            style: TextStyle(
                                                fontFamily: "GTWalsheimPro",
                                                fontSize: 21,
                                                color: Color.fromARGB(
                                                    255, 0, 39, 75),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            color:
                                                Color.fromARGB(255, 0, 39, 75),
                                            child: Center(
                                              child: Text(
                                                history[i]
                                                    .questionsCount
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontFamily: "GTWalsheimPro",
                                                    fontSize: 21,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                35,
                                          ),
                                          const Text(
                                            "Completed:",
                                            style: TextStyle(
                                                fontFamily: "GTWalsheimPro",
                                                fontSize: 21,
                                                color: Color.fromARGB(
                                                    255, 0, 39, 75),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            color:
                                                Color.fromARGB(255, 0, 39, 75),
                                            child: Center(
                                              child: Text(
                                                history[i]
                                                    .completed
                                                    .toString()
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontFamily: "GTWalsheimPro",
                                                    fontSize: 21,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                35,
                                          ),
                                        ]),
                                  ]),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: Text(
                                          history[i].name.toString(),
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontFamily: "GTWalsheimPro",
                                              fontSize: 21,
                                              color: Color.fromARGB(
                                                  255, 0, 39, 75),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, right: 5),
                                        child: Text(
                                          history[i].description.toString(),
                                          style: TextStyle(
                                              fontFamily: "GTWalsheimPro",
                                              color: const Color.fromARGB(
                                                      255, 0, 39, 75)
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ButtonBar(
                                    children: [
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color.fromARGB(
                                                255, 0, 39, 75)),
                                        child: const Center(
                                          child: Text(
                                            "Retake Quiz",
                                            style: TextStyle(
                                                fontFamily: "GTWalsheimPro",
                                                fontSize: 21,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                    childCount: lnt,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
