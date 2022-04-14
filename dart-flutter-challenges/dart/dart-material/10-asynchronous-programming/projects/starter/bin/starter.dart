import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:isolate';
import 'package:http/http.dart' as http;


Future<void> main() async{
  ///First example for handling Dart Futures (Promises)
  final myFuture = Future<int>.delayed(
      Duration(seconds: 1),
          () => 42
  )
  .then(
      (value) => print('Value: $value')
  )
  .catchError(
      (error) => print('Error: $error')
  )
  .whenComplete(
          () => print('Future is complete')
  );
  print(myFuture);
  print('After the future');

  /////////////////////////////////////////////////

  print('Before the future');
  final value = await Future<int>.delayed(
    Duration(seconds: 1),
        () => 42,
  );
  print('Value: $value');
  print('After the future');

  ////////////////////////////////////////////////

  print('Before the future');
  try {
    final value = await Future<int>.delayed(
      Duration(seconds: 1),
          () => 42,
    );
    throw Exception('There was an error');
    print('Value $value');
  } catch (error) {
    print(error);
  } finally {
    print('Future is complete');
  }
  print('After the future');

  ////////////////////////////////////////////////
  ///Http real GET method
  try {
    final url = 'https://jsonplaceholder.typicode.com/todos/1';
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final rawJsonString = response.body;
      final jsonMap = jsonDecode(rawJsonString);
      final todo = Todo.fromJson(jsonMap);
      print(todo);
    } else {
      throw HttpException('$statusCode');
    }
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }

  ///////////////////////////////////////////////
  ///Mini-excercise 1
  try {
    final message = await Future<String>.delayed(
        Duration(seconds: 2),
            () => 'I am from the future'
    );
    // throw Exception('There was an error');
    print('Message: $message');
  } catch (error) {
    print(error);
  }

  Directory current = Directory.current;
  print(current);

  ///Handling Streams
  ///File Stream reading whole file
  final file = File('assets/text.txt');
  final contents = await file.readAsString();
  print(contents);

  ///File Stream reading file as chunks
  final long_file = File('assets/text_long.txt');
  final stream = long_file.openRead();
  stream.listen((data) {
    print(data.length);
  });
  ///File stream using for loops
  final for_file = File('assets/text_long.txt');
  final for_stream = for_file.openRead();
  await for (var data in for_stream) {
    print(data.length);
  }

  ///Handling file stream errors with callback
  final callback_file = File('assets/text_long.txt');
  final callback_stream = callback_file.openRead();
  callback_stream.listen((data) {
    print(data.length);
  },
  onError: (error) {
    print(error);
  },
  onDone: () {
    print('All finished');
  });

  ///Handling file stream errors with try-catch
  try {
    final try_file = File('assets/text_long.txt');
    final try_stream = try_file.openRead();
    await for (var data in try_stream) {
      print(data.length);
    }
  } on Exception catch (error) {
    print(error);
  } finally {
    print('All finished');
  }

  ///File streaming with cancel
  final cancel_file = File('assets/text_long.txt');
  final cancel_stream = cancel_file.openRead();
  StreamSubscription<List<int>>? subscription;
  subscription = cancel_stream.listen(
  (data) {
    print(data.length);
    subscription?.cancel();
  },
    cancelOnError: true,
    onDone: () {
    print('All finished');
    }
  );

  ///Transforming a stream
  final transform_file = File('assets/text.txt');
  final transform_stream = transform_file.openRead();
  transform_stream.listen(
      (data) {
        print(data);
      }
  );

  final decode_file = File('assets/text.txt');
  final decode_stream = decode_file.openRead();
  await for (var data in decode_stream.transform(utf8.decoder)) {
    print(data);
  }

  ///Mini-excercise 2
  Stream myStream = Stream<int>.periodic(
    Duration(seconds: 1),
      (value) => value,
  ).take(1);

  await for (var val in myStream) {
    print(val);
  }

  ///App stopping synchronous code
  // String playHideAndSeekTheLongVersion() {
  //   var counting  = 0;
  //   for (var i = 1; i <= 10000000000; i++) {
  //     counting += i;
  //   }
  //   return '$counting! Ready or not, here I come!';
  // }

  // print('OK, I\'m counting...');
  // print(playHideAndSeekTheLongVersion());

  ///App stopping asynchronous code
  Future<String> playHideAndSeekTheLongVersion2() async{
    var counting  = 0;
    await Future(() {
      for (var i = 1; i <= 1000000000; i++) {
        counting +=i;
      }
    });
    return '$counting! Ready or not, here I come!';
  }
  print('OK, I\'m counting...');
  print(await playHideAndSeekTheLongVersion2());

  ///Using a new isolate with a send port
  void playHideAndSeekTheLongVersionSendPort(SendPort sendPort) {
    var counting = 0;
    for (var i = 1; i <= 1000000000; i++) {
      counting += i;
    }
    sendPort.send('$counting! Ready or not, here I come!');
  }
  ///Spawning the isolate and listening for the message
  // final receivePort = ReceivePort();
  // final isolate = await Isolate.spawn( playHideAndSeekTheLongVersionSendPort, receivePort.sendPort);
  // receivePort.listen((message) {
  //   print(message);
  //   receivePort.close();
  //   isolate.kill();
  // });

  /// Challenge 1:
  ///
  /// This is a fun one and will test how well you understand how Dart handles
  /// asynchronous tasks. In what order will Dart print the text.txt with the
  /// following `print` statements? Why?
  print('1 synchronous'); //1
  Future(() => print('2 event queue')).then(//5
        (value) => print('3 synchronous'),//6
  );
  Future.microtask(() => print('4 microtask queue')); //3
  Future.microtask(() => print('5 microtask queue')); //4
  Future.delayed(
    Duration(seconds: 1),
        () => print('6 event queue'), //11
  );
  Future(() => print('7 event queue')).then( //7
        (value) => Future(() => print('8 event queue')),//10
  );
  Future(() => print('9 event queue')).then(//8
        (value) => Future.microtask(
          () => print('10 microtask queue'),//9
    ),
  );
  print('11 synchronous'); //2

  /// Challenge 2: Care to make a comment?
  ///
  /// The following link returns a JSON list of comments:
  ///
  /// https://jsonplaceholder.typicode.com/comments
  ///
  /// Create a `Comment` data class and convert the raw JSON to a Dart list of
  /// type `List<Comment>`.
  try {
    final url = 'https://jsonplaceholder.typicode.com/comments';
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final commentList = <Comment>[];
      final rawJsonString = response.body;
      final jsonList = jsonDecode(rawJsonString);
      for (var element in jsonList) {
        final comment = Comment.fromJson(element);
        commentList.add(comment);
      }
      // print(commentList);
    } else {
      throw HttpException('$statusCode');
    }
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }

  /// Challenge 3: Data stream
  ///
  /// The following code allows you to stream content from the given URL:
  ///
  /// ```
  /// final url = Uri.parse('https://raywenderlich.com');
  /// final client = http.Client();
  /// final request = http.Request('GET', url);
  /// final response = await client.send(request);
  /// final stream = response.stream;
  /// ```
  ///
  /// Your challenge is to transform the stream from bytes to strings
  /// and see how many bytes each data chunk is. Add error handling,
  /// and when the stream is finished, close the client.
  final client = http.Client();
  try {
    final url = Uri.parse('https://raywenderlich.com');
    final request = http.Request('Get', url);
    final response = await client.send(request);
    final httpStream = response.stream;
    await for (var data in httpStream.transform(utf8.decoder)) {
      print(data);
      print(data.length);
    }
  } on Exception catch (error) {
    print(error);
  } finally {
    print('All finished');
    client.close;
  }



  void fibonacciIsolate(Map<String, Object> arguments) {
    final SendPort sendPort = arguments['sendPort'] as SendPort;
    final n = arguments['n'] as int;
    if (n < 0) sendPort.send('Error');
    var fibValues = [0,1];
    final evenOdd = n % 2 == 0;
    var fibVal;
    for (var idx=0; idx <= (n/2); idx++ ) {
      fibVal = evenOdd ? fibValues[0] : fibValues[1];
      fibValues[0] = fibValues[0] + fibValues[1];
      fibValues[1] = fibValues[0] + fibValues[1];
    }
    sendPort.send('The $n value of fibonacci is $fibVal');
  }

  final receivePort = ReceivePort();
  final n = -5;
  final arguments = {
    'sendPort': receivePort.sendPort,
    'n': n,
  };
  final isolate = await Isolate.spawn( fibonacciIsolate, arguments);
  receivePort.listen((message) {
    print(message);
    receivePort.close();
    isolate.kill();
  });

}

class Todo {
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
});

  factory Todo.fromJson(Map<String, Object?> jsonMap) {
    return Todo(
      userId: jsonMap['userId'] as int,
      id: jsonMap['id'] as int,
      title: jsonMap['title'] as String,
      completed: jsonMap['completed'] as bool
    );
  }

  final int userId;
  final int id;
  final String title;
  final bool completed;

  @override
  String toString() {
    return 'userId: $userId\n'
        'id: $id\n'
        'title: $title\n'
        'completed: $completed';
  }

}

class Comment {
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body
  });

  factory Comment.fromJson(Map<String, Object?> jsonMap) {
    return Comment(
        postId: jsonMap['postId'] as int,
        id: jsonMap['id'] as int,
        name: jsonMap['name'] as String,
        email: jsonMap['email'] as String,
        body: jsonMap['body'] as String);
  }

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  @override
  String toString() {
    return '{\n"postId": $postId\n'
        '"id": $id\n'
        '"name": $name\n'
        '"email": $email\n'
        '"body": $body\n}';
  }
}