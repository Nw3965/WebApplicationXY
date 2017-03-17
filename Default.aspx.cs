using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace WebApplicationXY
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnCV_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source =DYNAMICSAX-PC ;Initial Catalog=Howardtest ;Integrated Security=True");
           string path = Server.MapPath("./");

            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                string name = "./" + FileUpload1.FileName; 
                string ss = "insert into Whiteboad (EmployeeID,Name,Company,Department,Workplace,Term,CV,Note) Values('"+txtID.Text+ "','" + txtName.Text + "','" + txtComp.Text + "','" + txtDepart.Text + "','" + txtWork.Text + "','" + txtTerm.Text + "','"  + "','"+name+"'    )";
                SqlCommand cmd = new SqlCommand(ss, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Updated with Success!";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label1.Text = "Please select file";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void txtComp_TextChanged(object sender, EventArgs e)
        {

        }
        protected void txtWork_TextChanged(object sender, EventArgs e)
        {
        }
        protected void Gridview1(object sender, EventArgs e)
        {
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           if (e.CommandName=="Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "fileName=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("./") + e.CommandArgument);             
                Response.End();
            }
       }
        protected void LinkButton1_DataBinding(object sender, EventArgs e)
        {
        }
    }
}