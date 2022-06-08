import 'package:arity/anonymization_type.dart';
import 'package:arity/geographic_location.dart';
import 'package:arity/time_window.dart';
import 'flow_type.dart';

const defaultPadding = 20.0;

double maxGPSPoints = 155000000000;

List<FlowType> flowType = <FlowType>[
  FlowType(flowType: 'Mobile', value: 30),
  FlowType(flowType: 'Device', value: 1)
];

List<GeographicLocation> geographicLocation = <GeographicLocation>[
  GeographicLocation(geographicLocation: 'USA', value: 100),
  GeographicLocation(geographicLocation: 'California', value: 10),
  GeographicLocation(geographicLocation: 'Texas', value: 8),
  GeographicLocation(geographicLocation: 'Florida', value: 7),
  GeographicLocation(geographicLocation: 'New York', value: 7),
  GeographicLocation(geographicLocation: 'Michigan', value: 5),
  GeographicLocation(geographicLocation: 'Pennsylvania', value: 5),
  GeographicLocation(geographicLocation: 'Illinois', value: 5),
  GeographicLocation(geographicLocation: 'Ohio', value: 4),
  GeographicLocation(geographicLocation: 'Georgia', value: 3),
  GeographicLocation(geographicLocation: 'North Carolina', value: 3),
  GeographicLocation(geographicLocation: 'New Jersey', value: 2),
  GeographicLocation(geographicLocation: 'Virginia', value: 2),
  GeographicLocation(geographicLocation: 'Washington', value: 1),
  GeographicLocation(geographicLocation: 'Arizona', value: 1),
  GeographicLocation(geographicLocation: 'Massachusetts', value: 1),
  GeographicLocation(geographicLocation: 'Tennessee', value: 1),
  GeographicLocation(geographicLocation: 'Indiana', value: 1),
  GeographicLocation(geographicLocation: 'Maryland', value: 1),
  GeographicLocation(geographicLocation: 'Missouri', value: 1),
  GeographicLocation(geographicLocation: 'Wisconsin', value: 1),
  GeographicLocation(geographicLocation: 'Colorado', value: 1),
  GeographicLocation(geographicLocation: 'Minnesota', value: 1),
  GeographicLocation(geographicLocation: 'South Carolina', value: 1),
  GeographicLocation(geographicLocation: 'Alabama', value: 1),
  GeographicLocation(geographicLocation: 'Louisiana', value: 1),
  GeographicLocation(geographicLocation: 'Kentucky', value: 1),
  GeographicLocation(geographicLocation: 'Oregon', value: 1),
  GeographicLocation(geographicLocation: 'Oklahoma', value: 1),
  GeographicLocation(geographicLocation: 'Connecticut', value: 1),
  GeographicLocation(
      geographicLocation: 'Puerto Rico (International)', value: 1),
  GeographicLocation(geographicLocation: 'Utah', value: 1),
  GeographicLocation(geographicLocation: 'Iowa', value: 1),
  GeographicLocation(geographicLocation: 'Nevada', value: 1),
  GeographicLocation(geographicLocation: 'Arkansas', value: 1),
  GeographicLocation(geographicLocation: 'Mississipi', value: 1),
  GeographicLocation(geographicLocation: 'Kansas', value: 1),
  GeographicLocation(geographicLocation: 'New Mexico', value: 1),
  GeographicLocation(geographicLocation: 'Nebraska', value: 1),
  GeographicLocation(geographicLocation: 'Idaho', value: 1),
  GeographicLocation(geographicLocation: 'West Virginia', value: 1),
  GeographicLocation(geographicLocation: 'Hawaii', value: 1),
  GeographicLocation(geographicLocation: 'New Hampshire', value: 1),
  GeographicLocation(geographicLocation: 'Maine', value: 1),
  GeographicLocation(geographicLocation: 'Rhode Island', value: 1),
  GeographicLocation(geographicLocation: 'Montana', value: 1),
  GeographicLocation(geographicLocation: 'Delaware', value: 1),
  GeographicLocation(geographicLocation: 'South Dakota', value: 1),
  GeographicLocation(geographicLocation: 'North Dakota', value: 1),
  GeographicLocation(geographicLocation: 'Alaska', value: 1),
  GeographicLocation(geographicLocation: 'District of Columbia', value: 1),
  GeographicLocation(geographicLocation: 'Vermont', value: 1),
  GeographicLocation(geographicLocation: 'Wyoming', value: 1),
  GeographicLocation(geographicLocation: 'Guam', value: 1),
  GeographicLocation(geographicLocation: 'US Virgin Islands', value: 1),
  GeographicLocation(geographicLocation: 'American Samoa', value: 1),
  GeographicLocation(geographicLocation: 'Norther Mariana Islands', value: 1),
  GeographicLocation(geographicLocation: 'Canada', value: 1),
  GeographicLocation(geographicLocation: 'Mexico', value: 1),
];

List<AnonymizationType> anonymizationType = <AnonymizationType>[
  AnonymizationType(anonType: '1.0', value: 1),
  AnonymizationType(anonType: '1.1', value: 1),
  AnonymizationType(anonType: '2.0', value: 1),
  AnonymizationType(anonType: 'New anonymization', value: 10),
];

List<TimeWindow> timeWindow = <TimeWindow>[
  TimeWindow(timeWindow: '00:00-01:00', value: 2),
  TimeWindow(timeWindow: '01:00-02:00', value: 1),
  TimeWindow(timeWindow: '02:00-03:00', value: 1),
  TimeWindow(timeWindow: '03:00-04:00', value: 1),
  TimeWindow(timeWindow: '04:00-05:00', value: 3),
  TimeWindow(timeWindow: '05:00-06:00', value: 5),
  TimeWindow(timeWindow: '06:00-07:00', value: 6),
  TimeWindow(timeWindow: '07:00-08:00', value: 7),
  TimeWindow(timeWindow: '08:00-09:00', value: 8),
  TimeWindow(timeWindow: '09:00-10:00', value: 9),
  TimeWindow(timeWindow: '10:00-11:00', value: 6),
  TimeWindow(timeWindow: '11:00-12:00', value: 6),
  TimeWindow(timeWindow: '12:00-13:00', value: 7),
  TimeWindow(timeWindow: '13:00-14:00', value: 7),
  TimeWindow(timeWindow: '14:00-15:00', value: 8),
  TimeWindow(timeWindow: '15:00-16:00', value: 8),
  TimeWindow(timeWindow: '16:00-17:00', value: 10),
  TimeWindow(timeWindow: '17:00-18:00', value: 10),
  TimeWindow(timeWindow: '18:00-19:00', value: 8),
  TimeWindow(timeWindow: '19:00-20:00', value: 8),
  TimeWindow(timeWindow: '20:00-21:00', value: 7),
  TimeWindow(timeWindow: '21:00-22:00', value: 5),
  TimeWindow(timeWindow: '22:00-23:00', value: 4),
  TimeWindow(timeWindow: '23:00-00:00', value: 3),
];

const List<int> numberBrokers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

const List<String> ec2Type = [
  '',
  'ec2 small',
  'ec2 medium',
  'ec2 large',
  'r5n.2xlarge',
  'c5.9xlarge'
];

const List<String> ebsType = [
  '',
  'EBS small',
  'EBS medium',
  'EBS large',
  'gp3',
];
const List<String> totalEBSStorage = ['', '50gb per node', '100 gb per node'];
const List<String> slaInfra = [
  '',
  'Use already existing cluster',
  'Require new cluster'
];
