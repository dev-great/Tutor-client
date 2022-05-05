import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor/states/quizedetails.dart';
import 'package:tutor/states/quizestate.dart';

class QuizDetail extends StatefulWidget {
  final String slug;
  const QuizDetail({Key? key, required this.slug}) : super(key: key);

  @override
  State<QuizDetail> createState() => _QuizDetailState();
}

class _QuizDetailState extends State<QuizDetail> {
  @override
  Widget build(BuildContext context) {
    String slug = widget.slug;
    bool _init = true;
    bool _isLoding = true;

    @override
    void didChangeDependencies() async {
      if (_init) {
        _isLoding = await Provider.of<QuizeDetailState>(context, listen: false)
            .getQuizDetails(slug);
        await Provider.of<QuizState>(context, listen: false).getQuizes();
        setState(() {});
      }
      _init = false;
      super.didChangeDependencies();
    }

    final detail =
        Provider.of<QuizeDetailState>(context, listen: false).details;
    int lnt = detail.length;
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
                      "Course",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 32,
                          color: Color(0xFF003D21),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "All available quiz",
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
              Provider.of<QuizeDetailState>(context, listen: false)
                  .getQuizDetails(slug);
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
                            "Quizzes",
                            style: TextStyle(
                                fontFamily: "GTWalsheimPro",
                                fontSize: 32,
                                color: Color.fromARGB(255, 0, 39, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "All available quiz",
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
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              Image.network(detail[i].quiz!.image.toString()),
                              Text(
                                detail[i].quiz!.name.toString(),
                                style: const TextStyle(
                                    fontFamily: "GTWalsheimPro",
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 0, 39, 75),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                detail[i].quiz!.description.toString(),
                                style: const TextStyle(
                                    fontFamily: "GTWalsheimPro",
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 39, 75),
                                    fontWeight: FontWeight.normal),
                              ),
                              Column(
                                children: [
                                  Text(
                                    detail[i]
                                        .quiz!
                                        .questionSet![i]
                                        .label
                                        .toString(),
                                    style: const TextStyle(
                                        fontFamily: "GTWalsheimPro",
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 39, 75),
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    detail[i]
                                        .quiz!
                                        .questionSet![i]
                                        .answerSet![i]
                                        .label
                                        .toString(),
                                    style: const TextStyle(
                                        fontFamily: "GTWalsheimPro",
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 39, 75),
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    detail[i]
                                        .quiz!
                                        .questionSet![i]
                                        .answerSet![i + 1]
                                        .label
                                        .toString(),
                                    style: const TextStyle(
                                        fontFamily: "GTWalsheimPro",
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 39, 75),
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    detail[i]
                                        .quiz!
                                        .questionSet![i]
                                        .answerSet![i + 2]
                                        .label
                                        .toString(),
                                    style: const TextStyle(
                                        fontFamily: "GTWalsheimPro",
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 39, 75),
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              ButtonBar(
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 0, 39, 75)),
                                    child: const Center(
                                      child: Text(
                                        "Start quiz",
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
