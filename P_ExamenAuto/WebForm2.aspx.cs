using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P_ExamenAuto
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAduga_Click(object sender, EventArgs e)
        {
            string sqlInsert = "INSERT INTO [tblCursanti] ([IdCursant], [Nume], [Prenume], [CNP], [Adresa], [Telefon]) VALUES (@IdCursant, @Nume, @Prenume, @CNP, @Adresa, @Telefon)";
            SqlConnection conexiune = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=dbScoalaAuto;Integrated Security=True;Pooling=False");
            SqlCommand cmdInsert = new SqlCommand(sqlInsert, conexiune);

            string nume = tbNume.Text;
            string prenume = tbPrenume.Text;
            string cnp = tbCNP.Text;
            string adresa = tbAdresa.Text;
            string telefon = tbTelefon.Text;

            string sqlSelectMax = "select max(IdCursant) from [tblCursanti]";
            SqlCommand cmdSelect = new SqlCommand(sqlSelectMax, conexiune);

            int n = 0;
            try
            {
                conexiune.Open();
                int id = Convert.ToInt32(cmdSelect.ExecuteScalar());

                cmdInsert.Parameters.Add("@IdCursant", SqlDbType.Int).Value = id + 1;
                cmdInsert.Parameters.Add("@Nume", SqlDbType.NVarChar).Value = nume;
                cmdInsert.Parameters.Add("@Prenume", SqlDbType.NVarChar).Value = prenume;
                cmdInsert.Parameters.Add("@CNP", SqlDbType.NChar).Value = cnp;
                cmdInsert.Parameters.Add("@Adresa", SqlDbType.NVarChar).Value = adresa;
                cmdInsert.Parameters.Add("@Telefon", SqlDbType.NChar).Value = telefon;

                if(!nume.Equals("") && !prenume.Equals("") && !cnp.Equals("") && !telefon.Equals(""))
                {
                    n = cmdInsert.ExecuteNonQuery();

                }

            }
            catch(Exception ex)
            {
                
            }
            finally
            {
                conexiune.Close();
                tbNume.Text = string.Empty;
                tbPrenume.Text = string.Empty;
                tbCNP.Text = string.Empty;
                tbAdresa.Text = string.Empty;
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