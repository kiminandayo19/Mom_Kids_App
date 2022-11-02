import 'package:flutter/material.dart';
import '../../components/searchbox/searchbox_component.dart';

class Article extends StatefulWidget {
  const Article({Key? key}) : super(key: key);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);

    return Column(
      children: <Widget>[
        SearchBox(searchType: 'article',),

        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: const Color(0xFF1E1E1E),
            labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            labelStyle: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 14.0,),
            unselectedLabelColor: const Color(0xFF808080),
            indicator: CircleTabIndicator(color: const Color(0xFF1E1E1E), radius: 4),
            tabs: const [
              Tab(text: "Home",),
              Tab(text: "Pregnancy",),
              Tab(text: "Parenting",),
              Tab(text: "Tips & Trick",),
              Tab(text: "Information",),
            ],
          ),
        ),


        Expanded(
          child: SizedBox(
            // color: Colors.greenAccent,
            width: double.maxFinite,
            height: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children:const  [
                HomeTabView(),
                HomeTabView(articleType: "preg",),
                HomeTabView(articleType: "parent",),
                HomeTabView(articleType: "tips",),
                HomeTabView(articleType: "info",),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator( {required this.color, required this.radius} );

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter( {required this.color, required this.radius} );

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint ..isAntiAlias = true;
    final Offset circleOffset = offset + Offset(config.size!.width / 2, config.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class HomeTabView extends StatefulWidget {
  final String articleType;
  const HomeTabView({Key? key, this.articleType = "home"}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {

  @override
  Widget build(BuildContext context) {
    String arType = widget.articleType;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 256,
            // padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 10,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return Container(
                  width: 216,
                  height: 216,
                  margin: index < 9 ? const EdgeInsets.only(right: 16.0) : const EdgeInsets.only(right: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF336A63).withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 196.0,
                          height: 94.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                              image: AssetImage("assets/images/wide_article_illustration.png"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF336A63).withOpacity(0.15),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: const Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 9.0,),

                        Text(
                          arType == "preg" ? "Pregnancy" :
                          arType == "parent" ? "Parenting" :
                          arType == "tips" ? "Tips & Trick" :
                          arType == "info" ? "Information" :
                          index % 2 == 0 ? "Parenting" : index % 3 == 0 ? "Pregnancy" : "Tips & Trick",
                          style: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 10, color: Color(0xFF808080)),
                        ),

                        const SizedBox(height: 8.0,),

                        Text(
                          index % 2 == 0 ? "Mengatasi Nyeri Pinggang Saat Hamil" : "Ngidam Saat Hamil Apakah Harus Dituruti?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 14, color: Colors.black),
                        ),

                        const SizedBox(height: 12.0,),

                        Row(
                          children: <Widget>[
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/article_publisher.png")
                                  )
                              ),
                            ),

                            const SizedBox(width: 8.0,),

                            const SizedBox(
                              width: 110.0,
                              child: Text("Publisher",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10, fontFamily: "Avenir-Regular", color: Colors.black,
                                ),
                              ),
                            ),

                            const Spacer(),

                            Text("2 Jul 2022",
                              style: TextStyle(
                                fontSize: 10, fontFamily: "Avenir-Regular", color: Color(0xFF808080),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 24.0,),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // decoration: BoxDecoration(
            //   border: Border.all(width: 1)
            // ),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text("Berita Terbaru",
                    style: TextStyle(
                      fontSize: 16, fontFamily: "Avenir-Black",
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 14.0,),
                  itemCount: 15,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF336A63).withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 86,
                              height: 84,
                              decoration: BoxDecoration(
                                // border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/square_article_illustration.png")
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF336A63).withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12,),

                            Expanded(
                              child: SizedBox(
                                height: 86,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      arType == "preg" ? "Pregnancy" :
                                      arType == "parent" ? "Parenting" :
                                      arType == "tips" ? "Tips & Trick" :
                                      arType == "info" ? "Information" :
                                      index % 2 == 0 ? "Parenting" : index % 3 == 0 ? "Pregnancy" : "Tips & Trick",
                                      style: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 10, color: Color(0xFF808080)),
                                    ),

                                    const SizedBox(height: 4.0,),

                                    Text(
                                      index % 2 == 0 ? "Mengatasi Nyeri Pinggang Saat Hamil" : "Ngidam Saat Hamil Apakah Harus Dituruti?",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 14, color: Colors.black),
                                    ),

                                    const Spacer(),

                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/article_publisher.png")
                                              )
                                          ),
                                        ),

                                        const SizedBox(width: 8.0,),

                                        const SizedBox(
                                          width: 110.0,
                                          child: Text("Publisher",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 10, fontFamily: "Avenir-Regular", color: Colors.black,
                                            ),
                                          ),
                                        ),

                                        const Spacer(),

                                        Text("14 jam",
                                          style: TextStyle(
                                            fontSize: 10, fontFamily: "Avenir-Regular", color: Color(0xFF808080),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}