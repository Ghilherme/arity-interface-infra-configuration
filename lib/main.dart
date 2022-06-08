import 'package:arity/anonymization_type.dart';
import 'package:arity/flow_type.dart';
import 'package:arity/geographic_location.dart';
import 'package:arity/time_window.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Arity Evaluation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Arity Evaluation Criteria'),
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

  double _gpsPointsMonthly = 0;
  double _gpsPointsSecond = 0;

  int _dropDownKafkaBrokers = numberBrokers[0];
  String _dropDownkafkaEc2 = ec2Type[0];
  String _dropDownkafkaEbsType = ebsType[0];
  String _dropDownKafkatotalEBSStorage = totalEBSStorage[0];
  String _slaInfraKafka = slaInfra[0];

  int _dropDownFlinkBrokers = numberBrokers[0];
  String _dropDownFlinkEc2 = ec2Type[0];
  String _dropDownFlinkEbsType = ebsType[0];
  String _dropDownFlinktotalEBSStorage = totalEBSStorage[0];
  String _slaInfraFlink = slaInfra[0];

  int _dropDownNifiBrokers = 0;
  String _dropDownNifikEc2 = '';
  String _dropDownNifiEbsType = '';
  String _dropDownNifitotalEBSStorage = '';
  String _slaInfraNifi = slaInfra[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 600),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _form,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Container(height: 30),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Business Requirements',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      height: defaultPadding,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: const Icon(Icons.list),
                      title: MultiSelectDialogField(
                          initialValue: const [],
                          searchable: true,
                          items: _itemsFlowType,
                          title: const Text('Flow Type'),
                          buttonText: const Text('Select Flow Type:',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          onConfirm: (results) {
                            _selectedFlowType = results;
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Required'
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          onConfirm: (results) => _selectedGeographic = results,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Required'
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          onConfirm: (results) => _selectedAnonType = results,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Required'
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          onConfirm: (results) => _selectedTimeWindow = results,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Required'
                              : null),
                    ),
                    Container(height: defaultPadding),
                    const Divider(
                      height: defaultPadding,
                    ),
                    Container(height: defaultPadding),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Approximate Volume',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(height: defaultPadding),
                    ListTile(
                      leading: const Icon(Icons.gps_not_fixed),
                      contentPadding: EdgeInsets.zero,
                      title: TextFormField(
                        key: Key(_gpsPointsMonthly.toString()),
                        initialValue:
                            formatAmount(_gpsPointsMonthly.toStringAsFixed(0)),
                        enabled: false,
                        maxLines: 1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'GPS points/monthly'),
                      ),
                    ),
                    Container(height: defaultPadding),
                    ListTile(
                      leading: const Icon(Icons.gps_not_fixed),
                      contentPadding: EdgeInsets.zero,
                      title: TextFormField(
                        key: Key(_gpsPointsSecond.toString()),
                        initialValue:
                            formatAmount(_gpsPointsSecond.toStringAsFixed(0)),
                        enabled: false,
                        maxLines: 1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            labelText: 'GPS points/second'),
                      ),
                    ),
                    Container(height: defaultPadding),
                    const Divider(
                      height: defaultPadding,
                    ),
                    Container(height: defaultPadding),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Recommended configuration',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(height: 30),
                    kafkaBuildRecommended(context),
                    Container(height: 30),
                    flinkBuildRecommended(context),
                    Container(height: 30),
                    nifiBuildRecommended(context),
                    Container(height: 30),
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: ElevatedButton(
                        child: const Text('Evaluate'),
                        onPressed: process,
                      ),
                    ),
                    Container(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  ListTile kafkaBuildRecommended(BuildContext context) {
    return ListTile(
      leading: Text(
        'Kafka          ',
        style: Theme.of(context).textTheme.headline5,
      ),
      title: Center(
        child: Column(
          children: [
            const Text(
              'Number of Brokers',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<int>(
              isExpanded: true,
              hint: Text('Number of Brokers'),
              value: _dropDownKafkaBrokers,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (int? newValue) {
                setState(() {
                  _dropDownKafkaBrokers = newValue ?? _dropDownKafkaBrokers;
                });
              },
              items: numberBrokers.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            const Text(
              'EC2 Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('EC2 type'),
              value: _dropDownkafkaEc2,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownkafkaEc2 = newValue ?? _dropDownkafkaEc2;
                });
              },
              items: ec2Type.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'EBS Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('EBS type'),
              value: _dropDownkafkaEbsType,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownkafkaEbsType = newValue ?? _dropDownkafkaEbsType;
                });
              },
              items: ebsType.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'Total EBS Storage',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Total EBS Storage'),
              value: _dropDownKafkatotalEBSStorage,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownKafkatotalEBSStorage =
                      newValue ?? _dropDownKafkatotalEBSStorage;
                });
              },
              items:
                  totalEBSStorage.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'SLA Infrastructure',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text(_slaInfraKafka),
              value: _slaInfraKafka,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              items: [],
              onChanged: (String? newValue) {},
            ),
          ],
        ),
      ),
    );
  }

  ListTile flinkBuildRecommended(BuildContext context) {
    return ListTile(
      leading: Text(
        'Flink           ',
        style: Theme.of(context).textTheme.headline5,
      ),
      title: Center(
        child: Column(
          children: [
            const Text(
              'Number of Brokers',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<int>(
              isExpanded: true,
              hint: Text('Flink Brokers'),
              value: _dropDownFlinkBrokers,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (int? newValue) {
                setState(() {
                  _dropDownFlinkBrokers = newValue ?? _dropDownFlinkBrokers;
                });
              },
              items: numberBrokers.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            const Text(
              'EC2 Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('EC2 type'),
              value: _dropDownFlinkEc2,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownFlinkEc2 = newValue ?? _dropDownFlinkEc2;
                });
              },
              items: ec2Type.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'EBS Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('EBS type'),
              value: _dropDownFlinkEbsType,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownFlinkEbsType = newValue ?? _dropDownFlinkEbsType;
                });
              },
              items: ebsType.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'Total EBS Storage',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Total EBS Storage'),
              value: _dropDownFlinktotalEBSStorage,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownFlinktotalEBSStorage =
                      newValue ?? _dropDownFlinktotalEBSStorage;
                });
              },
              items:
                  totalEBSStorage.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'SLA Infrastructure',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text(_slaInfraFlink),
              value: _slaInfraFlink,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              items: [],
              onChanged: (String? newValue) {},
            ),
          ],
        ),
      ),
    );
  }

  ListTile nifiBuildRecommended(BuildContext context) {
    return ListTile(
      leading: Text(
        'Nifi             ',
        style: Theme.of(context).textTheme.headline5,
      ),
      title: Center(
        child: Column(
          children: [
            const Text(
              'Number of Brokers',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<int>(
              isExpanded: true,
              hint: Text('Number of Brokers'),
              value: _dropDownNifiBrokers,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (int? newValue) {
                setState(() {
                  _dropDownNifiBrokers = newValue ?? _dropDownNifiBrokers;
                });
              },
              items: numberBrokers.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            const Text(
              'EC2 Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('EC2 type'),
              value: _dropDownNifikEc2,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownNifikEc2 = newValue ?? _dropDownNifikEc2;
                });
              },
              items: ec2Type.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'EBS Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('EBS type'),
              value: _dropDownNifiEbsType,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownNifiEbsType = newValue ?? _dropDownNifiEbsType;
                });
              },
              items: ebsType.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'Total EBS Storage',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Total EBS Storage'),
              value: _dropDownNifitotalEBSStorage,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownNifitotalEBSStorage =
                      newValue ?? _dropDownNifitotalEBSStorage;
                });
              },
              items:
                  totalEBSStorage.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'SLA Infrastructure',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text(_slaInfraNifi),
              value: _slaInfraNifi,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              items: [],
              onChanged: (String? newValue) {},
            ),
          ],
        ),
      ),
    );
  }

  void process() {
    if (_form.currentState!.validate()) {
      List<FlowType> flow = _selectedFlowType.cast<FlowType>();
      List<GeographicLocation> geo =
          _selectedGeographic.cast<GeographicLocation>();
      List<AnonymizationType> anon =
          _selectedAnonType.cast<AnonymizationType>();
      List<TimeWindow> timeWindow = _selectedTimeWindow.cast<TimeWindow>();

      int flowTotalScore = 0;
      int geoTotalScore = 0;
      int anonTotalScore = 0;
      int timeWindowTotalScore = 0;
      int maxScorePossible = _getMaxScore();

      print('maxScorePossible ' + maxScorePossible.toString());

      flow.forEach((element) {
        print(element.flowType + ' - ' + element.value.toString());
        flowTotalScore += element.value;
      });

      geo.forEach((element) {
        print(element.geographicLocation + ' - ' + element.value.toString());
        geoTotalScore += element.value;
      });

      anon.forEach((element) {
        print(element.anonType + ' - ' + element.value.toString());
        anonTotalScore += element.value;
      });

      timeWindow.forEach((element) {
        print(element.timeWindow + ' - ' + element.value.toString());
        timeWindowTotalScore += element.value;
      });

      print('flowTotalScore ' + flowTotalScore.toString());
      print('geoTotalScore ' + geoTotalScore.toString());
      print('anonTotalScore ' + anonTotalScore.toString());
      print('timeWindowTotalScore ' + timeWindowTotalScore.toString());
      int totalScores = flowTotalScore +
          geoTotalScore +
          anonTotalScore +
          timeWindowTotalScore;
      double gpsPerScorePoint = maxGPSPoints / maxScorePossible;
      print('1 score point =  ' + gpsPerScorePoint.toString());
      print('total ' + totalScores.toString());

      //Small
      if (totalScores <= 80) {
        setState(() {
          _dropDownKafkaBrokers = numberBrokers[1];
          _dropDownkafkaEc2 = ec2Type[1];
          _dropDownkafkaEbsType = ebsType[1];
          _dropDownKafkatotalEBSStorage = totalEBSStorage[1];
          _slaInfraKafka = slaInfra[1];

          _dropDownFlinkBrokers = numberBrokers[1];
          _dropDownFlinkEc2 = ec2Type[1];
          _dropDownFlinkEbsType = ebsType[1];
          _dropDownFlinktotalEBSStorage = totalEBSStorage[1];
          _slaInfraFlink = slaInfra[1];

          _dropDownNifiBrokers = numberBrokers[1];
          _dropDownNifikEc2 = ec2Type[1];
          _dropDownNifiEbsType = ebsType[1];
          _dropDownNifitotalEBSStorage = totalEBSStorage[1];
          _slaInfraNifi = slaInfra[1];
        });
      }

      //MEDIUM
      if (totalScores >= 81 && totalScores <= 250) {
        setState(() {
          _dropDownKafkaBrokers = numberBrokers[2];
          _dropDownkafkaEc2 = ec2Type[2];
          _dropDownkafkaEbsType = ebsType[2];
          _dropDownKafkatotalEBSStorage = totalEBSStorage[2];
          _slaInfraKafka = slaInfra[1];

          _dropDownFlinkBrokers = numberBrokers[2];
          _dropDownFlinkEc2 = ec2Type[2];
          _dropDownFlinkEbsType = ebsType[2];
          _dropDownFlinktotalEBSStorage = totalEBSStorage[2];
          _slaInfraFlink = slaInfra[1];

          _dropDownNifiBrokers = numberBrokers[2];
          _dropDownNifikEc2 = ec2Type[2];
          _dropDownNifiEbsType = ebsType[2];
          _dropDownNifitotalEBSStorage = totalEBSStorage[2];
          _slaInfraNifi = slaInfra[1];
        });
      }

      //LARGE
      if (totalScores >= 251) {
        setState(() {
          _dropDownKafkaBrokers = numberBrokers[3];
          _dropDownkafkaEc2 = ec2Type[3];
          _dropDownkafkaEbsType = ebsType[3];
          _dropDownKafkatotalEBSStorage = totalEBSStorage[2];
          _slaInfraKafka = slaInfra[2];

          _dropDownFlinkBrokers = numberBrokers[3];
          _dropDownFlinkEc2 = ec2Type[3];
          _dropDownFlinkEbsType = ebsType[3];
          _dropDownFlinktotalEBSStorage = totalEBSStorage[2];
          _slaInfraFlink = slaInfra[2];

          _dropDownNifiBrokers = numberBrokers[3];
          _dropDownNifikEc2 = ec2Type[3];
          _dropDownNifiEbsType = ebsType[3];
          _dropDownNifitotalEBSStorage = totalEBSStorage[2];
          _slaInfraNifi = slaInfra[2];
        });
      }

      setState(() {
        _gpsPointsMonthly = gpsPerScorePoint * totalScores;
        _gpsPointsSecond = (_gpsPointsMonthly / 30) / 86400;
      });
      print('_gpsPointsMonthly ' + _gpsPointsMonthly.toString());
      print('_gpsPointsSecond =  ' + _gpsPointsSecond.toString());
    }
  }

  String formatAmount(String number) {
    String price = number;
    String priceInText = "";
    int counter = 0;
    for (int i = (price.length - 1); i >= 0; i--) {
      counter++;
      String str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = "$str$priceInText";
      } else if (i == 0) {
        priceInText = "$str$priceInText";
      } else {
        priceInText = ",$str$priceInText";
      }
    }
    return priceInText.trim();
  }

  int _getMaxScore() {
    int flowTotalScore = 0;
    int geoTotalScore = 0;
    int anonTotalScore = 0;
    int timeWindowTotalScore = 0;

    flowType.forEach((element) {
      flowTotalScore += element.value;
    });

    geographicLocation.forEach((element) {
      geoTotalScore += element.value;
    });

    anonymizationType.forEach((element) {
      anonTotalScore += element.value;
    });

    timeWindow.forEach((element) {
      timeWindowTotalScore += element.value;
    });

    return flowTotalScore +
        geoTotalScore +
        anonTotalScore +
        timeWindowTotalScore;
  }
}
