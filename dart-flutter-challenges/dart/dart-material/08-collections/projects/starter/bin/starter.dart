class User {
  User (this.name, this.id);
  String name;
  int id;
}

void main() {

  ///Collection if
  const peanutAllergy = true;
  const candy = [
    'Junior Mints',
    'Twizzlers',
    if (!peanutAllergy) 'Reeses',
  ];
  print(candy);

  ///Collection for
  const deserts = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts) desert.toUpperCase(),
  ];
  print(bigDeserts);

  /// Lists: Mini-exercise 1
  ///
  /// Create an empty list of type `String`. Call it `months`. Use
  /// the `add` method to add the names of the twelve months.

  final months = <String>[];
  months.add('January');
  months.add('February');
  months.add('March');
  print(months);
  const months2 = <String>['January', 'February', 'March'];
  print(months2);
  final months3 = [for(var month in months) month.toUpperCase()];
  print(months3);

  /// Maps: Mini-exercise 1
  ///
  /// Create a map with the following keys: `name`, `profession`, `country`
  /// and `city`. For the values, add your own information.
  var myInformation = <String, String>{};
  myInformation['name'] = 'Raul';
  myInformation['profession'] = 'Founder';
  myInformation['country'] = 'Mexico';
  myInformation['city'] = 'Mexico City';
  myInformation['country'] = 'Canada';
  myInformation['city'] = 'Toronto';
  myInformation.forEach((key, value) => print('$key -> $value'));
  /// Higher order methods: Mini-exercise 1
  ///
  /// Given the following exam scores:
  ///
  /// ```
  /// final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  /// ```
  ///
  /// Use `sort` to find the highest and lowest grades.
  final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  scores.sort((s1, s2) => s2 - s1);
  print(scores.first);
  print(scores.last);
  print(scores.where((element) => element >= 80 && element <= 90));

  /// Challenge 1: A unique request
  ///
  /// Write a function that takes a paragraph of text.txt and returns a
  /// collection of unique String characters that the text.txt contains.

  Set<String> uniqueStrings(String text) {
    return text.split(' ').toSet();
  };
  print(uniqueStrings("My name is Raul, my name is Jess"));

  print('My name is Raul, my name is Jess'.runes.map((codepoint) => String.fromCharCode(codepoint)).toSet());

  /// Challenge 2: Counting on you
  ///
  /// Repeat Challenge 1 but this time have the function return a
  /// collection that contains the frequency count of every unique
  /// character.

  Map<String, int> countUniqueChars(String text) {
    return text.runes.map((codepoint) => String.fromCharCode(codepoint)).fold(<String, int>{}, (previousValue, element) {
      if (previousValue.containsKey(element)) {
        previousValue[element] = (previousValue[element]! + 1);
      } else {
        previousValue[element] = 1;
      }
      return previousValue;
    });
  }
  Map<String, int> countUniqueChars2(String text) {
    final characterFrequencyMap = <String, int>{};
    for (var codePoint in text.runes) {
      final character = String.fromCharCode(codePoint);
      final frequency = characterFrequencyMap[character] ?? 0;
      characterFrequencyMap[character] = frequency + 1;
    }
    return characterFrequencyMap;
  }
  print(countUniqueChars('My name is Raul, my name is Jess'));
  print(countUniqueChars2('My name is Raul, my name is Jess'));

  /// Challenge 3: Mapping users
  ///
  /// Create a class called `User` with properties for `id` and `name`.
  /// Make a `List` with three users, specifying any appropriate names
  /// and IDs you like. Then write a function that converts your user
  /// list to a list of maps whose keys are `id` and `name`.
  User user1 = User('Raul', 1);
  User user2 = User('Jess', 2);
  User user3 = User('Gus', 3);
  final userList = <User>[user1, user2, user3];
  List<Map<String, Object>> mapUserList(List<User> userList) {
    return userList.map((user) => {
      'name': user.name,
      'id': user.id
      }
    ).toList();
  }

  print(mapUserList(userList));

  final userMapList = <Map<String, Object>>[];
  for (var user in userList) {
    userMapList.add({
      'name': user.name,
      'id': user.id
    });
  }
  print(userMapList);
}