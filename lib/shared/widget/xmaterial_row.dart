import 'package:flutter/cupertino.dart';

class XMaterialRow extends StatelessWidget {
  final List<Widget> children;

  const XMaterialRow({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: children.asMap().entries.map((e) => e.value).toList());
  }
}
