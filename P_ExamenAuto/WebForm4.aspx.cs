using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZedGraph;
using ZedGraph.Web;

namespace P_ExamenAuto
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView dv = (DataView)SqlDataSource4.Select(args);
            DataTable dt = dv.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            Cache["ScoalaACache"] = ds;

            this.ZedGraphWeb1.RenderGraph += new ZedGraphWebControlEventHandler(this.OnRenderGraph);
        }

        private void OnRenderGraph(ZedGraphWeb zedGraph, Graphics g, MasterPane masterPane)
        {
            DataSet ds = (DataSet)Cache["ScoalaACache"];
            GraphPane panel = masterPane[0];
            panel.Title.Text = "Numarul de examene pe fiecare luna";
            panel.XAxis.Title.Text = "Luni";
            panel.YAxis.Title.Text = "Nr examene";
            Color[] colors = {
                             Color.Red, Color.Yellow, Color.Green, Color.Blue,
                             Color.Purple,Color.Pink,Color.Plum,Color.Silver, Color.Salmon, Color.BlueViolet, Color.Brown, Color.DarkBlue
                         };

            List<string> listaX = new List<string>();
            PointPairList listaY = new PointPairList();
            int i = 0;
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                //tbMes.Text += row[1].ToString();
                if (int.Parse(row[1].ToString()) == 1)
                {
                    listaX.Add("Ianuarie"); // luni

                }
                else
                {
                    if (int.Parse(row[1].ToString()) == 2)
                    {
                        listaX.Add("Februarie"); // luni

                    }
                    else
                    {
                        if (int.Parse(row[1].ToString()) == 3)
                        {
                            listaX.Add("Martie"); // luni

                        }
                        else
                        {
                            if (int.Parse(row[1].ToString()) == 4)
                            {
                                listaX.Add("Aprilie"); // luni

                            }
                            else
                            {
                                if (int.Parse(row[1].ToString()) == 5)
                                {
                                    listaX.Add("Mai"); // luni

                                }
                                else
                                {
                                    if (int.Parse(row[1].ToString()) == 6)
                                    {
                                        listaX.Add("Iunie"); // luni

                                    }
                                    else
                                    {
                                        if (int.Parse(row[1].ToString()) == 7)
                                        {
                                            listaX.Add("Iulie"); // luni

                                        }
                                        else
                                        {
                                            if (int.Parse(row[1].ToString()) == 8)
                                            {
                                                listaX.Add("August"); // luni

                                            }
                                            else
                                            {
                                                if (int.Parse(row[1].ToString()) == 9)
                                                {
                                                    listaX.Add("Septembrie"); // luni

                                                }
                                                else
                                                {
                                                    if (int.Parse(row[1].ToString()) == 10)
                                                    {
                                                        listaX.Add("Octombrie"); // luni

                                                    }
                                                    else
                                                    {
                                                        if (int.Parse(row[1].ToString()) == 11)
                                                        {
                                                            listaX.Add("Noiembrie"); // luni

                                                        }
                                                        else
                                                        {
                                                            if (int.Parse(row[1].ToString()) == 12)
                                                            {
                                                                listaX.Add("Decembrie"); // luni

                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
                listaY.Add(0, int.Parse(row[0].ToString()), i++); // nr examene
            }

            BarItem myCurve = panel.AddBar("Curve 2", listaY, Color.Blue);
            myCurve.Bar.Fill = new Fill(Color.Blue, Color.BlueViolet);
            myCurve.Bar.Fill.Type = FillType.GradientByZ;
            myCurve.Bar.Fill.RangeMin = 0;
            myCurve.Bar.Fill.RangeMax = listaY.Count;
            panel.XAxis.Type = AxisType.Text;
            panel.XAxis.Scale.FontSpec.Angle = 90;
            panel.XAxis.Scale.TextLabels = listaX.ToArray();


        }
    }
}