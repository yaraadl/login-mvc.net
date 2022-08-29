using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection sql_con = new SqlConnection(@"Data Source=CCIT-PC;Initial Catalog=Project;Integrated Security=True");

        if (DropDownList1.SelectedValue == "1")
        {
            string query = "SELECT * from tbl_admin Where username =  '" + TextBox1.Text.Trim() + "' and password = '" + TextBox2.Text.Trim() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, sql_con);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            if (dtbl.Rows.Count == 1)
            {
                Label3.Text = "Correct";
                Response.Redirect("Admin.aspx");

            }
            else
            {
                Label3.Text = "Invalid username or passowrd";
            }
        }
        else
        {
            string query = "SELECT * from tbl_user Where username =  '" + TextBox1.Text.Trim() + "' and password = '" + TextBox2.Text.Trim() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(query, sql_con);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            if (dtbl.Rows.Count == 1)
            {
                Label3.Text = "Correct";
                Response.Redirect("Home.aspx");

            }
            else
            {
                Label3.Text = "Invalid username or passowrd";
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}