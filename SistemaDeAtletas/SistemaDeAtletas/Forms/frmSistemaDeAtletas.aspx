<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmSistemaDeAtletas.aspx.vb" Inherits="SistemaDeAtletas.frmSistemaDeAtletas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src="../jQuery/jquery-3.2.1.min.js"></script>
    <link href="../jQuery/jquery-ui.min.css" rel="stylesheet" />
    <script src="../bootstrap-4.4/js/bootstrap.min.js"></script>
    <link href="../bootstrap-4.4/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bootstrap-4.4/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Design/css.css" rel="stylesheet" />
    <script src="../fontAwesome/js/all.js"></script>
    <link href="../fontAwesome/css/all.css" rel="stylesheet" />
    <script src="../Alerts/sweetalert.min.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.5.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.5.0/firebase-storage.js"></script>
    <title></title>

    <script type="text/javascript">
        var firebaseConfig = {
            apiKey: "AIzaSyAKny_GKjIOsLtRZ5q5jA2U4S7pQvQwDU4",
            authDomain: "registroatletas-c7427.firebaseapp.com",
            projectId: "registroatletas-c7427",
            storageBucket: "registroatletas-c7427.appspot.com",
            messagingSenderId: "836102398635",
            appId: "1:836102398635:web:63b9502a2d0d2cf90a8dee",
            measurementId: "G-KGJH20K0TN"
        };

        firebase.initializeApp(firebaseConfig);

        function callFile(nameimage) {


            var storage = firebase.storage().ref(nameimage);

            storage.getDownloadURL().then(function (storage) {

                var mapa = window.open(`${storage} `, "_blank");

                if (mapa) {
                    mapa.focus();
                } else {

                    swal("Error..", "Pestaña no encontrada", "error");
                    return false;
                }

            }).catch(function (error) { /*alert("Se encontro un Error al obtener la ruta del archivo.");*/ });

        }


    </script>

