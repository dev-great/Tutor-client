import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor/screens/widgets/quizdetail.dart';
import 'package:tutor/screens/widgets/quizhistory.dart';
import 'package:tutor/states/quizedetails.dart';
import 'package:tutor/states/quizestate.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _init = true;
  bool _isLoding = false;
  String slug = '';

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding =
          await Provider.of<QuizState>(context, listen: false).getQuizes();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizState>(context, listen: false).quizes;
    int lnt = quiz.length;
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
                      "Quizzes",
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
      return Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 4));
            Provider.of<QuizState>(context, listen: false).getQuizes();
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
                        Row(
                          children: [
                            const Text(
                              "Quizzes",
                              style: TextStyle(
                                  fontFamily: "GTWalsheimPro",
                                  fontSize: 32,
                                  color: Color.fromARGB(255, 0, 39, 75),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  const Color.fromARGB(255, 252, 1, 1),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                QuizHistory()));
                                  },
                                  icon: const Icon(Icons.history_rounded,
                                      color: Colors.white)),
                            )
                          ],
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
                    return Column(
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width / 4,
                                width: 50,
                                child: Image.network("${quiz[i].image}",
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.6,
                                    child: Text(
                                      quiz[i].name.toString(),
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontFamily: "GTWalsheimPro",
                                          fontSize: 21,
                                          color: Color.fromARGB(255, 0, 39, 75),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, right: 5),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.6,
                                      child: Text(
                                        quiz[i].description.toString(),
                                        style: TextStyle(
                                            fontFamily: "GTWalsheimPro",
                                            color: const Color.fromARGB(
                                                    255, 0, 39, 75)
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  slug = quiz[i].slug.toString();
                                  await Provider.of<QuizeDetailState>(context,
                                          listen: false)
                                      .getQuizDetails(slug);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuizDetail(slug: slug)));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width / 4,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                        color: Color.fromARGB(255, 0, 39, 75),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  childCount: lnt,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
