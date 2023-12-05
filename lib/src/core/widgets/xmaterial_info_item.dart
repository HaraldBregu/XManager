import 'package:flutter/cupertino.dart';

class XMaterialInfoItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final TextStyle? style;

  const XMaterialInfoItem(this.title, {Key? key, this.icon, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> child = [];
    if (icon != null) {
      child.add(Icon(icon, size: 20));
      child.add(const SizedBox(width: 5));
    }
    child.add(Text(title, style: style));

    return SizedBox(height: 25, child: Row(children: child));
  }
}

