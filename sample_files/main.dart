import 'package:blinkcard_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import "dart:async";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _resultString = "";
  String _fullDocumentFirstImageBase64 = "";
  String _fullDocumentSecondImageBase64 = "";

  Future<void> scan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwAAAEVY29tLm1pY3JvYmxpbmsuc2FtcGxl1BIcP6dpSuS/37rVPcGKMeTrsgR8MahcSwwXAx7W+q4DISNxpyD6+I7UJwEXZY0idcmSKWVeQM6vHpTFfH7GFprdWTFfjlKyu60UtOHF0npdL2MmfTLta+7nnJRT28SshWOzbKsFOlZ0JJoeiZMEyM4znE2J6KFWNTsI8rIUfKoZvf1ZrPQRT1B+2AzIVrm6WmIIUKHsoHnmvNM424vPEBC4yhcWu2anECMkX8Li/Q==";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwAAAAVY29tLm1pY3JvYmxpbmsuc2FtcGxlU9kJdZhZkGlTu9U3PWNHZAAPMfggO8eqRqstS/pzAj03JIRM4oKtZHC3x01wMUK/j4ZjCEdfIGTcuaz8sIaJY3rE/o43J+8GQMgTkoKu3qCjqowrQgNT6JqiD7Vkth1TDhdjv3bJq5BmewGdyJzVnT8yk+wCV8XBqqY4dJozSfZRgmgAp2O/WnXfveCTpHqnHjH50fCLTgertIHJs6ekk8FxHtWKkoiXixZnkLppqxjn1bc4l51VAaXaf+HhlAYSYVgQZJpk+n8CtNfemcGHw4sNq2xYGQ1o4cZVjhJEOCuP3PeujhkDHtfD42bu2dJVXPQUoj6eCnw=";
    }

    var cardRecognizer = BlinkCardRecognizer();
    cardRecognizer.returnFullDocumentImage = true;

    BlinkCardOverlaySettings settings = BlinkCardOverlaySettings();

    var results = await MicroblinkScanner.scanWithCamera(
        RecognizerCollection([cardRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkCardRecognizerResult) {
        _resultString = getCardResultString(result);
        
        setState(() {
          _resultString = _resultString;
          _fullDocumentFirstImageBase64 = result.firstSideFullDocumentImage;
          _fullDocumentSecondImageBase64 = result.secondSideFullDocumentImage;
        });

        return;
      }
    }
  }

  String getCardResultString(BlinkCardRecognizerResult result) {
    return buildResult(result.cardNumber, 'Card Number') +
      buildResult(result.cardNumberPrefix, 'Card Number Prefix') +
      buildResult(result.iban, 'IBAN') +
      buildResult(result.cvv, 'CVV') +
      buildResult(result.owner, 'Owner') +
      buildResult(result.cardNumberValid.toString(), 'Card Number Valid') +
      buildDateResult(result.expiryDate, 'Expiry date');
  }

  String buildResult(String result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildDateResult(Date result, String propertyName) {
    if (result == null || result.year == 0) {
      return "";
    }

    return buildResult(
        "${result.day}.${result.month}.${result.year}", propertyName);
  }

  String buildIntResult(int result, String propertyName) {
    if (result < 0) {
      return "";
    }

    return buildResult(result.toString(), propertyName);
  }

  @override
  Widget build(BuildContext context) {
    Widget fullDocumentFirstImage = Container();
    if (_fullDocumentFirstImageBase64 != null &&
        _fullDocumentFirstImageBase64 != "") {
      fullDocumentFirstImage = Column(
        children: <Widget>[
          Text("Document First Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentFirstImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    Widget fullDocumentSecondImage = Container();
    if (_fullDocumentSecondImageBase64 != null &&
        _fullDocumentSecondImageBase64 != "") {
      fullDocumentSecondImage = Column(
        children: <Widget>[
          Text("Document Second Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentSecondImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("BlinkCard Sample"),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                  child: RaisedButton(
                    child: Text("Scan"),
                    onPressed: () => scan(),
                  ),
                  padding: EdgeInsets.only(bottom: 16.0)),
              Text(_resultString),
              fullDocumentFirstImage,
              fullDocumentSecondImage,
            ],
          )),
    ));
  }
}