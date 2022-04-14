import 'package:flutter/material.dart';

import '../../../core/constanst/ui_constans.dart';
import '../../../core/validators/text_validators.dart';
import '../../../models/gastos_model.dart';
import '../../components/background/background.dart';
import '../../components/botton/botton_action.dart';
import '../../components/textfroms/text_forms_gastos.dart';
import '../../styles/palette.dart';
import '../home/home.dart';

class Gastos extends StatefulWidget {
  const Gastos({Key? key}) : super(key: key);
  static const route = 'Gastos';

  @override
  State<Gastos> createState() => _GastosState();
}

class _GastosState extends State<Gastos> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hospedaje = TextEditingController();
  final TextEditingController _fecha = TextEditingController();
  final TextEditingController _hospedajecosto = TextEditingController();
  final TextEditingController _combustible = TextEditingController();
  final TextEditingController _combustiblecantidad = TextEditingController();
  final TextEditingController _combustiblecosto = TextEditingController();
  final TextEditingController _peajescosto = TextEditingController();
  final TextEditingController _peaje = TextEditingController();
  final TextEditingController _novedad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return WillPopScope(
          onWillPop: () async => _willPopCallback(),
          child: Background(
            appBar: AppBar(
              actions: [
                SizedBox(
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: UIConstants.buttonHalfSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Gastos',
                          style: Theme.of(context).textTheme.headline2?.copyWith(
                                color: Palette.white,
                                fontSize: 30,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
              backgroundColor: Palette.darkGrey,
            ),
            children: [
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(UIConstants.buttonHalfSize),
                  margin: const EdgeInsets.all(UIConstants.margin),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: UIConstants.buttonSize + 20),
                      Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: CustomTextFormFieldGastos(
                                      helper: 'Hospedaje',
                                      text: 'Nombre',
                                      controller: _hospedaje,
                                      validator: TextValidators.empatyValidator,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: UIConstants.buttonHalfSize,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: CustomTextFormFieldGastos(
                                        helper: 'Fecha',
                                        text: 'MM/YY',
                                        controller: _fecha,
                                        validator: TextValidators.empatyValidator,
                                        textInputType: TextInputType.number),
                                  ),
                                  const SizedBox(
                                    width: UIConstants.buttonHalfSize,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: CustomTextFormFieldGastos(
                                        helper: 'costo',
                                        text: '000',
                                        controller: _hospedajecosto,
                                        validator: TextValidators.empatyValidator,
                                        textInputType: TextInputType.number),
                                  )
                                ],
                              ),
                              const SizedBox(height: UIConstants.buttonHalfSize),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: CustomTextFormFieldGastos(
                                      helper: 'Combustible',
                                      text: 'Tipo',
                                      controller: _combustible,
                                      validator: TextValidators.empatyValidator,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: UIConstants.buttonHalfSize,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: CustomTextFormFieldGastos(
                                        helper: 'Cantidad',
                                        text: '000',
                                        controller: _combustiblecantidad,
                                        validator: TextValidators.empatyValidator,
                                        textInputType: TextInputType.number),
                                  ),
                                  const SizedBox(
                                    width: UIConstants.buttonHalfSize,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: CustomTextFormFieldGastos(
                                        helper: 'Costo',
                                        text: '000',
                                        controller: _combustiblecosto,
                                        validator: TextValidators.empatyValidator,
                                        textInputType: TextInputType.number),
                                  )
                                ],
                              ),
                              const SizedBox(height: UIConstants.buttonHalfSize),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: CustomTextFormFieldGastos(
                                      helper: 'Peajes',
                                      text: 'Tramo',
                                      controller: _peaje,
                                      validator: TextValidators.empatyValidator,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: UIConstants.buttonHalfSize,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: CustomTextFormFieldGastos(
                                      helper: 'Costo',
                                      text: '000',
                                      controller: _peajescosto,
                                      textInputType: TextInputType.number,
                                      validator: TextValidators.empatyValidator,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: UIConstants.buttonHalfSize,
                              ),
                              CustomTextFormFieldGastos(
                                helper: 'Novedades',
                                text: 'Describa la situación',
                                controller: _novedad,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: UIConstants.buttonSize),
                      CustomRaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // ignore: avoid_print
                            print(GastosModel(
                              combustible: _combustible.text,
                              combustiblecantidad: int.parse(_combustiblecantidad.text),
                              combustiblecosto: int.parse(_combustiblecantidad.text),
                              peaje: _peaje.text,
                              peajecosto: int.parse(_peajescosto.text),
                              hospedaje: _hospedaje.text,
                              hospedajecosto: int.parse(_hospedajecosto.text),
                              date: _fecha.text,
                              noveda: _novedad.text,
                            ));
                          }
                        },
                        text: 'Registrar gastos',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacementNamed(
      context,
      Home.route,
    );
    return Future.value(true);
  }
}
