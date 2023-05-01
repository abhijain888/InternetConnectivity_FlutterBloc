# Internet Connectivity using FLutter Bloc

##### Important packages to install:
 - connectivity_plus
 - flutter_bloc
  - equatable

### Usage:

1. Install package
```
flutter pub add connectivity_plus
```
2. Import package in your file
```
import 'package:connectivity_plus/connectivity_plus.dart';
```
3. To check current status
```

final connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
} else if (connectivityResult == ConnectivityResult.ethernet) {
  // I am connected to a ethernet network.
} else if (connectivityResult == ConnectivityResult.vpn) {
  // I am connected to a vpn network.
  // Note for iOS and macOS:
  // There is no separate network interface type for [vpn].
  // It returns [other] on any device (also simulator)
} else if (connectivityResult == ConnectivityResult.bluetooth) {
  // I am connected to a bluetooth.
} else if (connectivityResult == ConnectivityResult.other) {
  // I am connected to a network which is not in the above mentioned networks.
} else if (connectivityResult == ConnectivityResult.none) {
  // I am not connected to any network.
}
```


4. You can also listen for network state changes by subscribing to the stream exposed by connectivity plugin:
```
import 'package:connectivity_plus/connectivity_plus.dart';

@override
initState() {
  super.initState();

  subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
  });
}

// Be sure to cancel subscription after you are done
@override
dispose() {
  subscription.cancel();
  super.dispose();
}

```

## Developers
MIT License

Copyright (c) 2019 TecOrb Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
