import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_circular_check_box.dart';
import 'package:dribbble_clone/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListTaskItem extends StatelessWidget {

  ListTaskItem({Key key, @required this.isFirst, @required this.onNotifyChanged, @required this.onCheckChanged, @required this.isLast, @required this.item, @required this.itemBefore}): super(key: key);

  Function(bool) onNotifyChanged;
  Function(bool) onCheckChanged;
  final TaskModel itemBefore;
  final TaskModel item;
  final bool isLast;
  final bool isFirst;

  Color _getColor() {
    if (item.type == 'Personal') return Color(0xFFFFD506);
    if (item.type == 'Work') return Color(0xFF1ED102);
    if (item.type == 'Meeting') return Color(0xFFD10263);
    if (item.type == 'Shopping') return Color(0xFFF29130);
    if (item.type == 'Party') return Color(0xFF9BFFF8);
    else return Color(0xFF3044F2);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.only(
          top: 7.5,
          left: 18,
          right: 18,
          bottom: 7.5
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0, top: 0, bottom: 0,
              child: Container(
                width: 4,
                decoration: BoxDecoration(
                  color: _getColor(),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                ),
              )
            ),
            Parent(
              style: ParentStyle()..borderRadius(topRight: 5, bottomRight: 5)..background.color(Colors.white)..boxShadow(color: Colors.black.withOpacity(0.05), offset: Offset(1, 1), blur: 3)
                ..padding(vertical: 8)..margin(left: 4),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 3),
                  CustomCircularCheckBox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: Color(0xFF91DC5A),
                    value: item.isCheck,
                    inactiveColor: Color(0xFFB5B5B5),
                    onChanged: (value) => onCheckChanged(value)
                  ),
                  SizedBox(width: 10,),
                  Text(
                    TextUtil.convertDateStringToAnotherFormat(item.date, 'HH.mm a', 'dd-MM-yyyy HH:mm'),
                    style: ThemeTextStyle.rubikR.apply(fontSizeDelta: -5, color: Color(0xFFC6C6C8)),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: item.isCheck ?
                          ThemeTextStyle.rubikR.apply(fontSizeDelta: -2, color: Color(0xFFD9D9D9), decoration: TextDecoration.lineThrough) :
                          ThemeTextStyle.rubikM.apply(fontSizeDelta: -2, color: Color(0xFF554E8F))
                        )
                      ],
                    )
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () => onNotifyChanged(!item.isNotify),
                    child: Image.asset('assets/images/ic_bell.png', color: item.isNotify ? Color(0xFFFFDC00) : Color(0xFFD9D9D9),)
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
