import 'package:boc_app/controller/Localization/AppTranslations.dart';
import 'package:boc_app/service/FaqService.dart';
import 'package:boc_app/view/CustomContainer.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _FAQ();
  }
}

class _FAQ extends State<FAQ>{
  List<FAQObj> faqList;
  List<String> categories;
  int selected = 0;
  TextEditingController editingController = TextEditingController();

  _FAQ(){
    categories = FAQService.getCategoryList();
    faqList = FAQService.getCategory(categories[selected]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Padding(padding: EdgeInsets.all(10),child: Align(child:Image.asset("assets/image/logo-cropped.png")))),
      body: Column(
        children: <Widget>[
          Text(
            AppTranslations.of(context).text("faq_quote"),
            style: Theme.of(context).primaryTextTheme.display1
                .copyWith(color: Colors.black),
          ),
          Flexible(
            child: TextField(
              onChanged: (query){
                setState(() {
                  faqList = FAQService.searchFAQ(query);
                });
              },
              controller: editingController,
              decoration: InputDecoration(
                hintText: AppTranslations.of(context).text("search"),
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index){
              if(selected==index){
                return FlatButton(
                  onPressed: (){},
                  child: Text(categories[index]),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                );
              }
              return OutlineButton(
                onPressed: (){
                  setState(() {
                    selected = index;
                    faqList = FAQService.getCategory(categories[selected]);
                  });
                },
                child: Text(categories[index]),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              );
            }
          ),
          faqList==null?Container():new FAQList(faqList: faqList)
        ]
      )
    );
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
    print("done");
    return ListView.builder(
      itemCount: faqList.length,
      itemBuilder: (context, index){
        return ExpansionTile(
          title: Text(faqList[index].title),
          children: <Widget>[
            Text(faqList[index].content)
          ],
          initiallyExpanded: index==0,
        );
      },
    );
  }
}