import 'package:boc_app/service/offerService.dart';
import 'package:boc_app/view/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.all(10),
              child:
                  Align(child: Image.asset("assets/image/logo-cropped.png")))),
      body: Builder(
        builder: (context) => CustomContainer(
          padding: EdgeInsets.all(10),
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
              ),
              Expanded(
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Geolocator()
                          .checkGeolocationPermissionStatus()
                          .then((status) {
                        if (status == GeolocationStatus.granted)
                          Geolocator().isLocationServiceEnabled().then((val) {
                            if (val)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OfferSelection()));
                            else
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Please Check your location settings'),
                              ));
                          }).catchError((err) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Ops! Something went wrong'),
                            ));
                            print(err);
                          }).timeout(Duration(minutes: 1), onTimeout: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Ops! Something went wrong'),
                            ));
                          });
                      });
                    },
                    child: Text(
                      "Near Me",
                      style: Theme.of(context).textTheme.body1,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OffersByLocation()));
                  },
                  child: Text(
                    "By Location",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List selection = OfferService.offerList['Sri Lanka'];
    return Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    child: Image.asset("assets/image/logo-cropped.png")))),
        body: Builder(
            builder: (context) => CustomContainer(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: selection.length,
                    itemBuilder: (content, index) {
                      var offer = selection[index];
                      return new InkWell(
                        onTap: (){
                          launch(offer['link']);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                    offer['image'],
                                  height: 75,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Text(offer['name'])
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    ))));
  }
}

class OffersByLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    child: Image.asset("assets/image/logo-cropped.png")))),
        body: Builder(
            builder: (context) => CustomContainer(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: OfferService.offerList.length,
                    itemBuilder: (content, index) => new RaisedButton(
                          color: Theme.of(context).primaryColorLight,
                          textTheme: Theme.of(context).buttonTheme.textTheme,
                          child: Text(
                            OfferService.offerList.keys.toList()[index],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OfferSelection()));
                          },
                        )))));
  }
}
