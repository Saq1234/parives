class AdvanceSearchArguments{
    int? clearanceId;
    int? stateCode;
    AdvanceSearchArguments({this.clearanceId,this.stateCode});
}
class TrackProposolDetailsArguments{
    String? proposolNo;
    String? SingleWindowNo;
    String? ProjectName;
    String? state;
    String? ProjectCategory;
    String? Area;
    String? ApplicationFor;
    String? Date;
    int?id;

    TrackProposolDetailsArguments({this.proposolNo,this.ApplicationFor,this.Area,this.Date,this.ProjectCategory,this.ProjectName,this.SingleWindowNo,this.state,this.id});
}
class AdvanceSearchDetailsArguments{
    String? proposolNo;
    int?clearanceId;
    int?id;
    String? sector;

    AdvanceSearchDetailsArguments({
        this.proposolNo,
        this.clearanceId,
        this.id,
        this.sector,

    });
}