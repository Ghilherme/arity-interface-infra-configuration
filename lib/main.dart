import 'package:arity/anonymization_type.dart';
import 'package:arity/flow_type.dart';
import 'package:arity/geographic_location.dart';
import 'package:arity/time_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arity Evaluation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Arity Evaluation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //double _currentSliderValue = 20;
  final _form = GlobalKey<FormState>();

  static final List<FlowType> _flowType = flowType;
  final _itemsFlowType = _flowType
      .map((flowType) => MultiSelectItem<FlowType>(flowType, flowType.flowType))
      .toList();
  List<dynamic> _selectedFlowType = [];

  static final List<GeographicLocation> _geographicLocation =
      geographicLocation;
  final _itemsGeographicLocation = _geographicLocation
      .map((geographicLocation) => MultiSelectItem<GeographicLocation>(
          geographicLocation, geographicLocation.geographicLocation))
      .toList();
  List<Object?> _selectedGeographic = [];

  static final List<AnonymizationType> _anonType = anonymizationType;
  final _itemsAnonType = _anonType
      .map((anontype) =>
          MultiSelectItem<AnonymizationType>(anontype, anontype.anonType))
      .toList();
  List<Object?> _selectedAnonType = [];

  static final List<TimeWindow> _timeWindow = timeWindow;
  final _itemsTimeWindow = _timeWindow
      .map((timeWindow) =>
          MultiSelectItem<TimeWindow>(timeWindow, timeWindow.timeWindow))
      .toList();
  List<Object?> _selectedTimeWindow = [];

  bool _progressBarActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 500),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _form,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  /* Slider(
                    value: _currentSliderValue,
                    max: 100,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ), */
                  Container(height: 30),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const Icon(Icons.list),
                    title: MultiSelectDialogField(
                        initialValue: const [],
                        searchable: true,
                        items: _itemsFlowType,
                        title: const Text('Flow Type'),
                        buttonText: const Text('Select Flow Type:',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        onConfirm: (results) {
                          _selectedFlowType = results;
                        },
                        validator: (value) => value == null || value.isEmpty
                            ? 'Campo obrigatório'
                            : null),
                  ),
                  Container(height: defaultPadding),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const Icon(Icons.map_sharp),
                    title: MultiSelectDialogField(
                        initialValue: const [],
                        searchable: true,
                        items: _itemsGeographicLocation,
                        title: const Text('Geographic Location'),
                        buttonText: const Text('Select Geographic Location:',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        onConfirm: (results) => _selectedGeographic = results,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Campo obrigatório'
                            : null),
                  ),
                  Container(height: defaultPadding),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const Icon(Icons.private_connectivity),
                    title: MultiSelectDialogField(
                        initialValue: const [],
                        searchable: true,
                        items: _itemsAnonType,
                        title: const Text('Anonymization Type'),
                        buttonText: const Text('Select Anonymization type:',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        onConfirm: (results) => _selectedAnonType = results,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Campo obrigatório'
                            : null),
                  ),
                  Container(height: defaultPadding),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const Icon(Icons.timer_outlined),
                    title: MultiSelectDialogField(
                        initialValue: const [],
                        searchable: true,
                        items: _itemsTimeWindow,
                        title: const Text('Time Window '),
                        buttonText: const Text('Select Time Windows:',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        onConfirm: (results) => _selectedTimeWindow = results,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Campo obrigatório'
                            : null),
                  ),
                  /* ListTile(
                    leading: const Icon(Icons.abc_rounded),
                    contentPadding: EdgeInsets.zero,
                    title: TextFormField(
                      initialValue: "_contactModel.site",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny('@'),
                      ],
                      onChanged: (value) {
                        //_contactModel.site = value;
                      },
                      keyboardType: TextInputType.url,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Site',
                          hintText: "Ex: www.achafacil.com.br",
                          helperText: 'Opcional'),
                    ),
                  ), */
                  Container(height: defaultPadding),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      child: _progressBarActive == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : const Text('Evaluate'),
                      onPressed: process,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void process() async {
    if (_form.currentState!.validate()) {
      setState(() {
        _progressBarActive = true;
      });

      List<FlowType> flow = _selectedFlowType.cast<FlowType>();
      List<GeographicLocation> geo =
          _selectedGeographic.cast<GeographicLocation>();
      List<AnonymizationType> anon =
          _selectedAnonType.cast<AnonymizationType>();
      List<TimeWindow> timeWindow = _selectedTimeWindow.cast<TimeWindow>();

      flow.forEach((element) {
        print(element.flowType + ' - ' + element.value.toString());
      });

      geo.forEach((element) {
        print(element.geographicLocation + ' - ' + element.value.toString());
      });

      anon.forEach((element) {
        print(element.anonType + ' - ' + element.value.toString());
      });

      timeWindow.forEach((element) {
        print(element.timeWindow + ' - ' + element.value.toString());
      });
    }
  }
}
