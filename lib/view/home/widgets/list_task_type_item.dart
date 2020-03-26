import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/task_type_model.dart';
import 'package:flutter/material.dart';

class ListTaskTypeItem extends StatelessWidget {

  ListTaskTypeItem({Key key, this.onSelectedItem, this.isFirst, this.item, this.isLast}): super(key: key);

  final bool isFirst;
  final bool isLast;
  final TaskTypeModel item;
  final Function(bool) onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: isFirst ? 23 : 0, right: isLast ? 23 : 15),
      child: GestureDetector(
        onTap: () => onSelectedItem(!item.isSelected),
        child: item.isSelected ?
        Parent(
          style: ParentStyle()..borderRadius(all: 3)..background.color(item.color)..padding(vertical: 4, horizontal: 10)
            ..boxShadow(color: item.color.withOpacity(0.33), offset: Offset(1, 3), blur: 3),
          child: Text(item.title, style: ThemeTextStyle.rubikR.apply(fontSizeDelta: -1, color: Colors.white),),
        ) :
        Row(
          children: <Widget>[
            Container(
              height: 10, width: 10,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.all(Radius.circular(10/2))
              ),
            ),
            SizedBox(width: 5,),
            Text(item.title, style: ThemeTextStyle.rubikR.apply(fontSizeDelta: -1, color: Color(0xFF8E8E8E)),)
          ],
        ),
      ),
    );
  }
}
