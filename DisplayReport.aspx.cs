using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DisplayReport : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        //setCookie("TrnNo", trnno);

        var trn = Session["TrnNo"].ToString();
        Bind(Convert.ToInt32(trn));
    }
    public class CAdminUser
    {
        public string client_name { get; set; }
    }
    public void Bind(int trn)
    {
        rpt_l.DataSource = db.SP_Get_SalesL().ToList().Where(r => r.S_TrnNo == trn).ToList();
        rpt_l.DataBind();

        var qry = db.SP_Get_SalesH().ToList().Where(r => r.S_TrnNo == trn).ToList();

        List<CAdminUser> list = new List<CAdminUser>();
        list = (from o in db.SP_Get_SalesH().AsEnumerable()
                join b in db.SP_Get_Client_Master().ToList() on o.S_ClientId equals b.Client_ID
                select new CAdminUser
                {
                    client_name = b.Client_Name,
                }).ToList();

        if (qry.Count > 0)
        {
            lbl_Invoice.Text = qry[0].S_Invoice;
            lbl_TrnNo.Text = qry[0].S_TrnNo.ToString();
            lbl_Date.Text = qry[0].S_Date;
            lbl_TilDate.Text = qry[0].S_TilDate;
            lbl_MobileNo.Text = qry[0].S_Mobile;
            lbl_client.Text = list[0].client_name.ToString();

            lbl_address.Text = qry[0].S_Address;
            lbl_mobile.Text = qry[0].S_Mobile;
        }

        var qry_1 = db.SP_Get_SalesL().Where(r => r.S_TrnNo == trn).ToList();
        if (qry_1.Count > 0)
        {
            int total = 0;
            for (int i = 0; i < qry_1.Count; i++)
            {
                total = total + Convert.ToInt32(qry_1[i].S_UnitPrice);
            }
            lbl_grand_total.Text = total.ToString();
            lbl_grand.Text = total.ToString();
        }
    }
}