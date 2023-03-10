import 'package:flutter/material.dart';
import 'package:xmanager/presentation/widgets/xmaterial_column.dart';
import 'package:xmanager/presentation/widgets/xmaterial_row.dart';
import 'package:xmanager/presentation/widgets/xmaterial_user_card.dart';


class XMaterialCoachCard extends StatelessWidget {
  final String fullName;
  final String? description;

  const XMaterialCoachCard(this.fullName, {Key? key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return XMaterialUserCard(
      fullName,
      description: description,
      container: XMaterialColumn(
        children: [
          const XMaterialRow(children: [
            XMaterialRowItem("www.sports.com", icon: Icons.domain),
            SizedBox(width: 15),
            XMaterialRowItem("Milano, Italy", icon: Icons.location_on_outlined),
          ]),
          const SizedBox(height: 8),
          XMaterialRowItem("harald.bregu@gmail.com",
              icon: Icons.email_outlined,
              style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          XMaterialRow(
            children: [
              XMaterialRowItem("ProUEFA",
                  icon: Icons.workspace_premium,
                  style: textTheme.bodyLarge),
              const SizedBox(width: 15),
              XMaterialRowItem("24 Stars",
                  icon: Icons.star_border_outlined,
                  style: textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class XMaterialRowItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final TextStyle? style;

  const XMaterialRowItem(this.title, {Key? key, this.icon, this.style}) : super(key: key);

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

