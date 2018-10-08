using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

using System.Data;

namespace Web.Interfaces
{
    public partial class frmPrincipal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            btnGvwCreateExcel.Visible = false;
        }

        //metodo para refrescar despues de guardar algun registro
        private void refreshPage()
        {
            Response.Redirect("frmPrincipal.aspx");
        }

        //metodo para agregar relizar la consulta por partnumber o customer
        protected void btnCheckPartNum_Click(object sender, EventArgs e)
        {
            try
            {
                lblMsjCheckPartNum.Text = "";
                    Logica.Clases.clsClientes obclsClientes = new Logica.Clases.clsClientes();
                    DataSet dsConsulta = obclsClientes.stConsultarClientes(txtCheckPartNum.Text, txtCheckCus.Text);

                    if (dsConsulta.Tables[0].Rows.Count == 0) gvwDatos.DataSource = null;
                    else gvwDatos.DataSource = dsConsulta;

                    gvwDatos.DataBind();
                    btnGvwCreateExcel.Visible = true;
                }
            
            catch (Exception ex) 
            {
                lblMsjCheckPartNum.Text = ex.Message; 
            }
            
        }

        #region altas
        //metodo para agregar building
        protected void btnSaveBuilding_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                    Logica.Clases.clsClientes obclsClientes = new Logica.Clases.clsClientes();

                    lblMensaje.Text = obclsClientes.stInsertBuilding(txtNewBuilding.Text);
                    //cleanForm();
                    refreshPage();
                }
            catch (Exception ex) 
            { 
                lblMensaje.Text = ex.Message; 
            }
        }

        //metodo para agregar customer
        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                lblCustomer.Text = "";
                    string id = listBuildings.SelectedValue;
                    lblBuildings.Text = id;

                    Logica.Clases.clsClientes obclsClientes = new Logica.Clases.clsClientes();
                    lblCustomer.Text = obclsClientes.stInsertCustomer(id, txtCustomer.Text, txtPrefix.Text);
                    //cleanForm();
                    refreshPage();
                }

            catch (Exception ex) 
            { 
                lblCustomer.Text = ex.Message; 
            }
        }

        //metodo para agregar partnumber
        protected void btnSavePartNumber_Click(object sender, EventArgs e)
        {
            try
            {
                lblPartNumber.Text = "";
                string idCustomer = listCustomer.SelectedValue;
                lblCustomers.Text = idCustomer;

                bool check = false;
                if (rdbAviable.Checked != false)
                  {
                    check = true;
                  }
                else if (rdbNoAviable.Checked != false)
                  {
                    check = false;
                  }
                Logica.Clases.clsClientes obclsClientes = new Logica.Clases.clsClientes();
                lblPartNumber.Text = obclsClientes.stInsertPartNumber(txtPartNumber.Text, idCustomer, check);
                refreshPage();
           }

         catch (Exception ex)
         {
           lblCustomers.Text = ex.Message;
         }
    }
        #endregion

        //metodo para relizar la exportacion de la informacin del Dridview a excel
        protected void btnGvwToExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GvwPartsNumbers.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);


                gvwDatos.AllowPaging = false;

                gvwDatos.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in gvwDatos.HeaderRow.Cells)
                {
                    cell.BackColor = gvwDatos.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in gvwDatos.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gvwDatos.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gvwDatos.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                gvwDatos.RenderControl(hw);

                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
                
            }
            
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //verificamos que el control está renderizado
        }


    }
}