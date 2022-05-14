import 'package:untitled/impots.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String? text;
  final IconData? icon;
  final Color? color;
  final double? width;
  final double? height;
  const Button(
      {Key? key,
      required this.onPressed,
      this.text,
      this.color,
      this.icon,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () => onPressed(),
        child: SizedBox(
          width: width ?? 150,
          height: height ?? 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon ?? Icons.login,
                color: Colors.white,
              ),
              const SizedBox(),
              Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        color: color ?? Colors.indigo,
      ),
    );
  }
}
