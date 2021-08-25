using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            Grid_Bind();
        }
    }
    public void Grid_Bind()
    {
        var qry = db.SP_Get_Product_master().ToList();
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
    public void Clear()
    {
        btn_save.Text = "Save";
        txtHAN_SAC.Text = string.Empty;
        txtProduct_Name.Text = string.Empty;
        txtQty.Text = string.Empty;
        txtUnit_Price.Text = string.Empty;
    }
    public void btnSave_Click(object sender, EventArgs e)
    {
        if(txtProduct_Name.Text!="" && txtHAN_SAC.Text!="" && txtUnit_Price.Text!="")
        {
            if (txtQty.Text == "")
            {
                txtQty.Text = "0";
            }
            if (btn_save.Text == "Save")
            {
                db.SP_Insert_Product_master("1", txtProduct_Name.Text, txtHAN_SAC.Text, Convert.ToInt32(txtQty.Text), Convert.ToInt32(txtUnit_Price.Text));
                db.SubmitChanges();
            }
            if (btn_save.Text == "Update")
            {
                int id = Convert.ToInt32(hdn_id.Value);

                db.SP_Update_Product_master(Convert.ToInt32(id), "1", txtProduct_Name.Text, txtHAN_SAC.Text, Convert.ToInt32(txtQty.Text), Convert.ToInt32(txtUnit_Price.Text));
                db.SubmitChanges();
            }
        }
        
        Clear();
        Grid_Bind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
    }
   
    public void BtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        long ID = long.Parse(btn.CommandArgument.ToString());
       
        btn_save.Text = "Update";
        var qry = db.SP_Get_Product_master().Where(r => r.Product_ID == ID).ToList();
        if (qry.Count > 0)
        {
            hdn_id.Value = qry[0].Product_ID.ToString();
            txtQty.Text = qry[0].Qty.ToString();
            txtProduct_Name.Text = qry[0].Product_Name;
            txtUnit_Price.Text = qry[0].Unit_Price.ToString();
            txtHAN_SAC.Text = qry[0].HSN_SAC;
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }


    protected void btn_add_Click(object sender, EventArgs e)
    {
        hdn_id.Value = "0";
        txtQty.Text = "";
        txtProduct_Name.Text = "";
        txtUnit_Price.Text = "";
        txtHAN_SAC.Text = "";
        btn_save.Text = "Save";
    }

    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
        if (txt_search.Text != "")
        {
            var qry = db.SP_Get_Product_master().ToList().Where(r => r.Product_Name.ToLower().Trim() == txt_search.Text.ToLower().Trim()).ToList();
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
        else
        {
            Grid_Bind();
        }
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        txt_search.Text = "";
        Grid_Bind();
    }
}