class Apo2021Model{
  String? name;
  List<ApoData>? Apodata;
  Apo2021Model({this.name, this.Apodata,});
}

class ApoData {
  String? FileNo;
  String? apoDate;
  String? url;

  ApoData({this.FileNo, this.apoDate, this.url});
}
List<Apo2021Model>Apo2021List=[
  Apo2021Model(
    name: "Arunachal Pradesh",
    Apodata: [
      ApoData(
        FileNo: "NA-15/36/2020-NA",
        apoDate: "20 Jul 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Aruna_200720211545513556_1_APO_.pdf",
      ),
    ]
  ),
  Apo2021Model(
    name: "Chattisgarh",
    Apodata: [
      ApoData(
        FileNo: "15-2(7)/2020-NA(Pt)",
        apoDate: "15 Mar 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Chhat_250820211013275074_1_APO_.pdf",
      ),ApoData(
        FileNo: "15-2(7)/2020-NA(Pt)",
        apoDate: "15 Mar 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Chhat_250820211014444398_1_APO_.pdf",
      ),ApoData(
        FileNo: "	15-2(7)/2020-NA(Pt)",
        apoDate: "	20 Jul 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Chhat_250820211015187458_1_APO_.pdf",
      ),ApoData(
        FileNo: "15-2(7)/2020-NA(Pt)",
        apoDate: "15 Mar 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Chhat_250820211014067900_1_APO_.pdf",
      ),
    ]
  ),  Apo2021Model(
    name: "Delhi",
    Apodata: [
      ApoData(
        FileNo: "	NA-15/17/2020-NA",
        apoDate: "11 Jun 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Delhi_260820211445562438_1_APO_.pdf",
      ),
    ]
  ),  Apo2021Model(
    name: "Kerala",
    Apodata: [
      ApoData(
        FileNo: "NA-15/12/2020-NA",
        apoDate: "27 Jul 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Keral_211020211139419892_1_APO_.pdf",
      )
    ]
  ),  Apo2021Model(
    name: "Madhya Pradesh",
    Apodata: [
      ApoData(
        FileNo: "	NA-15/3/2020-NA",
        apoDate: "29 Jun 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Madhy_310820211001050551_1_APO_.pdf",
      ),
    ]
  ),  Apo2021Model(
    name: "Orisa",
    Apodata: [
      ApoData(
        FileNo: "NA-15/15/2020-NA",
        apoDate: "20 Mar 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Oriss_250820210955553468_1_APO_.pdf",
      ),
    ]
  ),  Apo2021Model(
    name: "Rajathan",
    Apodata: [
      ApoData(
        FileNo: "NA-15/23/2020-NA",
        apoDate: "08 Sep 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Rajas_011020211145403661_1_APO_.pdf",
      ),
    ]
  ),  Apo2021Model(
    name: "Telangana",
    Apodata: [
      ApoData(
        FileNo: "NA-15/28/2020-NA",
        apoDate: "22 Apr 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/Telan_250820210950461953_1_APO_.pdf",
      ),
    ]
  ),  Apo2021Model(
    name: "West Bengal",
    Apodata: [
      ApoData(
        FileNo: "	NA-15/32/2020-NA",
        apoDate: "06 May 2021",
        url: "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/WestB_260820211449546504_1_APO_.pdf",
      ),
  ],
  )
];