

import 'package:intl/intl.dart';

DateFormat formatteryyyyMMdd = DateFormat('yyyy-MM-dd');
DateFormat formatterddmmyyyy = DateFormat('dd-MM-yyyy');


class DateTimeUtil{

  static String convertTimeIntodate(int timeStamp){
    int timeInMillis = timeStamp;
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);

    // print("date.millisecond${date.millisecond}");
    var formattedDate =  DateFormat("dd-MM-yyyy").add_jm().format(date);

    return formattedDate;
  }
  ////////
  static String converDateIntoTime(int timeStamp){
    int timeInMillis = timeStamp;
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var formattedTime =  DateFormat("h:mm a").format(date);

    return formattedTime;
  }


  static String convertDate(int timeStamp){
    int timeInMillis = timeStamp;
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);

    // print("date.millisecond${date.millisecond}");
    var formattedDate =  DateFormat("dd-MM-yyyy").format(date);

    return formattedDate;
  }

  // static int convertStringIntoTimeStamp(String time){
  //
  //   DateTime date = DateTime.parse(time.split('-').reversed.join());
  //   print("convertStringIntoTimeStamp${date}");
  //   Timestamp stamp = Timestamp.fromDate(date);
  //   print("date.millisecond11${stamp.millisecondsSinceEpoch}");
  //
  //   return (stamp.millisecondsSinceEpoch).toInt();
  // }


  static String compareTimeStamp(int timeStamp,int estimatedTime){
    int timeInMillis = timeStamp;
    var date = DateTime.now().millisecondsSinceEpoch;
    var dif = date - 1612266606916;
    var date1 = DateTime.fromMillisecondsSinceEpoch(dif * 1000);

    var formattedDate =  DateFormat().add_jm().format(date1);

    var minutesToTimeStamp = ((dif% 60000) /1000);

    print("formattedDate:${minutesToTimeStamp}");
    print("formattedDate1:$date1");

    return "formattedDate";
  }


}