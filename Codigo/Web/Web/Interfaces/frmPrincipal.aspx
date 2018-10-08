<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPrincipal.aspx.cs" Inherits="Web.Interfaces.frmPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <link href="../Style/Style.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ejercicio Jabil</title>

    <style type="text/css">
        div.centerTable {
            text-align:center;
        }
        div.centerTable table {
          margin:0 auto;
          text-align:center;
        }
    </style>
</head>
<body>
    <h1 style="text-align:center">Materials</h1>
    <form id="form1" runat="server">
        <div class="centerTable">
         <table style="background-color:#D0D3D4;height:120px;width:550px">
            <tr>
              <td><strong>Add Building</strong></td>
            </tr>
            <tr>
                <td style="color:black">Add New Building:</td>
                <td>
                    <asp:TextBox ID="txtNewBuilding" runat="server" CssClass="form-control" placeholder="New Building"></asp:TextBox>
                </td>
            </tr>
 
            <tr>
                <td>
                    <asp:Button ID="btnSaveBuilding" runat="server" Text="Save Building" OnClick="btnSaveBuilding_Click" CssClass="btn btn-dark"/>
                    
                </td>
            </tr>
        </table>
</div>
        <div style="height:12px" class="centerTable">
            <table style="height:12px">
             <tr>
                <td>                 
                    <asp:Label ID="lblMensaje" runat="server" style="color: #FF3300; font-weight: 700"></asp:Label>                 
                </td>
            </tr>
            </table>
        </div><br />

        <div class="centerTable">
            <table style="background-color:#D0D3D4;height:240px;width:550px"">
              <tr>
                <td><strong>Add Customer</strong></td>
             </tr>
            <tr>
                <td style="color:black">Customer:</td>
                <td>
                    <asp:TextBox ID="txtCustomer" runat="server" CssClass="form-control" placeholder="New Customer"></asp:TextBox>                  
                   
                </td>                   
            </tr>

            <tr>
                <td style="color:black">List Buildings:</td>
                <td>                  
                <asp:DropDownList CssClass="form-control" AppendDataBoundItems="true" ID="listBuildings" runat="server" DataSourceID="dsBuildings" DataTextField="Building" DataValueField="PKBuilding">
                    <asp:ListItem>Select Building</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsBuildings" runat="server" ConnectionString="<%$ ConnectionStrings:MaterialsConnectionString %>" SelectCommand="SELECT * FROM [Buildings] ORDER BY [Building]"></asp:SqlDataSource>
                    <asp:Label ID="lblBuildings" runat="server" Text="Label" Visible="False"></asp:Label>

                </td>
            </tr>
                <tr>
                    <td style="color:black">Prefix:</td>
                    <td>
                    <asp:TextBox ID="txtPrefix" runat="server" CssClass="form-control" placeholder="New Prefix"></asp:TextBox>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSaveCustomer" runat="server" Text="Save Customer" OnClick="btnSaveCustomer_Click" CssClass="btn btn-dark"/>
                    </td>
                </tr>
            </table>

            <div style="height:12px" class="centerTable">
                <table style="height:12px">
               <tr>
                <td>                 
                    <asp:Label ID="lblCustomer" runat="server" style="color: #FF3300; font-weight: 700"></asp:Label>                 
                </td>
            </tr>
                </table>
            </div>
        </div><br />

        <div class="centerTable">
         <table style="background-color:#D0D3D4;height:220px;width:550px">
             <tr>
                <td><strong>Add Part Number</strong></td>
             </tr>
             <tr>
                <td style="color:black">PartsNumbers:</td>
                <td>
                    <asp:TextBox ID="txtPartNumber" runat="server" CssClass="form-control" placeholder="New Part Number"></asp:TextBox>
                </td>                   
            </tr>

                <tr>
                    <td style="color:black">List Customers:</td>
                    <td>
                        <asp:DropDownList CssClass="form-control" AppendDataBoundItems="true" ID="listCustomer" runat="server" DataSourceID="dsCustomers" DataTextField="Customer" DataValueField="PKCustomers">
                            <asp:ListItem>Select Customer</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:MaterialsConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                        <asp:Label ID="lblCustomers" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>                 
                </tr>
                <tr>
                    <td></td><td style="text-align:center">
                        <asp:Label ID="Aviable" runat="server" Text="Available"></asp:Label>
                        <asp:RadioButton ID="rdbAviable" runat="server" GroupName="PartNumber"/>
                    
                        <asp:Label ID="NoAviable" runat="server" Text="No Available"></asp:Label>
                        <asp:RadioButton ID="rdbNoAviable" runat="server" GroupName="PartNumber"/>
                     </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSavePartNumber" runat="server" Text="Save Part Number" OnClick="btnSavePartNumber_Click" CssClass="btn btn-dark"/>
                    </td>
                </tr>

                </table>

            <div style="height:12px" class="centerTable">
              <table style="height:12px">
                <tr>
                  <td>                 
                    <asp:Label ID="lblPartNumber" runat="server" style="color: #FF3300; font-weight: 700"></asp:Label>                 
                  </td>
               </tr>
                </table>
            </div>
        </div><br />

        <div class="centerTable">
         <table style="background-color:#D0D3D4;height:220px;width:550px">

                <tr>
                    <td><strong>Consult parts numbers</strong></td>
                    </tr>

                 <tr>
                  <td style="color:black">PartNumbers:</td> 
                      <td>   
                    <asp:TextBox ID="txtCheckPartNum" runat="server" CssClass="form-control" placeholder="Consult by part number"></asp:TextBox>
                      </td>                      
                </tr>

             <tr>
                <td style="color:black">Customer:</td> 
                 <td>
               <asp:TextBox ID="txtCheckCus" runat="server" CssClass="form-control" placeholder="Consult by costumer"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCheckPartNum" runat="server" Text="Generate tablePart Number" OnClick="btnCheckPartNum_Click" CssClass="btn btn-dark"/>                   
                </td>
            </tr>
                

            </table>
        </div>

        <div class="centerTable">
            <table>
              <tr>
                <td class="auto-style1">
                    <asp:GridView ID="gvwDatos" runat="server" AutoGenerateColumns="False" Width="95%" CellPadding="4" GridLines="None" 
                        EmptyDataText="No se encontraron registros" BackColor="White" BorderColor="#336666" BorderStyle="Double" 
                        BorderWidth="3px" AllowPaging="true">
                        <Columns>
                            <asp:BoundField HeaderText="PartsNumbers" DataField="PartNumber" />
                            <asp:BoundField HeaderText="Available" DataField="Available" />
                            <asp:BoundField HeaderText="Customers" DataField="Customer" />
                            <asp:BoundField HeaderText="Buildings" DataField="Building" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                    <br />
                    <asp:Button ID="btnGvwCreateExcel" runat="server" OnClick="btnGvwToExcel_Click" Text="Export Excel" CssClass="btn btn-dark"/>
                </td>
            </tr>
            </table>
        </div><br />

      <div style="height:12px" class="centerTable">
            <table style="height:12px">
             <tr>
                <td>                 
                    <asp:Label ID="lblMsjCheckPartNum" runat="server" style="color: #FF3300; font-weight: 700"></asp:Label>                 
                </td>
            </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">


    //validacion de formulario Buildings
    $("#btnSaveBuilding").click(function () {
        var buildingField = $("#txtNewBuilding").val().trim();
        //validacion para no aceptar un el textbox txtNewBuilding vacio ni envia solo esapcios en blanco
        if (buildingField === '') {
            alert("The building field is required");
            return false;
        }
            //validacion de caracterec aceptados en textbox txtNewBuilding
        else if (buildingField.length > 10) {
            alert("The length of the building field must not be greater than 10 characters");
            return false;
        }
        else {
            alert("Save record");
        }
    });
    //Texbox txtNewBuilding no permite numeros
    $("#txtNewBuilding").keypress(function (key) {
        window.console.log(key.charCode)
        if ((key.charCode < 97 || key.charCode > 122)//letras mayusculas
            && (key.charCode < 65 || key.charCode > 90) //letras minusculas
            && (key.charCode != 45) //retroceso
            && (key.charCode != 241) //ñ
             && (key.charCode != 209) //Ñ
             && (key.charCode != 32) //espacio
             && (key.charCode != 225) //á
             && (key.charCode != 233) //é
             && (key.charCode != 237) //í
             && (key.charCode != 243) //ó
             && (key.charCode != 250) //ú
             && (key.charCode != 193) //Á
             && (key.charCode != 201) //É
             && (key.charCode != 205) //Í
             && (key.charCode != 211) //Ó
             && (key.charCode != 218) //Ú

            )
            return false;
    });
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //validacion de formulario Customer
    $("#btnSaveCustomer").click(function () {

        var customerField = $("#txtCustomer").val().trim();
        var prefixField = $("#txtPrefix").val().trim();
        var listBuildings = $("#listBuildings").val().trim();

        //validacion para no aceptar un el textbox txtCustomer vacio ni envia solo esapcios en blanco
        if (customerField === '') {
            alert("The customer field is required");
            return false;
        }
            //validacion de caracterec aceptados en textbox txtCustomer
        else if (customerField.length > 35) {
            alert("The length of the customer field must not be greater than 35 characters");
            return false;
        }
            //validacion para no aceptar un el textbox txtPrefix vacio ni envia solo esapcios en blanco
        else if (prefixField === '') {
            alert("The prefix field is required");
            return false;
        }
            //validacion de caracterec aceptados en textbox txtPrefix
        else if (customerField.length > 5) {
            alert("The length of the prefix field must not be greater than 5 characters");
            return false;
        }
            //validacion de rabio DropDownList listBuildings
        else if (listBuildings === "Select Building") {
            alert("Please select a value from the list buildings");
            return false;
        }
        else {
            alert("Save record");
        }
    });

    //Texbox txtCustomer no permite numeros
    $("#txtCustomer").keypress(function (key) {
        window.console.log(key.charCode)
        if ((key.charCode < 97 || key.charCode > 122)//letras mayusculas
            && (key.charCode < 65 || key.charCode > 90) //letras minusculas
            && (key.charCode != 45) //retroceso
            && (key.charCode != 241) //ñ
             && (key.charCode != 209) //Ñ
             && (key.charCode != 32) //espacio
             && (key.charCode != 225) //á
             && (key.charCode != 233) //é
             && (key.charCode != 237) //í
             && (key.charCode != 243) //ó
             && (key.charCode != 250) //ú
             && (key.charCode != 193) //Á
             && (key.charCode != 201) //É
             && (key.charCode != 205) //Í
             && (key.charCode != 211) //Ó
             && (key.charCode != 218) //Ú
            )
            return false;
    });
    /////////////////////////////////////////////////////////////////////////////////////////
    //validacion de formulario Part Number
    $("#btnSavePartNumber").click(function () {

        var partNumberField = $("#txtPartNumber").val().trim();
        var listCustomer = $("#listCustomer").val().trim();
        var checkRadioBtnAv = $("#rdbAviable:checked").length;
        var checkRadioBtnsNoAc = $("#rdbNoAviable:checked").length;

        //validacion para no aceptar un el textbox txtPartNumber vacio ni envia solo esapcios en blanco
        if (partNumberField === '') {
            alert("The part number field is required");
            return false;
        }
            //validacion de caracterec aceptados en textbox txtPartNumber
        else if (partNumberField.length > 50) {
            alert("The length of the part number field must not be greater than 50 characters");
            return false;
        }
            //validacion de rabio DropDownList listCustomer
        else if (listCustomer === "Select Customer") {
            alert("Please select a value from the list buildings");
            return false;
        }
            //validacion de rabio button rdbAviable
        else if (checkRadioBtnAv == 0) {
            alert("Please select aviable or no aviable");
            return false;

        }
            //validacion de rabio button rdbAviable
        else if (checkRadioBtnsNoAc == 0) {
            alert("Please select aviable or no aviable");
            return false;

        }
        else {
            alert("Save record");
        }
    });
    ////////////////////////////////////////////////////////////////////////////

    //validacion de consulta de numeros de parte
    $("#btnCheckPartNum").click(function () {
        var checkPartNumField = $("#txtCheckPartNum").val().trim();
        var checkCusField = $("#txtCheckCus").val().trim();

        //validacion para no aceptar un el textbox txtNewBuilding vacio ni envia solo esapcios en blanco
        if (checkPartNumField === '' && checkCusField === '') {
            alert("The part number or customer field is required");
            return false;
        }
            //validacion de caracterec aceptados en textbox txtNewBuilding
        else if (checkPartNumField.length > 50) {
            alert("The length of the part number field must not be greater than 50 characters");
            return false;
        }
            //validacion de caracterec aceptados en textbox txtCheckCus
        else if (checkCusField.length > 35) {
            alert("The length of the customer field must not be greater than 35 characters");
            return false;
        }
        else {
            alert("Loading table consult parts numbers");
        }
    });
    //Texbox txtCheckCus no permite numeros
    $("#txtCheckCus").keypress(function (key) {
        window.console.log(key.charCode)
        if ((key.charCode < 97 || key.charCode > 122)//letras mayusculas
            && (key.charCode < 65 || key.charCode > 90) //letras minusculas
            && (key.charCode != 45) //retroceso
            && (key.charCode != 241) //ñ
             && (key.charCode != 209) //Ñ
             && (key.charCode != 32) //espacio
             && (key.charCode != 225) //á
             && (key.charCode != 233) //é
             && (key.charCode != 237) //í
             && (key.charCode != 243) //ó
             && (key.charCode != 250) //ú
             && (key.charCode != 193) //Á
             && (key.charCode != 201) //É
             && (key.charCode != 205) //Í
             && (key.charCode != 211) //Ó
             && (key.charCode != 218) //Ú

            )
            return false;
    });
</script>