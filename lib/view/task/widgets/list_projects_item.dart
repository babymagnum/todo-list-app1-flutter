import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/project_model.dart';
import 'package:flutter/material.dart';

class ListProjectsItem extends StatelessWidget {
  
  ListProjectsItem({Key key, this.index, this.item}): super(key: key);
  
  final ProjectModel item;
  final int index;
  
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Colors.white)..boxShadow(color: Color(0xFFBBBBBB).withOpacity(0.35), offset: Offset(2, 7), blur: 3)..borderRadius(all: 5)
        ..padding(top: 32)..margin(left: index % 2 == 0 ? 0 : 19, top: index <= 1 ? 16 : 23),
      child: Column(
        children: <Widget>[
          Parent(
            style: ParentStyle()..height(65)..width(65)..borderRadius(all: 65/2)..background.color(Color(item.backgroundColor).withOpacity(0.36)),
            child: Center(
              child: Image.asset('assets/images/${item.image}'),
            ),
          ),
          SizedBox(height: 7,),
          Text(item.title, style: ThemeTextStyle.rubikM.apply(fontSizeDelta: 1, color: Color(0xFF686868)),),
          SizedBox(height: 9,),
          Text('${item.totalTask} Task', style: ThemeTextStyle.rubikR.apply(fontSizeDelta: -6, color: Color(0xFFA1A1A1)),)
        ],
      ),
    );
  }
}
