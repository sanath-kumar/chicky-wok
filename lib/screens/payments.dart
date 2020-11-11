import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class Payments extends StatefulWidget {

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Future<UpiIndiaResponse> _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiIndiaApp> apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps().then((value) {
      setState(() {
        apps = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          displayUpiApps(),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: _transaction,
              builder: (BuildContext context,
                  AsyncSnapshot<UpiIndiaResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('An Unknown error has occured'));
                  }
                  UpiIndiaResponse _upiResponse;
                  _upiResponse = snapshot.data;
                  if (_upiResponse.error != null) {
                    String text = '';
                    switch (snapshot.data.error) {
                      case UpiIndiaResponseError.APP_NOT_INSTALLED:
                        text = "Requested app not installed on device";
                        break;
                      case UpiIndiaResponseError.INVALID_PARAMETERS:
                        text = "Requested app cannot handle the transaction";
                        break;
                      case UpiIndiaResponseError.NULL_RESPONSE:
                        text = "requested app didn't returned any response";
                        break;
                      case UpiIndiaResponseError.USER_CANCELLED:
                        text = "You cancelled the transaction";
                        break;
                    }
                    return Center(
                      child: Text(text),
                    );
                  }
                  String txnId = _upiResponse.transactionId;
                  String resCode = _upiResponse.responseCode;
                  String txnRef = _upiResponse.transactionRefId;
                  String status = _upiResponse.status;
                  String approvalRef = _upiResponse.approvalRefNo;
                  switch (status) {
                    case UpiIndiaResponseStatus.SUCCESS:
                      print('Transaction Successful');
                      break;
                    case UpiIndiaResponseStatus.SUBMITTED:
                      print('Transaction Submitted');
                      break;
                    case UpiIndiaResponseStatus.FAILURE:
                      print('Transaction Failed');
                      break;
                    default:
                      print('Received an Unknown transaction status');
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Transaction Id: $txnId\n'),
                      Text('Response Code: $resCode\n'),
                      Text('Reference Id: $txnRef\n'),
                      Text('Status: $status\n'),
                      Text('Approval No: $approvalRef'),
                    ],
                  );
                } else
                  return Text(' ');
              },
            ),
          )
        ],
      ),
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps.length == 0)
      return Center(child: Text("No apps found to handle transaction."));
    else
      return Center(
        child: Wrap(
          children: apps.map<Widget>((UpiIndiaApp app) {
            return GestureDetector(
              onTap: () {
                print(app.app);
                _transaction = initiateTransaction(app.app);
                setState(() {});
              },
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.memory(
                      app.icon,
                      height: 60,
                      width: 60,
                    ),
                    Text(app.name),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
  }


  Future<UpiIndiaResponse> initiateTransaction(String app) async {
    return _upiIndia.startTransaction(
      app: app, //  I took only the first app from List<UpiIndiaApp> app.
      receiverUpiId: 'shahal.00@okhdfcbank',
      receiverName: 'Shahal A',
      transactionRefId: 'id001',
      transactionNote: 'Test',
      amount: 1.00,
    );
  }
}
