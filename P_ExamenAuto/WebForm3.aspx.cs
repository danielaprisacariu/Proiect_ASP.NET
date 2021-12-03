using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P_ExamenAuto
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAduga_Click(object sender, EventArgs e)
        {
            string nume = tbNume.Text;
            string prenume = tbPrenume.Text;
            string cnp = tbCNP.Text;
            string telefon = tbTelefon.Text;

            string sqlSelectMax = "select max(IdInstructor) from [tblInstructori]";
            SqlConnection conexiune = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=dbScoalaAuto;Integrated Security=True;Pooling=False");
            SqlCommand cmd = new SqlCommand(sqlSelectMax, conexiune);

            int n = 0;
            try
            {
                conexiune.Open();

                int id = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.CommandText = "INSERT INTO [tblInstructori] ([IdInstructor], [Nume], [Prenume], [Telefon], [CNP]) VALUES (@IdInstructor, @Nume, @Prenume, @Telefon, @CNP)";
                cmd.Parameters.Add("@IdInstructor", SqlDbType.Int).Value = id + 1;
                cmd.Parameters.Add("@Nume", SqlDbType.NVarChar).Value = nume;
                cmd.Parameters.Add("@Prenume", SqlDbType.NVarChar).Value = prenume;
                cmd.Parameters.Add("@Telefon", SqlDbType.NChar).Value = telefon;
                cmd.Parameters.Add("@CNP", SqlDbType.NChar).Value = cnp;

                if(nume != "" && prenume !=  "" && telefon != "" && cnp != "")
                {
                    n = cmd.ExecuteNonQuery();                 
                }

                //tbMes.Text = "Inserare realizata cu succes!";
            }
            catch(Exception ex)
            {
                tbMes.ForeColor = Color.Red;
                tbMes.Text = ex.Message;
            }
            finally
            {
                conexiune.Close();
                tbNume.Text = string.Empty;
                tbPrenume.Text = string.Empty;
                tbCNP.Text = string.Empty;
                tbTelefon.Text = string.Empty;
            }

            GridView1.DataBind();
        }

  

        protected void btnInapoi_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("webForm1.aspx");
        }
    }
}