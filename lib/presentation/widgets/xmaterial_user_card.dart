import 'package:flutter/material.dart';
import 'package:xmanager/presentation/widgets/xmaterial_card.dart';


class XMaterialUserCard extends StatelessWidget {
  final String fullName;
  final String? description;
  final Widget? container;

  const XMaterialUserCard(this.fullName, {Key? key, this.description, this.container}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    List<Widget> items = [];

    var style = textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900);
    Text? descriptionText;
    if (description != null) {
      descriptionText = Text(description as String, style: textTheme.bodyMedium);
    }

    items.add(ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(fullName, style: style),
      subtitle: descriptionText,
      selected: true,
    ));
    items.add(const SizedBox(height: 20));

    if (container != null) {
      items.add(container as Widget);
    }

    var padding = const EdgeInsets.all(15.0);
    var child = Column(children: items);

    return XMaterialCard(child: Padding(padding: padding, child: child));
  }
}
