import 'package:cultive/models/plant.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/commons/custom_floating_button.dart';
import 'package:cultive/widgets/commons/custom_grid_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum ActionPageTypes { Regar, Podar, Adubar }

class ActionPage extends StatelessWidget {
  final ActionPageTypes type;
  final Plant plant;

  ActionPage(this.type, this.plant);

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

  String get _nextActionInformation {
    final formatter = DateFormat('H:m dd/MM/yyyy');
    switch (this.type) {
      case ActionPageTypes.Regar:
        return formatter.format(this.plant.nextWatering);
        break;
      case ActionPageTypes.Adubar:
        return formatter.format(this.plant.nextFertilizion);
        break;
      case ActionPageTypes.Podar:
        return formatter.format(this.plant.nextPruning);
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

  String _getAction() {
    switch (this.type) {
      case ActionPageTypes.Regar:
        return 'WATERING';
        break;
      case ActionPageTypes.Adubar:
        return 'FERTILIZION';
        break;
      case ActionPageTypes.Podar:
        return 'PRUNING';
        break;
      default:
        return '';
    }
  }

  void _onTap(PlantService service) async {
    final response = await service.action(
        id: this.plant.plantId.toString(), action: _getAction().toLowerCase());
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantService>(builder: (context, service, _) {
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
                        "${service.api.options.baseUrl}uploads/avatar_plants/avatar1.png",
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
                            Text(_nextActionInformation,
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
                'Sem histórico... ',
              ])
            ],
          ),
          floatingActionButton: CustomFloatingButton(
              _colorAction, Image.asset(_assetAction), () => _onTap(service)));
    });
  }
}
