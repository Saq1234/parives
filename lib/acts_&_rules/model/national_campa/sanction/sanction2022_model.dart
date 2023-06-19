class Snac2022Model {
  String? name;
  List<Data>? data;
  String? FileNo;
  String? sanctionDate;
  String? url;

  Snac2022Model({this.name, this.data, this.FileNo, this.url, this.sanctionDate});
}

class Data {
  String? FileNo;
  String? sanctionDate;
  String? url;

  Data({this.FileNo, this.sanctionDate, this.url});
}

List<Snac2022Model> Snac2022List = [
  Snac2022Model(
    name: "Andaman and Nicobar",
    data: [
      Data(
        FileNo: "NA-15/22/2020/NA",
        sanctionDate: "14 Jun 2022",
        url:
            "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1440137301_SANC_Andamansanction-06152022101124.pdf",
      ),
    ],
  ),
  Snac2022Model(
    name: "Andhra Pradesh",
    data: [
      Data(
          FileNo: "NA-15/22/2020/NA",
          sanctionDate: "15 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1440137301_SANC_Andamansanction-06152022101124.pdf"),
      Data(
          FileNo: "NA-15/11/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1005481531_SANC_AndhraPradeshSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Arunachal Pradesh",
    data: [
      Data(
          FileNo: "NA-15/36/2020/NA",
          sanctionDate: "08 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1719312331_SANC_arunachalsanction-08102022112016.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Assam",
    data: [
      Data(
          FileNo: "NA-15/7/2020/NA",
          sanctionDate: "15 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/16_Jun_2022_1138557301_SANC_Assamsanction-06152022154915.pdf"),
    ],
  ),
  Snac2022Model(
    name: "",
    data: [
      Data(FileNo: "", sanctionDate: ""),
    ],
  ),
  Snac2022Model(
    name: "Bihar",
    data: [
      Data(
          FileNo: "15-13/2020-NA",
          sanctionDate: "20 Sep 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/22_Sep_2022_1018150071_SANC_patna-09042022165013.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Chandigarh",
    data: [
      Data(
          FileNo: "NA-15/1/2021/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1017456501_SANC_UTofChandigarhSanction2022-23.PDF"),
      Data(
          FileNo: "15/33/2022-NA",
          sanctionDate: "21 Sep 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/22_Sep_2022_1025267501_SANC_chandigarh-09042022165044_compressed-1.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Chhattisgarh",
    data: [
      Data(
          FileNo: "15/2(7)/2020-NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1006343971_SANC_ChhattisgarhSanction2022-23.PDF"),
      Data(
          FileNo: "NA-15-2(7)/2020-NA(pt)",
          sanctionDate: "14 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1317137831_SANC_chhattisgarhsanction-06152022101306.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Delhi",
    data: [
      Data(
          FileNo: "NA-15/17/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1007063371_SANC_DelhiSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Goa",
    data: [
      Data(
          FileNo: "NA-15/10/2020/NA",
          sanctionDate: "17 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/21_Jun_2022_1059438601_SANC_goa-06172022181738.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Gujarat",
    data: [
      Data(
          FileNo: "NA-15/29/2020/NA",
          sanctionDate: "14 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1449280301_SANC_gujarat-06152022100738.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Haryana",
    data: [
      Data(
          FileNo: "NA-15/6/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1720161231_SANC_haryanasanction-08102022112113.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Himachal Pradesh",
    data: [
      Data(
          FileNo: "NA-15/19/2020/NA",
          sanctionDate: "14 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/27_Jun_2022_1145413531_SANC_HimachalPradeshsanction.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Jammu and Kashmir",
    data: [
      Data(
          FileNo: "NA-15/14/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1007372301_SANC_Jammu&KashmirSanction2022-23.PDF"),
      Data(
          FileNo: "NA-15/14/2020/NA",
          sanctionDate: "17 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/21_Jun_2022_1057454601_SANC_Jammu_and_Kashmir_Sanction_06202022100314.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Jharkhand",
    data: [
      Data(
          FileNo: "NA-15/27/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1723233131_SANC_jharkhandsanction-08102022111543.pdf"),
      Data(
          FileNo: "NA-15/27/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1008141571_SANC_JharkhandSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Karnataka",
    data: [
      Data(
          FileNo: "NA-15/35/2020/NA",
          sanctionDate: "15 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/16_Jun_2022_1150556731_SANC_karnatakasanction-06152022154847.pdf"),
      Data(
          FileNo: "NA-15/35/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1009008531_SANC_KarnatakaSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Kerala",
    data: [
      Data(
          FileNo: "NA-15/12/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1009346871_SANC_KeralaSanctionSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Madhya Pradesh",
    data: [
      Data(FileNo: "NA-15/3/2020/NA", sanctionDate: "13 May 2022", url: "13 May 2022"),
      Data(
          FileNo: "NA-15/3/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1720440671_SANC_MPSanction-08102022162023.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Maharashtra",
    data: [
      Data(
          FileNo: "15/18/2020-NA",
          sanctionDate: "14 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1435314101_SANC_Maharashtrasanction-06152022100833.pdf"),
      Data(
          FileNo: "NA-15/7/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1722578731_SANC_maharashtrasanction-08102022111812.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Manipur",
    data: [
      Data(
          FileNo: "NA-15/21/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1011367601_SANC_ManipurSanction2022-23(1).PDF"),
    ],
  ),
  Snac2022Model(
    name: "Meghalaya",
    data: [
      Data(
          FileNo: "NA-15/9/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1012185201_SANC_MeghalayaSanction2022-23.PDF"),
      Data(
          FileNo: "NA-15/9/2020/NA",
          sanctionDate: "17 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/21_Jun_2022_1059044371_SANC_meghalaya-06172022181632.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Mizoram",
    data: [
      Data(
          FileNo: "NA-15/16/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1013385631_SANC_MizoramSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Orisa",
    data: [
      Data(
          FileNo: "NA-15/15/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1015089531_SANC_OdishaSanction2022-23.PDF"),
      Data(
          FileNo: "NA-15/15/2020/NA",
          sanctionDate: "15 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/16_Jun_2022_1113218801_SANC_odishasanctio-06152022154807.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Rajasthan",
    data: [
      Data(
          FileNo: "NA-15/23/2020/NA",
          sanctionDate: "14 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1318523201_SANC_rajasthansanction-06152022101231.pdf"),
      Data(
          FileNo: "NA-15/23/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1015556371_SANC_RajashthanSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Sikkim",
    data: [
      Data(
          FileNo: "NA-15/30/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1744146731_SANC_SikkimSanction2022-23.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Tamil Nadu",
    data: [
      Data(
          FileNo: "NA-15/34/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1016226301_SANC_TamilNaduSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Telangana",
    data: [
      Data(
          FileNo: "NA-15/28/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1721492871_SANC_telanganasanction-08102022111705.pdf"),
      Data(
          FileNo: "NA-15/28/2020/NA",
          sanctionDate: "17 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/27_Jun_2022_1146263531_SANC_telangana-06172022181813.pdf"),
    ],
  ),
  Snac2022Model(
    name: "Tripura",
    data: [
      Data(
          FileNo: "NA-15/2/2021/NA",
          sanctionDate: "17 Jun 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/21_Jun_2022_1058257971_SANC_tripura-06172022181707.pdf"),
      Data(
          FileNo: "NA-15/2/2021/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1017043931_SANC_TripuraSanction2022-23.PDF"),
    ],
  ),
  Snac2022Model(
    name: "Uttar Pradesh",
    data: [
      Data(
          FileNo: "NA-15/24/2020/NA",
          sanctionDate: "10 Aug 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/31_Aug_2022_1722151431_SANC_UttarPradeshsanction-08102022111906.pdf"),
      Data(
          FileNo: "NA-15/24/2020/NA",
          sanctionDate: "13 May 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1018268071_SANC_UttarPradeshSanction2022-23.PDF"),
      Data(
          FileNo: "15/24/2020-NA",
          sanctionDate: "21 Sep 2022",
          url:
              "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/22_Sep_2022_1017134901_SANC_AnnualplanUP-09042022164555(1).pdf"),
    ],
  ),
  Snac2022Model(name: "Uttarakhand", data: [
    Data(
        FileNo: "15/4/2020-NA",
        sanctionDate: "21 Sep 2022",
        url:
            "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/22_Sep_2022_1030224631_SANC_Dehradun-09042022165120(1)_compressed.pdf"),
  ]),
  Snac2022Model(name: "West Bengal", data: [
    Data(
        FileNo: "NA-15/32/2020/NA",
        sanctionDate: "14 Jun 2022",
        url:
            "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/15_Jun_2022_1325479831_SANC_westbengalsanction-06152022101159.pdf"),
    Data(
        FileNo: "NA-15/32/2020/NA",
        sanctionDate: "13 May 2022",
        url:
            "https://forestsclearance.nic.in/writereaddata/meeting_notice_campa/17_May_2022_1018493631_SANC_WestBengalSanction2022-23.PDF"),
  ]),
];
