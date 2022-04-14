void main() {
  /// Adding optional parameters to a function

  String fullName(String first, String last, [String? title]) {
    if (title != null) {
      return '$title $first $last';
    }
    return '$first $last';
  }

  print(fullName('Raul', 'Alonzo', 'Mr.'));
  print(fullName('Raul', 'Alonzo'));

  /// Adding default parameters to a function

  bool withinTolerance(int value, [int min = 0, int max = 10]) {
    return min <= value && value <= max;
  }

  print(withinTolerance(8));
  print(withinTolerance(20, 15, 19));

  /// Adding default optional named parameters to a function
  bool withinTolerance2(int value, {int min = 0, int max = 10}) {
    return min <= value && value <= max;
  }

  print(withinTolerance2(8));
  print(withinTolerance2(20, min: 15, max: 19));
  print(withinTolerance2(20, max: 19, min: 15)); // Arguments can have a different order from how they are as parameters
  print(withinTolerance2(20, max: 19)); //Calling whatever named default parameter is valid

  /// Adding default required and optional named parameters to a function
  bool withinTolerance3({
    required int value,
    int min = 0,
    int max = 10
  }) {
    return min <= value && value <= max;
  }
  print(withinTolerance3(value: 8));
  print(withinTolerance3(value: 20, min: 15, max: 19));
  print(withinTolerance3(value: 20, max: 19, min: 15)); // Arguments can have a different order from how they are as parameters
  print(withinTolerance3(value: 17, max: 19)); //Calling whatever named default parameter is valid

  /// Function basics: Mini-exercise 1
  ///
  /// Write a function named `youAreWonderful` with a String parameter
  /// called `name`. It returns a string using `name`, something like
  /// "You're wonderful, Bob."
  String youAreWonderful(String name) {
    return 'You are wonderful $name';
  };

  /// Using anonymous functions
  final multiply = (int a, int b) {
    return a * b;
  };
  print(multiply(2,3));

  /// Returning an anonymous function (lazyload)
  Function applyMultiplier(num multiplier) {
    return (num value) {
      return value * multiplier;
    };
  };

  final triple = applyMultiplier(3);
  print(triple(6));
  print(triple(14.0));

  /// Anonymous functions: Mini-exercise 2
  ///
  /// Using `forEach()`, print a message telling the people in the following
  /// list that they're wonderful.
  ///
  /// ```
  /// const people = ['Chris', 'Tiffani', 'Pablo'];
  /// ```
  ///
  /// Change the `youAreWonderful()` function in the first mini-exercise
  /// of this chapter into an anonymous function. Assign it to a variable
  /// called `wonderful`.
  Function youAreWonderful2(String name) {
    final wonderful = () {
      return 'You are wonderful $name';
    };
    return wonderful;
  };

  const people = ['Chris', 'Tiffani', 'Pablo'];

  people.forEach((element) {
    final wonderful = youAreWonderful2(element);
    print(wonderful());
  });

  /// Arrow functions: Mini-exercise 1
  ///
  /// Change the `forEach()` loop in the previous "You're wonderful"
  /// mini-exercise to use arrow syntax.
  people.forEach((element) => print(youAreWonderful2(element)()));

  /// Challenge 2: Can you repeat that?
  ///
  /// Write a function named `repeatTask` that looks like this:
  ///
  /// ```
  /// int repeatTask(int times, int input, Function task)
  /// ```
  ///
  /// It repeats a given `task` on `input` for `times` number of times.
  ///
  /// Pass an anonymous function to `repeatTask` to square the input
  /// of 2 four times. Confirm that you get the result 65536, since
  /// 2 squared is 4,
  /// 4 squared is 16,
  /// 16 squared is 256, and
  /// 256 squared is 65536.

  int repeatTask(Function task, {int times = 1, int input = 4}) {
    int square = task(input);
    for (var i = 1; i < times; i++) {
      print(i);
      square = task(square);
    }
    return square;
  }

  final task = repeatTask((inp) => inp * inp, times: 4, input: 2);
  print(task);
}
