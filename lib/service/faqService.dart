import 'dart:core';

import 'package:boc_app/model/faqObj.dart';

class FAQService{

  static final faqs =<FAQObj>[
    new FAQObj(
        "How To Create an account?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Account"
    ),
    new FAQObj(
        "How To Transfer an account?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Account"
    ),
    new FAQObj(
        "How To Change My Pin?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Account"
    ),
    new FAQObj(
        "How To Do E-Shopping?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Payments"
    ),
    new FAQObj(
        "How To Get Be Should of a Purchase?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Payments"
    ),
    new FAQObj(
        "How To Get A loan?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Payments"
    ),
    new FAQObj(
        "What is my nearest Branch?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Branches"
    ),
    new FAQObj(
        "I want to report something about a Branch?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Branches"
    ),
    new FAQObj(
        "How To Transfer Money?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Transaction"
    ),
    new FAQObj(
        "How To Get Cash Back?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Transaction"
    ),
    new FAQObj(
        "How To Get Details of Transactions?",
        "ViewPostImeInputStage ACTION_DOWN D/ViewRootImpl(27436): ViewPostImeInputStage ACTION_DOWD",
        "Transaction"
    ),
  ];
  
  static List<FAQObj> searchFAQ(String query){
    print(query);
    List<FAQObj> list;
    for(FAQObj faq in faqs){
      if(faq.title.toLowerCase().contains(query.toLowerCase())){
        list.add(faq);
      }
    }
    return list;
  }

  static List<FAQObj> getCategory(String category){
    List<FAQObj> list = [];
    for(FAQObj faq in faqs){
      if(faq.category==category){
        list.add(faq);
      }
    }
    return list;
  }

  static List<String> getCategoryList(){
    List<String> list = [];
    for(FAQObj faq in faqs){
      bool contains = false;
      for(String cat in list){
        if(cat==faq.category){
          contains = true;
          break;
        }
      }
      if(!contains){
        list.add(faq.category);
      }
    }
    return list;
  }


}