</head>
<body>
    <form id="frmAlmacenamientoAtletas" runat="server">
        <div class="container-fluid">
            <%--bg-light--%>
            <nav class="navbar  navbar-expand-md navbar-light  mt-1" style="background-color: slategray;">
                <asp:Image ID="imgLogo" CssClass="img mt-2" ImageUrl="~/IMG/logoComite.png" Width="100px" Height="90px" runat="server" />

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavBar" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon navbar-light"></span>
                </button>
                <div class="collapse navbar-collapse " id="collapsibleNavBar">
                    <ul class="navbar-nav container-fluid d-flex justify-content-center">
                        <li class="nav-item ml-3">

                            <asp:LinkButton ID="lbtAtletas" ForeColor="White" runat="server">Atletas</asp:LinkButton>
                        </li>

                        <li class="nav-item ml-3">
                            <asp:LinkButton ID="lbtAsociacion" ForeColor="White" runat="server">Federacion/Asociacion</asp:LinkButton>
                        </li>
                        <li class="nav-item ml-3">
                            <asp:LinkButton ID="lbtConsuta" ForeColor="White" runat="server">Consulta</asp:LinkButton>
                        </li>
                        <li class="nav-item ml-3">
                            <asp:LinkButton ID="lbtProfesion" ForeColor="White" runat="server">Profesion</asp:LinkButton>

                        </li>
                        <li class="nav-item ml-3">
                            <asp:LinkButton ID="lbtExamenM" ForeColor="White" runat="server">Examenes Medicos</asp:LinkButton>
                        </li>
                        <li class="nav-item ml-3">
                            <asp:LinkButton ID="lbtPermisos" ForeColor="White" runat="server">Permisos</asp:LinkButton>
                        </li>
                    </ul>

                </div>

            </nav>


            <%--Registro de atletas--%>
            <asp:Panel ID="pnlAtletas" runat="server" BackColor="#e3f2fd">

                <div class="mt-2">
                    <center>
                        <h1>Registro de Atletas</h1>
                    </center>
                </div>
                <div class="row mt-2">
                    <div class=" container-fluid">
                        <div class="row d-flex  mt-2">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">
                                    <div class="form-group  col-12 col-lg-4">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblCodigoAtleta" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Codigo"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtCodigoAtleta" runat="server" CssClass="form-control ui-widget col-sm-6  col-lg-4" ReadOnly="true"></asp:TextBox>
                                                <asp:TextBox ID="txtDateCre" runat="server" CssClass="form-control ui-widget col-6  col-lg-4" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblnombreAtleta" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Nombre"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtnombreAtleta" runat="server" CssClass="form-control ui-widget col-11  col-lg-8" placeholder="Ingrese Nombre"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12 col-md-2 col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblApellidoAtleta" runat="server" CssClass=" mt-2 mb-1 text-center" Font-Size="medium" Text="Apellido"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtApellidoAtleta" runat="server" CssClass="form-control ui-widget col-sm-12 col-lg-8" placeholder="Ingrese Apellido"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12 col-md-2 col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblFechaNac" runat="server" CssClass=" mt-2 mb-1 text-center" Font-Size="medium" Text="Fecha Nacimiento"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtFechaNac" runat="server" CssClass="form-control ui-widget col-sm-12 col-lg-8" placeholder="Ingrese Fecha"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12 col-md-2 col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblEdad" runat="server" CssClass=" mt-2 mb-1 text-center" Font-Size="medium" Text="Edad Actual"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control ui-widget col-sm-12 col-lg-8" placeholder="Ingrese Edad"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>


                                    <div class="form-group  col-12 col-lg-4">

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblDireccion" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Direccion"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control ui-widget col-12 col-lg-8" placeholder="Ingrese Direccion"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lbltelefono" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Celular"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtNumeroTel" runat="server" CssClass="form-control ui-widget col-12 col-lg-8" placeholder="Ingrese Numero"></asp:TextBox>

                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblTipoS" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Tipo Sangre"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtTipoSan" runat="server" CssClass="form-control ui-widget col-12 col-lg-8" placeholder="Ingrese Tipo"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblPeso" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Peso"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control ui-widget col-12 col-lg-8" placeholder="Ingrese Peso"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblEstatura" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Estatura"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtEstatura" runat="server" CssClass="form-control ui-widget col-12 col-lg-8" placeholder="Ingrese Estatura"></asp:TextBox>

                                            </div>
                                        </fieldset>


                                    </div>
                                    <div class="form-group  col-12 col-lg-4">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblMedicamentos" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Alergico a Medicamentos"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtMedicamentos" Rows="2" TextMode="MultiLine" runat="server" CssClass="form-control ui-widget col-12 col-lg-8" placeholder="Describa los medicamentos"></asp:TextBox>

                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblFederacion" runat="server" CssClass=" mt-2 input-group-lg" Font-Size="medium" Text="Deporte"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlFederacion" CssClass="form-control ui-widget col-12 col-lg-8" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblTipoLinea" runat="server" CssClass=" mt-2 input-group-lg" Font-Size="medium" Text="Tipo de Linea"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlTipoLinea" CssClass="form-control ui-widget col-12 col-lg-8" runat="server">
                                                    <asp:ListItem Value="1" Selected="True">Seleccione..</asp:ListItem>
                                                    <asp:ListItem Value="2">1  </asp:ListItem>
                                                    <asp:ListItem Value="3">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mb-2 ">
                                    <asp:Button runat="server" Text="REGISTRAR" CssClass="" ID="btnInsertarAtleta" />
                                </div>
                                <%--<div class="form-row ">

                                    <div class="form-group  col-12 col-lg-4">
                                        <b><span>Ingreso de Examenes Medicos</span></b>

                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblMotivE" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Motivo Examen"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtMotivE" TextMode="MultiLine" Rows="2" placeholder="Motivo Examen" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                        </div>
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblNombreEx" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Tipo Examen"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtNombreEx" placeholder="Nombre Examen" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                        </div>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-2">
                                                <div class="input-group-append col-12  col-lg-5 inputText_Label">
                                                    <asp:Label ID="lbtExpediente" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Examenes Medicos"></asp:Label>
                                                </div>
                                                <input type="file" class="col-12 col-lg-7 col-md" id="files" multiple="" />
                                              
                                                 <p id="uploading"></p>
                                             <progress value="0" max="100"  id="progress" class="sizeProgress"></progress>
                 
                                            </div>
                                        </fieldset>
                                        <div class="d-flex justify-content-center ">
                                              <input id="btnUploadFile" type="button" value="INGRESAR EXAMEN" class=" btn-primary  ml-1"/>
                                          
                                        </div>
                                    </div>
                                </div>
                                  <asp:Button runat="server"  CssClass="ButtonUpload mt-5" Width="0" Height="0"  ID="btnIngresarExam" />--%>
                            </div>
                        </div>

                    </div>
                </div>
            </asp:Panel>

            <%--Registro de asociacion y federaciones--%>
            <asp:Panel runat="server" ID="pnlAsociacion" BackColor="#e3f2fd">
                <div class="mt-2">
                    <center>
                        <h1>Registro de Federacion y Asociacion</h1>
                    </center>
                </div>

                <div class="row mt-2">
                    <div class="container-fluid">
                        <div class="row d-flex  mt-2">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">
                                    <div class="form-group  col-12 col-lg-6">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblIdFede" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Codigo"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtIdFede" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </fieldset>

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblNombreFede" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Nombre Federacion"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtNombreFede" runat="server" PlaceHolder="Digite Nombre" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="form-group  col-12 col-lg-6">

                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblEstado" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Estado Federacion"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlEstadoFede" CssClass="form-control ui-widget col-12 col-lg-8" runat="server">
                                                    <asp:ListItem Value="1" Selected="True">Seleccione..</asp:ListItem>
                                                    <asp:ListItem Value="A">Activa</asp:ListItem>
                                                    <asp:ListItem Value="D">Desactiva</asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblDireccionFede" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Direccion Entidad"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtDireccionFede" runat="server" Rows="2" TextMode="MultiLine" PlaceHolder="Ingrese Direccion" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class=" container-fluid d-flex justify-content-center mb-2">
                        <asp:Button ID="btnInsertarFede" runat="server" Text="Registrar" CssClass="" />
                    </div>
                    <div class=" container-fluid d-flex justify-content-center">
                        <div class="row d-flex  justify-content-center mt-3">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">
                                    <div class="form-group col-12 col-lg-12 ">
                                        <fieldset>
                                            <div class="container-fluid d-flex justify-content-center">
                                                <div class="form-group col-12 col-lg-12">

                                                    <asp:GridView runat="server" AutoGenerateColumns="false" Width="800px" ID="dgvRegistroFoA" CssClasses-HeaderCell="centerText">
                                                        <Columns>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="Center" DataField="idFederacion" HeaderText="Codigo"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="Center" DataField="nombreFederacion" HeaderText="Nombre"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="center" DataField="estado" HeaderText="Estado"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="Left" DataField="direccion" HeaderText="Direccion"></asp:BoundField>

                                                            <%-- <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="White">
                                                                <ItemTemplate>--%>
                                                            <%-- <asp:LinkButton runat="server" ToolTip="Eliminar" ID="lblConfirm" CssClass="mt-1"
                                                                       <%-- CommandArgument="<%# Container.DataItemIndex %>">--%>
                                                            <%--    <span class="fas fa-user-edit fa-2x  mr-2 ml-2"  style="color: gray;"></span> 

                                                                    </asp:LinkButton>--%>

                                                            <%--    </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </asp:Panel>
            <%--registro de tipo de profesion e informacion de usuarios--%>
            <asp:Panel runat="server" BackColor="#e3f2fd" ID="pnlTipoProfesion">
                <div class="mt-2">
                    <center>
                        <h1>Registro de Usuarios y Profesiones</h1>
                    </center>
                </div>

                <div class="row mt-2">
                    <div class="container-fluid">
                        <div class="row d-flex  mt-2">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">
                                    <div class="form-group  col-12 col-lg-6">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblNombreProfesion" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Nombre Profesion"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtNombreProfesion" placeholder="Ingrese Nombre" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4">
                                                    <asp:Label ID="lblEstadoProfesion" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Estado Profesion"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlEstadoProfesion" CssClass="form-control ui-widget col-sm-12  col-lg-7" runat="server">
                                                    <asp:ListItem Value="1">Seleccione..</asp:ListItem>
                                                    <asp:ListItem Value="A">Activo</asp:ListItem>
                                                    <asp:ListItem Value="D">Desactivo</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:LinkButton ID="lbtCrearTPro" BackColor="White" runat="server">
                                                      <span class="fas fa-save fa-2x mt-1 mr-2 ml-2 "  style="color:gray; background-color:white;"></span> 
                                                </asp:LinkButton>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="form-row ">
                                    <div class="form-group  col-12 col-lg-6">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblNombreUser" placeholder="Ingrese Nombre" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Nombre Usuario"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtNombreUser" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblApellidoUser" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Apellido Usuario"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtApellidoUser" placeholder="Ingrese Apellido" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblEdadUser" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Edad "></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtEdadUser" runat="server" placeholder="Ingrese Edad" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblCorreo" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Correo Electronico "></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtCorreo" runat="server" placeholder="Ingrese Correo" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="form-group  col-12 col-lg-6">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblDireccionU" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Direccion "></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtDireccionU" runat="server" placeholder="Ingrese Direccion" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblTelefonoU" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Telefono "></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtTelefonoU" runat="server" placeholder="Ingrese Telefono" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4">
                                                    <asp:Label ID="lblEstadoU" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Estado Usuario"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlEstadoU" CssClass="form-control ui-widget col-sm-12  col-lg-8" runat="server">
                                                    <asp:ListItem Value="1">Seleccione..</asp:ListItem>
                                                    <asp:ListItem Value="A">Activo</asp:ListItem>
                                                    <asp:ListItem Value="D">Desactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1">
                                                <div class="input-group-append col-12  col-lg-4">
                                                    <asp:Label ID="lblRolU" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Profesion/Rol"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlRolU" CssClass="form-control ui-widget col-sm-12  col-lg-8" runat="server">
                                                    <%--<asp:ListItem Value="1">Seleccione..</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="d-flex justify-content-center mb-2 ">
                            <asp:Button runat="server" Text="REGISTRAR" CssClass="" ID="btnInsertaTU" />
                        </div>

                    </div>
                </div>
            </asp:Panel>

            <%--Panel de consulta de informacion atletas--%>
            <asp:Panel runat="server" BackColor="#e3f2fd" ID="pnlConsultaExpediente">
                <div class="mt-2">
                    <center>
                        <h1>Consulta de Expedientes</h1>
                    </center>
                </div>

                <div class="row mt-2">
                    <div class="container-fluid">
                        <div class="row d-flex  mt-2">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">
                                    <div class="form-group  col-12 col-lg-6">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblBusquedaAtleta" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Nombre Atleta"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtBusquedaAtleta" placeholder="Ingrese Nombre" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-7"></asp:TextBox>
                                                <asp:LinkButton ID="lbtBusquedaAtleta" BackColor="White" runat="server">
                                                      <span class="fas fa-save fa-2x mt-1 mr-2 ml-2"  style="color:gray; background-color:white;"></span> 
                                                </asp:LinkButton>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="form-row  d-flex align-content-center">
                                    <div class="col-12 col-lg-6">
                                        <asp:GridView ID="dgvAtletas" Width="1400px" AutoGenerateColumns="false" runat="server">
                                            <EmptyDataRowStyle BackColor="#ff9933" Font-Size="Medium" />
                                            <EmptyDataTemplate>
                                                Error.. No se encuentra ningun resultado para la busqueda ingresada
                                            </EmptyDataTemplate>
                                            <Columns>
                                                 <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" HeaderStyle-Width="0" HeaderStyle-Height="0" ItemStyle-HorizontalAlign="Center" DataField="idAtleta" ></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="nombreAtleta" HeaderText="Nombre"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="apellidoAtleta" HeaderText="Apellido"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="center" DataField="fechaNacimiento" HeaderText="Fecha Nacimiento"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="center" DataField="edad" HeaderText="Edad"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="peso" HeaderText="Peso LB"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="estatura" HeaderText="EstaturA m"></asp:BoundField>

                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="TipoSangre" HeaderText="Tipo Sangre"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="Direccion" HeaderText="Direccion"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="center" DataField="fechaNacimiento" HeaderText="Fecha Nacimiento"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="center" DataField="telefono" HeaderText="Telefono"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="nombreFederacion" HeaderText="Deporte"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="tipoLineaDeportiva" HeaderText="Linea"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="medicamentoNoTolerables" HeaderText="Medicamentos No Tolerable"></asp:BoundField>
                                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="SkyBlue">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ToolTip="Consulta Expediente"  OnClick="mdlExpediente" ID="lblVerExp" CssClass="mt-1"
                                                            CommandArgument="<%# Container.DataItemIndex %>">
                                                           <span class="fas fa-eye fa-2x  mr-2 ml-2"  style="color: gray;"></span> </asp:LinkButton>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal -->              
                <div class="modal fade" id="ModalExpedientes" tabindex="-1" role="dialog"  aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered  modal-lg "  role="document">
                                <div class="modal-content" style=" width:1200px; background-color:#dcf6fe"; >
                                    <div class="modal-header">
                                        <h5 class="modal-title" style="margin: 0 auto; color:black" id="textModalNewSeries">Expediente Atleta</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="row " style="margin: 0 auto;">
                                            <div class="form-row  d-flex  justify-content-center">
                                    <div class="col-12 col-lg-12">
                                        <asp:GridView ID="dgvP" Width="100px" AutoGenerateColumns="false" runat="server">
                                            <EmptyDataRowStyle BackColor="#ff9933" Font-Size="Medium" />
                                            <EmptyDataTemplate>
                                                Error.. No se encuentra ningun resultado para la busqueda ingresada
                                            </EmptyDataTemplate>
                                            <Columns>

                                                <asp:BoundField HeaderStyle-CssClass="text-center" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="Center" DataField="nombreAtleta" HeaderText="Nombre Atleta"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="Center" DataField="nombreExamenMedico" HeaderText="Tipo Examen"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="center" DataField="motivoExamen" HeaderText="Motivo Examen"></asp:BoundField>
                                                            <%--<asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="center" DataField="motivoAlmacenamiento" HeaderText="Motivo Almacenamiento"></asp:BoundField>--%>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="Center" DataField="urlExamenMedico" HeaderText="Url"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="center" DataField="fechaRegistro" HeaderText="Fecha Almacenamiento"></asp:BoundField>
                                                            <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" ItemStyle-BackColor="White" HeaderStyle-BackColor="white" ItemStyle-HorizontalAlign="center" DataField="fechaExamen" HeaderText="Fecha Examen"></asp:BoundField>
                                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="White" HeaderStyle-BackColor="White">
                                                    <ItemTemplate >
                                                        <asp:LinkButton runat="server" ToolTip="Consulta Expediente"  OnClick="viewRowName" ID="lblVerExp" CssClass="mt-1"
                                                            CommandArgument="<%# Container.DataItemIndex %>">
                                                           <span class="fas fa-eye fa-2x  mr-2 ml-2"  style="color: gray;"></span> </asp:LinkButton>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                            
                                            </div>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
 

            </asp:Panel>
            <%--PANEL DE CREACION DE PERMISOS--%>
            <asp:Panel runat="server" BackColor="#e3f2fd" ID="pnlPermiso">
                <div class="mt-2">
                    <center>
                        <h1>Asignacion de Permisos</h1>
                    </center>
                </div>
                <div class="row mt-2">
                    <div class="container-fluid">
                        <div class="row d-flex  mt-2">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">
                                    <div class="form-group  col-12 col-lg-5">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblEstadoP" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Estado permiso"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlEstadoP" CssClass="form-control ui-widget col-12 col-lg-8" Enabled="false" runat="server">
                                                    <asp:ListItem Value="A">Activo</asp:ListItem>
                                                    <asp:ListItem Value="B">Desactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblNombreP" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Nombre permiso"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtNombreP" Enabled="false" placeholder="Ingrese Nombre" runat="server" CssClass="form-control ui-widget col-sm-11  col-lg-7"></asp:TextBox>
                                                <asp:LinkButton ID="lbtPermiso" Enabled="false" CssClass="col-1 col-lg-1" BackColor="White" runat="server">
                                                      <span class="fas fa-save fa-2x mt-1 mr-2 ml-2 "  style="color:gray; background-color:white;"></span> 
                                                </asp:LinkButton>
                                            </div>
                                        </fieldset>
                                    </div>

                                    <div class="form-group  col-12 col-lg-5">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblTipoUsuario" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Usuario"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlTipoUsuario" CssClass="form-control ui-widget col-12 col-lg-8" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblTipoPermiso" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Tipo Permiso"></asp:Label>
                                                </div>
                                                <asp:DropDownList ID="ddlTipoPermiso" CssClass="form-control ui-widget col-12 col-lg-7" runat="server">
                                                </asp:DropDownList>
                                                <asp:LinkButton ID="lbtGuardarPermiso" CssClass="col-1 col-lg-1" BackColor="White" runat="server">
                                                      <span class="fas fa-save fa-2x pl-1 pr-1 "  style="color:gray; background-color:white;"></span> 
                                                </asp:LinkButton>
                                            </div>
                                        </fieldset>

                                    </div>
                                </div>
                                <div class="form-row  d-flex  justify-content-center">
                                    <div class="col-12 col-lg-6 mt-5">
                                        <asp:GridView ID="dgvMuestraPermisos" AutoGenerateColumns="false" Width="800px" runat="server">
                                            <Columns>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="idUsuario"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="tipoPermiso" HeaderText="Tipo de Permiso"></asp:BoundField>
                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="Center" DataField="nombreP" HeaderText="Nombre Usuario"></asp:BoundField>

                                                <asp:BoundField HeaderStyle-CssClass="text-center mr-1 ml-1" HeaderStyle-BackColor="SkyBlue" ItemStyle-HorizontalAlign="center" DataField="estadoP" HeaderText="Estado Permiso"></asp:BoundField>
                                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="SkyBlue">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ToolTip="Estado" ID="lbtEstadoP" CssClass="mt-1"
                                                            CommandArgument="<%# Container.DataItemIndex %>" OnClick="actualizarEstadoP">
                                                           <span class="fas fa-user-edit fa-2x  mr-2 ml-2"  style="color: gray;"></span> </asp:LinkButton>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <%--panel expediente medico atletas--%>
            <asp:Panel ID="pnlExamenMedico" runat="server">
                <div class="mt-2">
                    <center>
                        <h1>Ingreso de Examenes Medicos</h1>
                    </center>
                </div>
                <div class="row mt-2">
                    <div class="container-fluid">
                        <div class="row d-flex  mt-2">
                            <div class="col-12 col-lg-12">
                                <div class="form-row ">

                                    <div class="form-group  col-12 col-lg-4">
                                        <b><span>Ingreso de Examenes Medicos</span></b>

                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblMotivE" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Motivo Examen"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtMotivE" TextMode="MultiLine" Rows="2" placeholder="Motivo Examen" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                        </div>
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblNombreEx" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Tipo Examen"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtNombreEx" placeholder="Nombre Examen" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                        </div>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-2">
                                                <div class="input-group-append col-12  col-lg-5 inputText_Label">
                                                    <asp:Label ID="lbtExpediente" runat="server" CssClass=" mt-2 input-group-lg " Font-Size="medium" Text="Examenes Medicos"></asp:Label>
                                                </div>
                                                <input type="file" class="col-12 col-lg-7 col-md" id="files" multiple="" />

                                                <p id="uploading"></p>
                                                <progress value="0" max="100" id="progress" class="sizeProgress"></progress>

                                            </div>
                                        </fieldset>
                                        <asp:Button runat="server" CssClass="ButtonUpload mt-5" Width="0" Height="0" ID="btnIngresarExam" />

                                    </div>


                                    <div class="form-group  col-12 col-lg-4">
                                        <b><span>Asignacion de Expediente</span></b>
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblMotivoE" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Motivo Almacenamiento"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtMotivoE" TextMode="MultiLine" Rows="2" placeholder="Motivo Almacenamiento" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>
                                        </div>

                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblIdAtl" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Atleta"></asp:Label>
                                            </div>
                                            <asp:DropDownList ID="ddlIdAtl" CssClass="form-control ui-widget col-12 col-lg-8" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblUserC" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Usuario"></asp:Label>
                                            </div>
                                            <asp:DropDownList ID="ddlUserC"   CssClass="form-control ui-widget col-12 col-lg-8" runat="server">
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                    <div class="form-group  col-12 col-lg-4">
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblFecha" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Fecha Asignacion"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtFechaA" placeholder="Fecha Asignacion" Enabled="false" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-4"></asp:TextBox>
                                            <asp:TextBox ID="txtHoraA" placeholder="Hora Asignacion" Enabled="false" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-4"></asp:TextBox>
                                        </div>
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblUrlE" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Url Examen"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtUrlE" placeholder="Url Examen"   runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>

                                        </div>
                                        <div class="input-group input-group-md mt-1 ">
                                            <div class="input-group-append col-12  col-lg-4 inputText_Label">
                                                <asp:Label ID="lblFechaEx" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="Fecha examen"></asp:Label>
                                            </div>
                                            <asp:TextBox ID="txtFechaEx" placeholder="Fecha Examen" runat="server" CssClass="form-control ui-widget col-sm-12  col-lg-8"></asp:TextBox>

                                        </div>
                                    </div>

                                </div>
                                <div class="d-flex justify-content-center ">
                                    <input id="btnUploadFile" type="button" value="INGRESAR EXAMEN" class=" btn-primary  ml-1" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                

                <%-- </div>
                </div>--%>
            </asp:Panel>
        </div>

        <%-- </div>--%>
    </form>

    <script type="text/javascript">
        // Funcion para subir archivos

        var files = [];
        document.getElementById("files").addEventListener("change", function (e) {
            files = e.target.files;
        });

        ///// Cargar Archivo //////
        document.getElementById("btnUploadFile").addEventListener("click", function () {
           

            if (files.length != 0) {
                for (let i = 0; i < files.length; i++) {
                   
                    let nameFile = files[i].name

                    function cleanCharacters(cadena) {
                        // Definimos los caracteres que queremos eliminar
                        var caracteresEspeciales = "!@#$^&%*()+=-[]\/{}|:<>?,";

                        // Eliminamos cualquier caracter que se encuentre en el arreglo
                        for (var i = 0; i < caracteresEspeciales.length; i++) {
                            cadena = cadena.replace(new RegExp("\\" + caracteresEspeciales[i], 'gi'), '');
                        }
                        // Quitamos espacios y los sustituimos por "_" 

                        cadena = cadena.replace(/ /g, "_");

                        // Quitamos tildes y "ñ"
                        cadena = cadena.replace(/á/gi, "a");
                        cadena = cadena.replace(/é/gi, "e");
                        cadena = cadena.replace(/í/gi, "i");
                        cadena = cadena.replace(/ó/gi, "o");
                        cadena = cadena.replace(/ú/gi, "u");
                        cadena = cadena.replace(/ñ/gi, "n");
                        return cadena;
                    }

                    let newCharacter = cleanCharacters(nameFile);               

                    var storage = firebase.storage().ref(newCharacter);
                    console.log(newCharacter)
                    var upload = storage.put(files[i]);
                    upload.on("state_changed", function progress(snapshot) {
                        var porcentaje = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                        document.getElementById("progress").value = porcentaje;
                    },

                        function error() { swal("ERROR..", "No se pudo cargar el archivo", "error"); },
                        function complete() {

                           let urlImage =  newCharacter

                            /*swal("En hora buena..", "Se ingreso correctamente el examen medico", "sucess");*/
                            if (porcentaje = 100) {
                                /*document.getElementById("txtGetName").value = urlImage*/
                                /*alert("Archivo cargado Correctamente .... ")*/
                                document.getElementById("txtUrlE").value = urlImage
                           
                                document.getElementById('<%=btnIngresarExam.ClientID%>').click();
                           } else {
                               swal("Cuidado..", "El archivo se esta procesando", "error");
                           }
                       });
                }
                
            } else {
                //alert("Debe seleccionar algun archivo");
                swal("CUIDADO..", "Debe seleccionar un archivo", "error");
            }
        });

    </script>
</body>
</html>
