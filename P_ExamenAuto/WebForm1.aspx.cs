using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZedGraph;
using ZedGraph.Web;

namespace P_ExamenAuto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    MultiView1.ActiveViewIndex = 0;

            //}

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string instructor = DropDownList2.SelectedItem.ToString();
            string cursant = DropDownList1.SelectedItem.ToString();
            string calificativ = DropDownList3.SelectedItem.ToString();
            DateTime data = Convert.ToDateTime(tbData.Text);

            string[] i1 = instructor.Split(' ');
            string[] c1 = cursant.Split(' ');


            string sqlSelectInstructor = "select IdInstructor from tblInstructori where nume = '" + i1[0] + "' and prenume = '" + i1[1] + "'";
            string sqlSelectCursant = "select idCursant from tblCursanti where nume = '" + c1[0] + "' and prenume = '" + c1[1] + "'";

            SqlConnection conexiune = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=dbScoalaAuto;Integrated Security=True;Pooling=False");
            SqlCommand cmd = new SqlCommand(sqlSelectInstructor, conexiune);

            int n = 0;
            try
            {
                conexiune.Open();

                int idInstructor = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.CommandText = sqlSelectCursant;
                int idCursant = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.CommandText = "select 1 from tblExamene where idCursant = " + idCursant + " and calificativ = 'Admis'";
                int ok = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.CommandText = "select max(IdExamen) from tblExamene";
                int id = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.CommandText = "INSERT INTO tblExamene(IdExamen, IdCursant, IdInstructor, Calificativ, Data) VALUES (@IdExamen, @IdCursant, @IdInstructor, @Calificativ, @Data)";
                cmd.Parameters.Add("@IdExamen", SqlDbType.Int).Value = id + 1;
                cmd.Parameters.Add("@IdCursant", SqlDbType.Int).Value = idCursant;
                cmd.Parameters.Add("@IdInstructor", SqlDbType.Int).Value = idInstructor;
                cmd.Parameters.Add("@Calificativ", SqlDbType.NVarChar).Value = calificativ;
                cmd.Parameters.Add("@Data", SqlDbType.Date).Value = data;

                if(ok == 0)
                {
                    n = cmd.ExecuteNonQuery();
                }

                //tbMes.Text = "Insert realizat cu succes!";
            }
            catch(Exception ex)
            {
                tbMes.ForeColor = Color.Red;
                tbMes.Text = ex.Message;
            }
            finally
            {
                conexiune.Close();
                tbData.Text = string.Empty;
            }

            GridView2.DataBind();
            MultiView1.ActiveViewIndex = -1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime data = Calendar1.SelectedDate;
            tbData.Text = data.ToString();
        }

        protected void tbnProcedura_Click(object sender, EventArgs e)
        {
            string dropProc = "drop procedure CursantiDupaCalificativ";
            string creareProc = "create procedure CursantiDupaCalificativ" +
                "(@calificativ Nvarchar(10), @nrCursanti Int Output) as " +
                "select * from tblCursanti where idCursant in (select idCursant from tblExamene where calificativ = @calificativ); " +
                "select @nrCursanti = count(idCursant) from tblCursanti where idCursant in (select idCursant from tblExamene where calificativ = @calificativ); " +
                "return 0";

            SqlConnection conexiune = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=dbScoalaAuto;Integrated Security=True;Pooling=False");
            SqlCommand cmd = new SqlCommand(dropProc, conexiune);

            try
            {
                conexiune.Open();

                cmd.ExecuteNonQuery(); //stergere proc

                cmd.CommandText = creareProc;
                cmd.ExecuteNonQuery(); // creare proc

                cmd.CommandText = "CursantiDupaCalificativ";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@calificativ", SqlDbType.NVarChar);
                p1.Value = ddlCalificativ.SelectedItem.ToString();
                SqlParameter p2 = new SqlParameter("@nrCursanti", SqlDbType.Int);
                p2.Direction = ParameterDirection.Output;
                p2.Value = 0;
                cmd.Parameters.Add(p1);
                cmd.Parameters.Add(p2);

                SqlDataReader reader = cmd.ExecuteReader();
                GridView3.DataSource = reader;
                GridView3.DataBind();
                reader.Close();

                if (p1.Value.ToString().Equals("Admis"))
                {
                    lNrCursanti.Text = p2.Value + " cursanti au luat carnetul!";
                }
                else
                {
                    lNrCursanti.Text = p2.Value + " cursanti au picat examenul!";
                }
                
            }
            catch(Exception ex)
            {
                tbMes.Text = ex.Message;
            }

            MultiView1.ActiveViewIndex = 1;
        }
    }
}