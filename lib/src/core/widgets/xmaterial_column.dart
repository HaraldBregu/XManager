import 'package:flutter/cupertino.dart';


class XMaterialColumn extends StatelessWidget {
  final List<Widget> children;

  const XMaterialColumn({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: children.asMap().entries.map((e) => e.value).toList());
  }
}
