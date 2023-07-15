import 'package:flutter/material.dart';
import 'package:xmanager/src/core/widgets/xcard.dart';
import 'package:xmanager/src/core/widgets/xmaterial_column.dart';
import 'package:xmanager/src/core/widgets/xmaterial_info_item.dart';
import 'package:xmanager/src/core/widgets/xmaterial_row.dart';

class XMaterialCoachCard extends StatelessWidget {
  const XMaterialCoachCard(
    this.fullName, {
    super.key,
    this.description,
  });
  final String fullName;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return XCard(
      child: XMaterialColumn(
        children: [
          const XMaterialRow(children: [
            XMaterialInfoItem("test", icon: Icons.domain),
            SizedBox(width: 15),
            XMaterialInfoItem("description", icon: Icons.location_on_outlined),
          ]),
          const SizedBox(height: 8),


          const XMaterialRow(children: [
            XMaterialInfoItem("www.sports.com", icon: Icons.domain),
            SizedBox(width: 15),
            XMaterialInfoItem("Milano, Italy",
                icon: Icons.location_on_outlined),
          ]),
          const SizedBox(height: 8),
          XMaterialInfoItem("harald.bregu@gmail.com",
              icon: Icons.email_outlined,
              style:
                  textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          XMaterialRow(
            children: [
              XMaterialInfoItem("ProUEFA",
                  icon: Icons.workspace_premium, style: textTheme.bodyLarge),
              const SizedBox(width: 15),
              XMaterialInfoItem("24 Stars",
                  icon: Icons.star_border_outlined, style: textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
    
  }
}

class XMaterialUserCard {}
