import 'package:boc_app/controller/Localization/appTranslations.dart';
import 'package:boc_app/model/faqObj.dart';
import 'package:boc_app/service/faqService.dart';
import 'package:boc_app/view/customContainer.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FAQ();
  }
}

class _FAQ extends State<FAQ> {
  List<FAQObj> faqList;
  List<String> categories;
  int selected = 0;
  TextEditingController editingController = TextEditingController();

  _FAQ() {
    categories = FAQService.getCategoryList();
    faqList = FAQService.getCategory(categories[selected]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    child: Image.asset("assets/image/logo-cropped.png")))),
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(padding: EdgeInsets.all(5)),
          Text(
            AppTranslations.of(context).text("faq_quote"),
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(color: Colors.black),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Flexible(
            child: TextField(
              onChanged: (val) {
                setState(() {
                  faqList = FAQService.searchFAQ(editingController.text);
                  selected = -1;
                });
              },
              controller: editingController,
              decoration: InputDecoration(
                hintText: AppTranslations.of(context).text("search"),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(
            flex: 1,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  if (selected == index) {
                    return FlatButton(
                      onPressed: () {},
                      child: Text(categories[index]),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    );
                  }
                  return OutlineButton(
                    onPressed: () {
                      setState(() {
                        selected = index;
                        faqList = FAQService.getCategory(categories[selected]);
                      });
                    },
                    child: Text(categories[index]),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  );
                }),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(
              flex: 10,
              child:
                  faqList == null ? Container() : new FAQList(faqList: faqList))
        ]));
  }
}

class FAQList extends StatelessWidget {
  const FAQList({
    Key key,
    @required this.faqList,
  }) : super(key: key);

  final List<FAQObj> faqList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: faqList.length,
      itemBuilder: (context, index) {
        return new ExpansionTile(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(faqList[index].title),
          children: <Widget>[Text(faqList[index].content)],
        );
      },
    );
  }
}
