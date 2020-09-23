import 'package:cultive/widgets/utils/CustomFloatingButton.dart';
import 'package:cultive/widgets/utils/CustomGridList.dart';
import 'package:flutter/material.dart';

enum ActionPageTypes { Regar, Podar, Adubar }

class ActionPage extends StatelessWidget {
  ActionPageTypes type;

  ActionPage(ActionPageTypes type) {
    this.type = type;
  }

  String get _nextAction {
    switch (this.type) {
      case ActionPageTypes.Regar:
        return 'Horário da próxima rega';
        break;
      case ActionPageTypes.Adubar:
        return 'Horário da próxima adubação';
        break;
      case ActionPageTypes.Podar:
        return 'Horário da próxima poda';
        break;
      default:
        return '';
    }
  }

  String get _historyAction {
    switch (this.type) {
      case ActionPageTypes.Regar:
        return 'Histórico de rega';
        break;
      case ActionPageTypes.Adubar:
        return 'Histórico de adubação';
        break;
      case ActionPageTypes.Podar:
        return 'Histórico de poda';
        break;
      default:
        return '';
    }
  }

  Color get _colorAction {
    switch (this.type) {
      case ActionPageTypes.Regar:
        return Color(0xff5993C8);
        break;
      case ActionPageTypes.Adubar:
        return Color(0xffC16544);
        break;
      case ActionPageTypes.Podar:
        return Color(0xff6ACC91);
        break;
      default:
        return Colors.transparent;
    }
  }

  String get _assetAction {
    switch (this.type) {
      case ActionPageTypes.Regar:
        return 'lib/assets/images/regar.png';
        break;
      case ActionPageTypes.Adubar:
        return 'lib/assets/images/adubar.png';
        break;
      case ActionPageTypes.Podar:
        return 'lib/assets/images/podar.png';
        break;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Divider(),
            Container(
              width: 1 / 0,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 60,
                    child: Image.network(
                      "http://10.0.2.2:3333/uploads/avatar_plants/avatar1.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            _nextAction,
                            style: TextStyle(
                                color: Color(0xff297F4E), fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('21/09/2020 12:00',
                              style: TextStyle(
                                  color: Color(0xff297F4E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      )),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            CustomGridList(_historyAction, [
              '15/06/2020 - 10:00',
              '12/06/2020 - 10:00',
              '14/06/2020 - 10:00',
              '10/06/2020 - 10:00'
            ])
          ],
        ),
        floatingActionButton: CustomFloatingButton(
            _colorAction, Image.asset(_assetAction), null));
  }
}
