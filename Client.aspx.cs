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
        var qry = db.SP_Get_Client_Master().ToList();
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
        txt_client_name.Text = string.Empty;
        txt_mobile.Text = string.Empty;
        txt_address.Text = string.Empty;
    }
    public void btnSave_Click(object sender, EventArgs e)
    {
        if (txt_client_name.Text != "" && txt_mobile.Text != "" && txt_address.Text != "")
        {
            if (btn_save.Text == "Save")
            {
                db.SP_Insert_Client_Master(1, txt_client_name.Text, txt_mobile.Text, txt_address.Text);
                db.SubmitChanges();
            }
            if (btn_save.Text == "Update")
            {
                int id = Convert.ToInt32(hdn_id.Value);

                db.SP_Update_Client_Master(Convert.ToInt32(id), 1, txt_client_name.Text, txt_mobile.Text, txt_address.Text);
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
        var qry = db.SP_Get_Client_Master().Where(r => r.Client_ID == ID).ToList();
        if (qry.Count > 0)
        {
            hdn_id.Value = qry[0].Client_ID.ToString();
            txt_client_name.Text = qry[0].Client_Name.ToString();
            txt_mobile.Text = qry[0].Mobile;
            txt_address.Text = qry[0].Address.ToString();
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }


    protected void btn_add_Click(object sender, EventArgs e)
    {
        txt_client_name.Text = "";
        txt_mobile.Text = "";
        txt_address.Text = "";
        btn_save.Text = "Save";
        hdn_id.Value = "0";
    }

    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
        if (txt_search.Text != "")
        {
            var qry = db.SP_Get_Client_Master().ToList().Where(r => r.Mobile.Trim() == txt_search.Text.Trim()).ToList();
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