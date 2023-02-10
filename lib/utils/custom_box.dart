import 'package:news_app/utils/barrel.dart';

class CustomBox extends StatelessWidget {
  const CustomBox(
      {Key? key,
      this.onTap,
      required this.height,
      required this.width,
      this.color,
      this.style,
      required this.text})
      : super(key: key);
  final Function()? onTap;
  final double height;
  final double width;
  final Color? color;
  final TextStyle? style;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(text, style: style),
          ),
        ),
      ),
    );
  }
}
