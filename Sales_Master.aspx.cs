using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class Sales_Master : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddClient();
            MaxTrn_no();
        }
    }
    public void MaxTrn_no()
    {

        if (txt_TrnNo.Value == "")
        {
            txt_TrnNo.Value = "100";
        }
        else
        {
            var qry = db.SP_Get_SalesH().ToList().Max(r => r.S_TrnNo);
            var max = qry + 1;
            txt_TrnNo.Value = max.ToString();
            txt_Date.Value = System.DateTime.Now.ToString("dd/MM/yyyy");
        }

    }
    public void ddClient()
    {
        txt_Client.DataSource = db.SP_Get_Client_Master().ToList();
        txt_Client.DataTextField = "Client_Name";
        txt_Client.DataValueField = "Client_ID";
        txt_Client.DataBind();
        txt_Client.Items.Insert(0, new ListItem("--Select Client--", "0"));
    }

    public class CPriceListGroup
    {

        public Int64 ID { get; set; }
        public string No { get; set; }
        public string Product { get; set; }
        public string Qty { get; set; }
        public string Price { get; set; }
        public string Desc { get; set; }
        public string HSN { get; set; }
        public string Total { get; set; }
        public string txt_Client { get; set; }
        public string txt_TrnNo { get; set; }
    }
    [WebMethod]
    public static int AddDetails(List<CPriceListGroup> Item_Detail)
    {
        DataClassesDataContext DC = new DataClassesDataContext();

        try
        {
            //foreach (CPriceListGroup item in Item_Detail)
            //{
            //    SalesL SalesL_1 = new SalesL();
            //    SalesL_1.S_SrNo = Convert.ToInt16(item.No);
            //    SalesL_1.S_Product = item.Product;
            //    SalesL_1.S_Description = item.Desc;
            //    SalesL_1.S_HSN = item.HSN;
            //    SalesL_1.S_Qty = item.Qty;
            //    SalesL_1.S_UnitPrice = item.Price;
            //    SalesL_1.S_ClientId = Convert.ToInt16(item.txt_Client);
            //    SalesL_1.S_TrnNo = Convert.ToInt16(item.txt_TrnNo);
            //
            //    DC.SalesLs.Add(SalesL_1);
            //    DC.SaveChanges();
            //
            //}
        }
        catch (Exception ex)
        {
            return 3;
            throw ex;
        }
        return 1;
    }
    [WebMethod]
    public static int Header(
        string txt_TrnNo,
        string txt_Date,
        string txt_TillDate,
        string txt_Invoice,
        string txt_Client,
        string txt_Mobile,
        string txt_Address,
        string txt_total,
        string txt_Grandtotal
        )
    {

        //PraticalEntities DC = new PraticalEntities();
        //SalesH SalesH_1 = new SalesH();
        //
        //SalesH_1.S_TrnNo = Convert.ToInt16(txt_TrnNo);
        //SalesH_1.S_Date = txt_Date;
        //SalesH_1.S_TilDate = txt_TillDate;
        //SalesH_1.S_Invoice = txt_Invoice;
        //SalesH_1.S_ClientId = Convert.ToInt16(txt_Client);
        //SalesH_1.S_Mobile = txt_Mobile;
        //SalesH_1.S_Address = txt_Address;
        //SalesH_1.S_Total = txt_total;
        //SalesH_1.S_GrandTotal = txt_Grandtotal;
        //
        //DC.SalesHes.Add(SalesH_1);
        //DC.SaveChanges();
        //
       return 1;
    }
}