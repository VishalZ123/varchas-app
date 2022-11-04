import 'package:varchas_app/screens/choose_sport.dart';
import 'package:varchas_app/screens/schedule_screen.dart';

final sportsChoices = {
  '1': 'Athletics',
  '2': 'Badminton',
  '3': 'Basketball',
  '4': 'Chess',
  '5': 'Cricket',
  '6': 'Football',
  '7': 'Table Tenis',
  '8': 'Tenis',
  '9': 'Volleyball',
  // '10': 'Badminton-Mixed doubles',
  '10': 'Kabaddi',
  // '12': 'Squash',
  // '13': 'Weightlifting',
};
final locations = {
  'IITJ Football Ground': [26.475500241368298, 73.12012050554168],
  'Volleyball Ground': [26.47731349752093, 73.12134341175553],
  'Tennis Ground': [26.477008885433506, 73.12117409853494],
  'Indoor sports Complex': [26.47681999463718, 73.11939962588451],
  'Lecture Hall Complex': [26.47312321493185, 73.11406019139604],
  'Spartan Cricket Ground': [],
  'Pathan Cricket Academy': [],
  'VIRU Cricket Academy': [],
  'L S Sankhla Sports Academy': [26.31901835293305, 73.0823644165303],
};
final dates = ["2022-11-04", "2022-11-05", "2022-11-06"];
final sportsList = [
  'Athletics',
  'Badminton',
  'Basketball',
  'Chess',
  'Cricket',
  'Football',
  'Kabaddi',
  // 'Weightlifting',
  'Table Tennis',
  'Tennis',
  'Volleyball',
  // 'Badminton-Mixed doubles',
  // 'Squash',
];
final sportUrlExceptions = {
  'Basketball': 'basketball-player',
  // 'Volleyball': 'vb',
  'Cricket': 'cricket-inverted',
  'Kabaddi': 'kabaddi-inverted',
  // 'Weightlifting': 'weightlifting-inverted',
  'Table Tennis': 'table-tennis',
  // 'Badminton-Mixed doubles': 'badminton'
};
final unLoggedInScreens = {
  'Schedule': const ScheduleScreen(),
  'Leaderboard': const ChooseSportScreen()
};
final loggedInScreens = {
  'Schedule': ScheduleScreen,
  'My Schedule': ScheduleScreen,
  'Leaderboard': ChooseSportScreen
};
