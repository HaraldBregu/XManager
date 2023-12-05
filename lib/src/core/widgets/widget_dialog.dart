import 'package:flutter/material.dart';

class WidgetDialog extends StatefulWidget {
  final String title;
  final String descriptions;
  final String text;
  final Image? img;

  const WidgetDialog({super.key, required this.title, required this.descriptions, required this.text, this.img});

  @override
  State<WidgetDialog> createState() => _WidgetDialogState();
}

class _WidgetDialogState extends State<WidgetDialog> {
  @override

  Widget build(BuildContext context) {

    contentBox(context){
      return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20,top: 45 + 20, right: 20,bottom: 20),
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black,
                      offset: Offset(0,10),
                      blurRadius: 10
                  ),
                ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(widget.title, style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,),),
                const SizedBox(height: 15,),
                Text(widget.descriptions, style: const TextStyle(
                    fontSize: 14,),
                  textAlign: TextAlign.center,),
                const SizedBox(height: 22,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: (){
                        Navigator.of(this.context).pop();
                      },
                      child: Text(widget.text,style: TextStyle(fontSize: 18),)),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 45,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  child: Image.asset("assets/header.jpg")
              ),
            ),
          ),
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

}
