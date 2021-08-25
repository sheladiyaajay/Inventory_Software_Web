using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Company_Master : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Grid_Bind();
            dd_bank_Bind();
        }
    }

    public void dd_bank_Bind()
    {
        var qry = db.SP_Get_Bank().ToList();
        if (qry.Count > 0)
        {
            dd_company_bank.DataSource = qry;
            dd_company_bank.DataTextField = "Bank_Name";
            dd_company_bank.DataValueField = "BankID";
            dd_company_bank.DataBind();
            dd_company_bank.Items.Insert(0, new ListItem("--Select--", ""));
        }
    }

    public void Grid_Bind()
    {
        var qry = db.SP_Get_Company_Master().ToList();
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
        hdn_id.Value = "0";
        txt_company_name.Text = "";
        txt_computer_addess.Text = "";
        txt_company_mobile.Text = "";
        dd_company_bank.Text = "";
        txt_company_Acc_no.Text = "";
        txt_company_ifsccode.Text = "";
        txt_company_bank_email_id.Text = "";

        btn_save.Text = "Save";
    }
    public void btnSave_Click(object sender, EventArgs e)
    {
        if (txt_company_name.Text != "" && txt_computer_addess.Text != "" && txt_company_mobile.Text != "" && txt_company_bank_email_id.Text != "")
        {
            if (btn_save.Text == "Save")
            {
                db.SP_Insert_Company_Master(txt_company_name.Text, txt_computer_addess.Text, txt_company_mobile.Text, Convert.ToInt64(dd_company_bank.SelectedValue), txt_company_Acc_no.Text, txt_company_ifsccode.Text, txt_company_bank_email_id.Text, Convert.ToDateTime(System.DateTime.Now), Convert.ToBoolean(dd_Isactive.SelectedValue));
                db.SubmitChanges();
            }
            if (btn_save.Text == "Update")
            {
                db.SP_Update_Company_Master(Convert.ToInt64(hdn_id.Value), txt_company_name.Text, txt_computer_addess.Text, txt_company_mobile.Text, Convert.ToInt64(dd_company_bank.SelectedValue), txt_company_Acc_no.Text, txt_company_ifsccode.Text, txt_company_bank_email_id.Text, Convert.ToDateTime(System.DateTime.Now), Convert.ToBoolean(dd_Isactive.SelectedValue));
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

        var qry = db.SP_Get_Company_Master().ToList().Where(r => r.CompanyID == ID).ToList();
        if (qry.Count > 0)
        {
            hdn_id.Value = qry[0].CompanyID.ToString();
            txt_company_name.Text = qry[0].Name;
            txt_computer_addess.Text = qry[0].Address;
            txt_company_mobile.Text = qry[0].Mobile;
            dd_company_bank.Text = qry[0].Bank.ToString();
            txt_company_Acc_no.Text = qry[0].Acc_No;
            txt_company_ifsccode.Text = qry[0].IFSC_Code;
            txt_company_bank_email_id.Text = qry[0].EmailID;
            if (qry[0].IsActive == true)
            {
                dd_Isactive.SelectedIndex = 1;
            }
            else
            {
                dd_Isactive.SelectedIndex = 2;
            }
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }


    protected void btn_add_Click(object sender, EventArgs e)
    {
        btn_save.Text = "Save";
        hdn_id.Value = "0";

        txt_company_name.Text = "";
        txt_computer_addess.Text = "";
        txt_company_mobile.Text = "";
        dd_company_bank.Text = "";
        txt_company_Acc_no.Text = "";
        txt_company_ifsccode.Text = "";
        txt_company_bank_email_id.Text = "";
    }

    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
        if (txt_search.Text != "")
        {
            var qry = db.SP_Get_Company_Master().ToList().Where(r => r.Mobile.Trim() == txt_search.Text.Trim()).ToList();
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