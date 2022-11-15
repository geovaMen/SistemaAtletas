<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmLogin.aspx.vb" Inherits="SistemaDeAtletas.frmLogin" %>

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
    <title>LoginSistemaAlmacenamiento</title>
</head>
<body class="login">
    <form id="frmLogin" runat="server">
        <div class="container">

            <asp:Panel ID="pnlLogin" runat="server">
                <div class="row mt-2">
                    <div class=" container-fluid">
                        <div class="row d-flex justify-content-center mt-2">
                            <asp:Image ID="Image1" CssClass="img mt-2  mb-3" ImageUrl="~/IMG/logoComite.png" runat="server" />
                            <div class="col-12 col-lg-12">
                                <div class="form-row d-flex justify-content-center">
                                    <div class="form-group  col-12 col-lg-6">
                                        <fieldset>
                                            <div class="input-group input-group-md mt-3 ">
                                                <div class="input-group-append col-6  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblNameUser" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="USUARIO"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtNameUser" runat="server" CssClass="form-control ui-widget col-sm-6  col-lg-5"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <div class="input-group input-group-md mt-1 ">
                                                <div class="input-group-append col-6  col-lg-4 inputText_Label">
                                                    <asp:Label ID="lblPassword" runat="server" CssClass=" mt-2 " Font-Size="medium" Text="CONTRASEÑA"></asp:Label>
                                                </div>
                                                <asp:TextBox ID="txtPassWord" TextMode="Password" runat="server" CssClass="form-control ui-widget col-sm-6  col-lg-5"></asp:TextBox>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center mb-2 ">
                    <%--<asp:Button runat="server" Text="INGRESAR" ID="btnLogin" CssClass=" mr-1" />--%>
                    <asp:LinkButton ID="lbtLogin" BackColor="White" runat="server">
                    <span class="fas fa-sign-in-alt fa-2x mt-1 mr-2 ml-2"  style="color:gray; background-color:white;"></span> 
                    </asp:LinkButton>
                     <asp:LinkButton ID="lbtNewAccount" CssClass="ml-3 mr-2" BackColor="White" runat="server">
                    <span class="fas fa-plus-square fa-2x mt-1 mr-2 ml-2"  style="color:gray; background-color:white;"></span> 
                    </asp:LinkButton>

                     <asp:LinkButton ID="lbtHelp" CssClass="ml-2 mr-2" BackColor="White" runat="server">
                    <span class="fas fa-question-circle fa-2x mt-1 mr-2 ml-2"  style="color:gray; background-color:white;"></span> 
                    </asp:LinkButton>
            
                    
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
