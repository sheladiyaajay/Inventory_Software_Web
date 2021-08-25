using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Client_Count();
            Product_Count();
            Total_Invoice_Count();
        }
    }
    public void Client_Count()
    {
        var qry = db.SP_Get_Client_Master().ToList();
        if (qry.Count > 0)
        {
            lbl_client.Text = qry.Count.ToString();
        }
        else
        {
            lbl_client.Text = "0";
        }
    }
    public void Product_Count()
    {
        var qry = db.SP_Get_Product_master().ToList();
        if (qry.Count > 0)
        {
            lbl_product.Text = qry.Count.ToString();
        }
        else
        {
            lbl_product.Text = "0";
        }
    }
    public void Total_Invoice_Count()
    {
        var qry = db.SP_Get_SalesH().ToList();
        if (qry.Count > 0)
        {
            lbl_invoice_count.Text = qry.Count.ToString();
        }
        else
        {
            lbl_invoice_count.Text = "0";
        }
    }
}