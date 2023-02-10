import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/bloc/news_bloc.dart';
import 'package:news_app/presentation/screens/card_widget/card.dart';
import 'package:news_app/utils/barrel.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const Text(Strings.all),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.all));
              },
            ),
            ListTile(
              title: const Text(Strings.national),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.national));
              },
            ),
            ListTile(
              title: const Text(Strings.business),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.business));
              },
            ),
            ListTile(
              title: const Text(Strings.sports),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.sports));
              },
            ),
            ListTile(
              title: const Text(Strings.world),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.world));
              },
            ),
            ListTile(
              title: const Text(Strings.politics),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.politics));
              },
            ),
            ListTile(
              title: const Text(Strings.technology),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.technology));
              },
            ),
            ListTile(
              title: const Text(Strings.startup),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.startup));
              },
            ),
            ListTile(
              title: const Text(Strings.entertainment),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.entertainment));
              },
            ),
            ListTile(
              title: const Text(Strings.miscellaneous),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.miscellaneous));
              },
            ),
            ListTile(
              title: const Text(Strings.hatke),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.hatke));
              },
            ),
            ListTile(
              title: const Text(Strings.science),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.science));
              },
            ),
            ListTile(
              title: const Text(Strings.automobile),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWidget(),
                    ));
                BlocProvider.of<NewsBloc>(context)
                    .add(GetNews(category: Strings.automobile));
              },
            ),
          ],
        ),
      ),
    );
  }
}
