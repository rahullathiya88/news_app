import 'package:news_app/utils/barrel.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Icon(Icons.close, color: KColor.white, size: 20)),
              ),
              const Spacer(),
              Center(
                child: Image.network(url, fit: BoxFit.cover),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
