import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/logic/bloc/news_bloc.dart';
import 'package:news_app/presentation/screens/Widget/hero_widget.dart';
import 'package:news_app/presentation/screens/Widget/menu_bar.dart';
import 'package:news_app/utils/barrel.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
    this.testingController,
  }) : super(key: key);

  final Controller? testingController;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Controller controller;

  @override
  void initState() {
    controller = widget.testingController ?? Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavDrawer(),
      body: SafeArea(
        child: BlocConsumer<NewsBloc, NewsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewsLoading) {
                return Center(child: Lottie.asset('assets/lottie/news.json'));
              } else if (state is NewsLoaded) {
                return TikTokStyleFullPageScroller(
                  contentSize: state.newsModel!.length,
                  swipePositionThreshold: 0.2,
                  swipeVelocityThreshold: 2000,
                  animationDuration: const Duration(milliseconds: 400),
                  controller: controller,
                  builder: (BuildContext context, int index) {
                    return Container(
                      color: KColor.white,
                      height: height,
                      width: width,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width,
                                height: 300,
                                child: Hero(
                                  tag: 'imageHero',
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HeroWidget(
                                              url: state
                                                  .newsModel![index].imageUrl!),
                                        )),
                                    child: Image.network(
                                        state.newsModel![index].imageUrl!,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    Text(
                                      state.newsModel![index].title!,
                                      textAlign: TextAlign.start,
                                      style: Const.large,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      state.newsModel![index].content!,
                                      textAlign: TextAlign.start,
                                      style: Const.bold.copyWith(
                                          color: KColor.disableText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                          height: 1.5),
                                    )
                                  ],
                                ),
                              )),
                            ],
                          ),
                          Positioned(
                            top: 290,
                            left: 20,
                            child: Container(
                              height: 20,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: KColor.previousColor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: Text(
                                  "inshorts",
                                  style: Const.medium
                                      .copyWith(color: KColor.disableText),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
              return Container();
            }),
      ),
    );
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {int? currentIndex}) {
    print(
        "Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");
  }
}
