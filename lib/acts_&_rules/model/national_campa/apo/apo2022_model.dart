class Apo2022Model{
  String? name;
  List<ApoData>? Apodata;
  Apo2022Model({this.name, this.Apodata,});
}

class ApoData {
  String? FileNo;
  String? apoDate;
  String? url;

  ApoData({this.FileNo, this.apoDate, this.url});
}
List<Apo2022Model>Apo2022List=[
  Apo2022Model(
    name: "Chandigarh",
    Apodata: [
      ApoData(
        FileNo: "NA-15/36/2020-NA",
        apoDate: "14 Feb 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Chand_250220221136540178_1_APO_.pdf",
      ),
    ]
  ),  Apo2022Model(
    name: "Delhi",
    Apodata: [
      ApoData(
        FileNo: "NA-15/17/2020-NA",
        apoDate: "14 Mar 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Delhi_040420221149510432_1_APO_.pdf",
      ),  ApoData(
        FileNo: "NA-15/17/2020-NA",
        apoDate: "31 Oct 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Delhi_011120221127270393_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Gujarat",
    Apodata: [
      ApoData(
        FileNo: "NA-15/29/2020-NA",
        apoDate: "04 Feb 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Gujar_250220221115471473_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Himachal Pradesh",
    Apodata: [
      ApoData(
        FileNo: "NA-15/19/2020-NA",
        apoDate: "14 Jun 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Himac_270620221025329057_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Kerala",
    Apodata: [
      ApoData(
        FileNo: "NA-15/12/2020-NA",
        apoDate: "30 Dec 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Keral_240220221640120279_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Manipur",
    Apodata: [
      ApoData(
        FileNo: "NA-15/25/2020-NA",
        apoDate: "29 Dec 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Manip_250220221121137503_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Meghalaya",
    Apodata: [
      ApoData(
        FileNo: "NA-15/3/2020-NA",
        apoDate: "23 Dec 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Megha_250220221123088583_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Mizoram",
    Apodata: [
      ApoData(
        FileNo: "	NA-15/16/2020-NA",
        apoDate: "23 Dec 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Mizor_250220221119101432_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Orisa",
    Apodata: [
      ApoData(
        FileNo: "NA-15/15/2020-NA",
        apoDate: "16 Feb 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Oriss_040420221207578881_1_APO_.pdf",
      ),
    ]
  ), Apo2022Model(
    name: "Rajasthan",
    Apodata: [
      ApoData(
        FileNo: "NA-15/23/2020-NA",
        apoDate: "22 Mar 2022",
        url: "22 Mar 2022",
      ),
    ]
  ), Apo2022Model(
    name: "Tripura",
    Apodata: [
      ApoData(
        FileNo: "NA-15/2/2021-NA",
        apoDate: "13 Dec 2021",
        url: "13 Dec 2021",
      ),
    ]
  ), Apo2022Model(
    name: "West Bengal",
    Apodata: [
      ApoData(
        FileNo: "NA-15/32/2020-NA",
        apoDate: "16 Feb 2022",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/WestB_240220221649008164_1_APO_.pdf",
      ),
    ]
  ),
];