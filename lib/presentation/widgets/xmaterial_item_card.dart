import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xmanager/presentation/widgets/xmaterial_card.dart';


class XMaterialItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  final Function()? onLongPress;

  const XMaterialItemCard({Key? key, required this.title, required this.icon, this.onTap, this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return XMaterialCard(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: 35.0,
              width: 35.0,
              color: colorScheme.tertiaryContainer,
              child: Icon(icon, color:colorScheme.onTertiaryContainer , size: 20.0),
            ),
          ),
          title: Text(title, style: textTheme.titleMedium),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16,),
          selected: true,
          onTap: onTap,
          onLongPress: onLongPress,
        )
    );
  }
}
