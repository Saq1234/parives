class Apo2023Model{
  String? name;
  List<ApoData>? apodata;


  Apo2023Model({this.name, this.apodata,});
}

class ApoData {
  String? FileNo;
  String? apoDate;
  String? url;

  ApoData({this.FileNo, this.apoDate, this.url});
}
List<Apo2023Model>Apo2023List=[
  Apo2023Model(
    name: "Chattisgarh",
    apodata: [
      ApoData(
        FileNo: "15-4(7)/2020-NA",
        apoDate: "15 Feb 2023",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Chhat_200420231147455704_1_APO_.pdf",
      ),
    ]
  ), Apo2023Model(
    name: "Orisa",
    apodata: [
      ApoData(
        FileNo: "15/15/2020-NA",
        apoDate: "28 Mar 2023",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Oriss_200420231219126666_1_APO_.pdf",
      ),
    ]
  ), Apo2023Model(
    name: "West Bengal",
    apodata: [
      ApoData(
        FileNo: "15/32/2020-NA",
        apoDate: "17 Mar 2023",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/WestB_200420231204000881_1_APO_.pdf",
      ),ApoData(
        FileNo: "15/32/2020-NA",
        apoDate: "17 Apr 2023",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/WestB_200420231203373159_1_APO_.pdf",
      ),
    ]
  ),

];