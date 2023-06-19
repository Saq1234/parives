class Apo2020Model{
  String? name;
  List<ApoData>? Apodata;
  Apo2020Model({this.name, this.Apodata,});
}

class ApoData {
  String? FileNo;
  String? apoDate;
  String? url;

  ApoData({this.FileNo, this.apoDate, this.url});
}
List<Apo2020Model>Apo2020List=[
  Apo2020Model(
    name: "Assam",
    Apodata: [
      ApoData(
        FileNo: "	NA-15/7/2020-NA",
        apoDate: "	19 May 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Assam_250820210947510924_1_APO_.pdf",
      ),
    ]
  ),  Apo2020Model(
    name: "Haryana",
    Apodata: [
      ApoData(
        FileNo: "NA-15/6/2020-NA",
        apoDate: "07 Apr 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Harya_270820211104390103_1_APO_.pdf",
      ),
    ]
  ),  Apo2020Model(
    name: "Jammu and Kashmir",
    Apodata: [
      ApoData(
        FileNo: "NA-15/14/2020-NA",
        apoDate: "01 Jan 1900",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Jammu_310820210948004202_1_APO_.pdf",
      ),
    ]
  ),  Apo2020Model(
    name: "Kerala",
    Apodata: [
      ApoData(
        FileNo: "NA-15/12/2020-NA",
        apoDate: "	26 May 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Keral_211020211145353304_1_APO_.pdf",
      ),
    ]
  ),  Apo2020Model(
    name: "West Bengal",
    Apodata: [
      ApoData(
        FileNo: "	NA-15/32/2020-NA",
        apoDate: "21 Jul 2020",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/WestB_260820211459334094_1_APO_.pdf",
      ),
    ]
  ),
];