using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_All_Invoice : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
            dd_Search_Client_Bind();
        }
    }


    public void dd_Search_Client_Bind()
    {
        var qry = db.SP_Get_Client_Master().ToList();
        if (qry.Count > 0)
        {

            dd_search_Client.DataSource = qry;
            dd_search_Client.DataTextField = "Client_Name";
            dd_search_Client.DataValueField = "Client_ID";
            dd_search_Client.DataBind();
            dd_search_Client.Items.Insert(0, new ListItem("--Select Client--", ""));
        }

    }

    public class CAdminUser
    {
        public string client_name { get; set; }
        public int id { get; set; }
        public int S_TrnNo { get; set; }
        public string S_Date { get; set; }
        public string S_TilDate { get; set; }
        public string S_Invoice { get; set; }
        public string S_Mobile { get; set; }
        public string S_Address { get; set; }
        public string S_Total { get; set; }

    }
    public void Bind()
    {
        List<CAdminUser> list = new List<CAdminUser>();
        list = (from o in db.SP_Get_SalesH().AsEnumerable()
                join b in db.SP_Get_Client_Master().ToList() on o.S_ClientId equals b.Client_ID
                select new CAdminUser
                {
                    id = o.id,
                    S_TrnNo = Convert.ToInt32(o.S_TrnNo),
                    S_Date = o.S_Date,
                    S_TilDate = o.S_TilDate,
                    S_Invoice = o.S_Invoice,
                    S_Mobile = o.S_Mobile,
                    S_Address = o.S_Address,
                    S_Total = o.S_Total,

                    client_name = b.Client_Name,
                }).ToList();

        var qry = list;
        if (qry.Count > 0)
        {
            grid_display.DataSource = qry;
            grid_display.DataBind();
        }
        else
        {
            grid_display.DataSource = qry;
            grid_display.DataBind();
        }
    }

    protected void btn_show_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        long TrnNo = long.Parse(btn.CommandArgument.ToString());

        Session["TrnNo"] = TrnNo;

        Response.Redirect("DisplayReport.aspx");
    }

    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        long TrnNo = long.Parse(btn.CommandArgument.ToString());

        Response.Redirect("Sales.aspx?trn=" + TrnNo + "");
    }

    protected void btn_printview_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        long TrnNo = long.Parse(btn.CommandArgument.ToString());

        Session["TrnNo"] = TrnNo;

        Response.Redirect("Print_View.aspx");
    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        //var qry = db.SP_Get_SalesH().ToList();

        List<CAdminUser> list = new List<CAdminUser>();
        list = (from o in db.SP_Get_SalesH().AsEnumerable()
                join b in db.SP_Get_Client_Master().ToList() on o.S_ClientId equals b.Client_ID
                select new CAdminUser
                {
                    id = o.id,
                    S_TrnNo = Convert.ToInt32(o.S_TrnNo),
                    S_Date = o.S_Date,
                    S_TilDate = o.S_TilDate,
                    S_Invoice = o.S_Invoice,
                    S_Mobile = o.S_Mobile,
                    S_Address = o.S_Address,
                    S_Total = o.S_Total,

                    client_name = b.Client_Name,
                }).ToList();

        var qry = list;

        if (txt_search_invoice.Text != "")
        {
            qry = qry.Where(r => r.S_Invoice == txt_search_invoice.Text).ToList();
        }
        if (txt_search_mobile.Text != "")
        {
            qry = qry.Where(r => r.S_Mobile == txt_search_mobile.Text).ToList();
        }
        if (txt_search_trnno.Text != "")
        {
            qry = qry.Where(r => r.S_TrnNo == Convert.ToInt32(txt_search_trnno.Text)).ToList();
        }
        if (dd_search_Client.SelectedValue != "")
        {
            qry = qry.Where(r => r.client_name == dd_search_Client.SelectedItem.Text).ToList();
        }

        if (qry.Count > 0)
        {
            grid_display.DataSource = qry;
            grid_display.DataBind();
        }
        else
        {
            grid_display.DataSource = qry;
            grid_display.DataBind();
        }
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txt_search_invoice.Text = "";
        txt_search_mobile.Text = "";
        txt_search_trnno.Text = "";
        dd_search_Client.SelectedIndex = 0;
        Bind();
    }
}

