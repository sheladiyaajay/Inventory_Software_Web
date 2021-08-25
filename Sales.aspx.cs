using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;

public partial class Sales_Master : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["trn"] != "")
            {
                var Trn = Request.QueryString["trn"];

                var qry = db.SP_Get_SalesH().ToList().Where(r => r.S_TrnNo == Convert.ToInt32(Trn)).ToList();
                if (qry.Count > 0)
                {
                    txt_TrnNo.Text = Convert.ToInt32(qry[0].S_TrnNo).ToString();
                    txt_Date.Text = qry[0].S_Date;
                    txt_TillDate.Text = qry[0].S_TilDate;
                    txt_Invoice.Text = qry[0].S_Invoice;
                    txt_Client.SelectedValue = Convert.ToInt32(qry[0].S_ClientId).ToString();
                    txt_Mobile.Text = qry[0].S_Mobile;
                    txt_Address.Text = qry[0].S_Address;
                }

                var qry_1 = db.SP_Get_SalesL().ToList().Where(r => r.S_TrnNo == Convert.ToInt32(Trn)).ToList();
                if (qry_1.Count > 0)
                {
                    DataTable dataTable = new DataTable();
                    dataTable.Columns.Add("id");
                    dataTable.Columns.Add("Product");
                    dataTable.Columns.Add("Description");
                    dataTable.Columns.Add("HSN");
                    dataTable.Columns.Add("Qty");
                    dataTable.Columns.Add("Price");
                    dataTable.Columns.Add("UnitPrice");

                    for (int i = 0; i < qry_1.Count; i++)
                    {
                        dataTable.Rows.Add(qry_1[i].id, qry_1[i].S_Product, qry_1[i].S_Description, qry_1[i].S_HSN, qry_1[i].S_Qty, qry_1[i].S_Price, qry_1[i].S_UnitPrice);
                    }
                    GridData.DataSource = dataTable;
                    GridData.DataBind();
                }
            }

            ddClient(); dd_product_Bind();
            MaxTrn_no();
            MaxInvoice_no();

            if (ViewState["Details"] == null)
            {
                DataTable dataTable = new DataTable();
                //dataTable.Columns.Add("id");
                dataTable.Columns.Add("Product");
                dataTable.Columns.Add("Description");
                dataTable.Columns.Add("HSN");
                dataTable.Columns.Add("Qty");
                dataTable.Columns.Add("Price");
                dataTable.Columns.Add("UnitPrice");
                ViewState["Details"] = dataTable;
            }
        }
    }
    public void MaxTrn_no()
    {
        var qry = db.SP_Get_SalesH().ToList().Max(r => r.S_TrnNo);
        var max = qry + 1;
        if (max == null)
        {
            max = 100;
        }
        txt_TrnNo.Text = max.ToString();
        txt_Date.Text = System.DateTime.Now.ToString("dd/MM/yyyy");
    }
    public void MaxInvoice_no()
    {
        var qry = db.SP_Get_SalesH().ToList().Max(r => r.S_Invoice);
        int max_inv = Convert.ToInt32(qry) + Convert.ToInt32(1);
        if (max_inv == null)
        {
            max_inv = 1;
        }
        txt_Invoice.Text = max_inv.ToString();
    }

    public void dd_product_Bind()
    {
        dd_product.DataSource = db.SP_Get_Product_master().ToList();
        dd_product.DataTextField = "Product_Name";
        dd_product.DataValueField = "Product_ID";
        dd_product.DataBind();
        dd_product.Items.Insert(0, new ListItem("--Select Product--", ""));
    }

    public void ddClient()
    {
        txt_Client.DataSource = db.SP_Get_Client_Master().ToList();
        txt_Client.DataTextField = "Client_Name";
        txt_Client.DataValueField = "Client_ID";
        txt_Client.DataBind();
        txt_Client.Items.Insert(0, new ListItem("--Select Client--", ""));
    }


    protected void btn_add_Click(object sender, EventArgs e)
    {
        dt = (DataTable)ViewState["Details"];

        if (txt_qty.Text == "")
        {
            txt_qty.Text = "0";
        }
        if (txt_price.Text == "")
        {
            txt_price.Text = "0";
        }
        if (txt_qty.Text != "" && txt_price.Text != "")
        {
            var sum_finalAmt = Convert.ToDecimal(txt_qty.Text) * Convert.ToDecimal(txt_price.Text);
            dt.Rows.Add(dd_product.SelectedItem.Text, txt_desc.Text, txt_hsn.Text, txt_qty.Text, txt_price.Text, sum_finalAmt);
            ViewState["Details"] = dt;
            GridData.DataSource = dt;
            GridData.DataBind();

            btn_submi.Visible = true;
        }

        dd_product.SelectedIndex = 0;
        txt_desc.Text = "";
        txt_hsn.Text = "";
        txt_qty.Text = "";
        txt_price.Text = "";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
    }

    int Total = 0;
    protected void GridData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_unit_price = (Label)e.Row.FindControl("lbl_unit_price");
            Total += Convert.ToInt32(lbl_unit_price.Text);
            ViewState["Total_Amt"] = Total;
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lbl_unit_price_total = (Label)e.Row.FindControl("lbl_unit_price_total");
            lbl_unit_price_total.Text = Total.ToString();
        }
    }

    protected void btn_submi_Click(object sender, EventArgs e)
    {
        Header_Save();
        for (int i = 0; i < GridData.Rows.Count; i++)
        {
            Label lbl_product = (Label)GridData.Rows[i].FindControl("lbl_product");
            Label lbl_desc = (Label)GridData.Rows[i].FindControl("lbl_desc");
            Label lbl_hsn = (Label)GridData.Rows[i].FindControl("lbl_hsn");
            Label lbl_qty = (Label)GridData.Rows[i].FindControl("lbl_qty");
            Label lbl_price = (Label)GridData.Rows[i].FindControl("lbl_price");
            Label lbl_unit_price = (Label)GridData.Rows[i].FindControl("lbl_unit_price");

            int count = i;

            db.SP_Insert_SalesL(count + 1, lbl_product.Text, lbl_desc.Text, lbl_hsn.Text, lbl_qty.Text, lbl_price.Text, lbl_unit_price.Text, Convert.ToInt32(txt_Client.SelectedValue), Convert.ToInt32(txt_TrnNo.Text));
            db.SubmitChanges();
        }
        Response.Redirect("Display_All_Invoice.aspx");
    }

    public void Header_Save()
    {
        if (txt_TrnNo.Text != "" && txt_Date.Text != "" && txt_TillDate.Text != "" && txt_Invoice.Text != "" && txt_Mobile.Text != "" && txt_Address.Text != "")
        {
            db.SP_Insert_SalesH(Convert.ToInt32(txt_TrnNo.Text), txt_Date.Text, txt_TillDate.Text, txt_Invoice.Text, Convert.ToInt32(txt_Client.SelectedValue), txt_Mobile.Text, txt_Address.Text, "0", "0");
            db.SubmitChanges();
        }
    }


    protected void dd_product_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dd_product.SelectedValue != "")
        {
            var qry = db.SP_Get_Product_master().ToList().Where(r => r.Product_ID == Convert.ToInt32(dd_product.SelectedValue)).ToList();
            if (qry.Count > 0)
            {
                txt_hsn.Text = qry[0].HSN_SAC;
                txt_price.Text = qry[0].Unit_Price.ToString();
            }
        }
        if (dd_product.SelectedIndex == 0)
        {
            txt_hsn.Text = "";
            txt_price.Text = "";
        }
    }

    protected void txt_Client_SelectedIndexChanged(object sender, EventArgs e)
    {
        var qry = db.SP_Get_Client_Master().ToList().Where(r => r.Client_ID == Convert.ToInt32(txt_Client.SelectedValue)).ToList();
        if (qry.Count > 0)
        {
            txt_Mobile.Text = qry[0].Mobile;
            txt_Address.Text = qry[0].Address;
        }
    }

    protected void GridData_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        int index = Convert.ToInt32(e.RowIndex);
        DataTable dt = ViewState["Details"] as DataTable;
        dt.Rows[index].Delete();
        ViewState["Details"] = dt;
        GridData.DataSource = dt;
        GridData.DataBind();
    }



    protected void BtnEdit_Click(object sender, EventArgs e)
    {

    }

    protected void btn_Remove_Click(object sender, ImageClickEventArgs e)
    {
        Button btn = (Button)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label lbl_unit_price = (Label)gvr.FindControl("lbl_unit_price");
        Label lbl_unit_price_total = (Label)gvr.FindControl("lbl_unit_price_total");
        //Get rowindex
        int rowindex = gvr.RowIndex;

        DataTable dt = ViewState["Details"] as DataTable;
        dt.Rows[rowindex].Delete();
        ViewState["Details"] = dt;
        GridData.DataSource = dt;
        GridData.DataBind();

        if (ViewState["Total_Amt"] != "")
        {
            decimal Total_amount = Convert.ToDecimal(ViewState["Total_Amt"]) - Convert.ToDecimal(lbl_unit_price.Text);

        }
    }

    protected void btn_remove_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label lbl_unit_price = (Label)gvr.FindControl("lbl_unit_price");
        Label lbl_unit_price_total = (Label)gvr.FindControl("lbl_unit_price_total");
        //Get rowindex
        int rowindex = gvr.RowIndex;

        DataTable dt = ViewState["Details"] as DataTable;
        dt.Rows[rowindex].Delete();
        ViewState["Details"] = dt;
        GridData.DataSource = dt;
        GridData.DataBind();

        if (ViewState["Total_Amt"] != "")
        {
            decimal Total_amount = Convert.ToDecimal(ViewState["Total_Amt"]) - Convert.ToDecimal(lbl_unit_price.Text);

        }

    }
}