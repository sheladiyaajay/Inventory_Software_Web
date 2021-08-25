using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Print_View : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        //lbl_company_name.InnerText = "Mahadev Xerox";
        //lbl_company_address.InnerText = "Madhay sahkari bank opp old yad road";
        //lbl_company_bank_details.InnerText = "Company's Bank Details";
        //lbl_company_bank_name.InnerText = "CANARA BANK";
        //lbl_company_bank_acno.InnerText = "34292010000002";
        //lbl_company_bank_ifsc_code.InnerText = "CNRBB0003429";
        //lbl_company_bank_mobile_no.InnerText = "9925265244";
        //lbl_company_bank_email_id.InnerText = "mahadevxerox@gmail.com";
        //lbl_signatory_owner.Text = "Mahadev Xerox";

        Company_Details();
        var trn = Session["TrnNo"].ToString();
        Bind(Convert.ToInt32(trn));
    }

    public void Company_Details()
    {
        var qry = db.SP_Get_Company_Master().ToList().Where(r => r.CompanyID == Convert.ToInt64(1)).ToList();
        if (qry.Count > 0)
        {
            lbl_company_name.InnerText = qry[0].Name;
            lbl_company_address.InnerText = qry[0].Address;
            lbl_company_bank_details.InnerText = "Company's Bank Details";

            var qry_1 = db.SP_Get_Bank().Where(r => r.BankID == qry[0].Bank).ToList();
            if (qry_1.Count > 0)
            {
                lbl_company_bank_name.InnerText = qry_1[0].Bank_Name.ToString();
            }
            lbl_company_bank_acno.InnerText = qry[0].Acc_No;
            lbl_company_bank_ifsc_code.InnerText = qry[0].IFSC_Code;
            lbl_company_bank_mobile_no.InnerText = qry[0].Mobile;
            lbl_company_bank_email_id.InnerText = qry[0].EmailID;
            lbl_signatory_owner.Text = qry[0].Name;

        }
    }

    public class CAdminUser
    {
        public string client_name { get; set; }
    }
    public void Bind(int trn)
    {
        grid_display.DataSource = db.SP_Get_SalesL().ToList().Where(r => r.S_TrnNo == trn).ToList();
        grid_display.DataBind();

        var qry = db.SP_Get_SalesH().ToList().Where(r => r.S_TrnNo == trn).ToList();

        List<CAdminUser> list = new List<CAdminUser>();
        list = (from o in db.SP_Get_SalesH().AsEnumerable().Where(r => r.S_TrnNo == trn)
                join b in db.SP_Get_Client_Master().ToList() on o.S_ClientId equals b.Client_ID
                select new CAdminUser
                {
                    client_name = b.Client_Name,

                }).ToList();

        if (qry.Count > 0)
        {
            lbl_invoiceno.InnerText = qry[0].S_Invoice;
            //lbl_TrnNo.Text = qry[0].S_TrnNo.ToString();
            lbl_date.InnerText = qry[0].S_Date;
            //lbl_TilDate.Text = qry[0].S_TilDate;



            lbl_buyer_name.InnerText = list[0].client_name.ToString();
            lbl_buyer_addess.InnerText = qry[0].S_Address;
            lbl_buyer_mobile.InnerText = qry[0].S_Mobile;

            //lbl_address.Text = qry[0].S_Address;
            //lbl_mobile.Text = qry[0].S_Mobile;
        }

        var qry_1 = db.SP_Get_SalesL().Where(r => r.S_TrnNo == trn).ToList();
        if (qry_1.Count > 0)
        {
            int total = 0;
            for (int i = 0; i < qry_1.Count; i++)
            {
                total = total + Convert.ToInt32(qry_1[i].S_UnitPrice);
            }

        }
    }
    int total = 0;
    protected void grid_display_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_unitprice = (Label)e.Row.FindControl("lbl_unitprice");
            total += Convert.ToInt32(lbl_unitprice.Text);
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lbl_total_unitprice = (Label)e.Row.FindControl("lbl_total_unitprice");
            lbl_total_unitprice.Text = total.ToString();

            var number = ConvertNumbertoWords(Convert.ToInt64(total));
            total_words.Text = number + " RUPEES ONLY";

        }
    }

    public string ConvertNumbertoWords(long number)
    {
        if (number == 0) return "ZERO";
        if (number < 0) return "minus " + ConvertNumbertoWords(Math.Abs(number));
        string words = "";
        if ((number / 1000000) > 0)
        {
            words += ConvertNumbertoWords(number / 100000) + " LAKES ";
            number %= 1000000;
        }
        if ((number / 1000) > 0)
        {
            words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
            number %= 1000;
        }
        if ((number / 100) > 0)
        {
            words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
            number %= 100;
        }
        //if ((number / 10) > 0)  
        //{  
        // words += ConvertNumbertoWords(number / 10) + " RUPEES ";  
        // number %= 10;  
        //}  
        if (number > 0)
        {
            if (words != "") words += "AND ";
            var unitsMap = new[]
            {
            "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN"
        };
            var tensMap = new[]
            {
            "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"
        };
            if (number < 20) words += unitsMap[number];
            else
            {
                words += tensMap[number / 10];
                if ((number % 10) > 0) words += " " + unitsMap[number % 10];
            }
        }
        return words;
    }

}