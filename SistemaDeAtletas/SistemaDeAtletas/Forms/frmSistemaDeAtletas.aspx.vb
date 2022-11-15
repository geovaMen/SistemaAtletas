Imports System.Data.Sql
Imports System.Data.SqlClient
Imports SistemaDeAtletas.Connection
Imports System.Web
Imports System.Web.UI
Imports System.Data

Public Class frmSistemaDeAtletas
    Inherits System.Web.UI.Page
    Dim script As String
    Dim conn As SqlConnection
    Dim Data As DataTable
    Dim Reader As SqlDataReader
    Dim listITem As ListItem
    Dim comando As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtDateCre.Text = DateTime.Now.ToString("dd/MM/yyyy")

        txtHoraA.Text = DateTime.Now.ToShortTimeString()
        txtFechaA.Text = DateTime.Now.ToString("dd/MM/yyyy")
        If Not IsPostBack Then
            pnlExamenMedico.Visible = False
            pnlAtletas.Visible = False
            pnlAsociacion.Visible = False
            pnlTipoProfesion.Visible = False
            pnlConsultaExpediente.Visible = False
            pnlPermiso.Visible = False
            Call consultarTipoUsuario()
            Call dgvMuestraFoS()
            'Call MuestraAtletas()
            Call MostrarTipoProfesion()
            Call MostrarTipoPermiso()
            'Call dgvMuestraExp()
            Call muestraFoA()
            Call muestraNombreAtleta()
            Call muestraNombreUsuariC()
            Call MuestraPermisos()
        End If

    End Sub

    Protected Sub insertarTipoProf()
        Dim nameProfesion As String = txtNombreProfesion.Text
        Dim estaProfesion As String = ddlEstadoProfesion.SelectedValue

        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("proc_inProfesion", conn)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.AddWithValue("@nombreProfesion", nameProfesion)
        command.Parameters.AddWithValue("@estadoProfesion", estaProfesion)

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        If txtNombreProfesion.Text = String.Empty Or ddlEstadoProfesion.SelectedValue = "1" Then

        Else
            command.ExecuteNonQuery()
            script = "<script type='text/javascript'> 
                                        swal('En hora buena', 'Se ingreso tipo de profesion', 'success'); 
                                        </script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)
            Call MostrarTipoProfesion()
        End If

        If conn.State = ConnectionState.Open Then
            conn.Close()

        End If
        pnlTipoProfesion.Visible = True
        txtNombreProfesion.Text = ""
        ddlEstadoProfesion.SelectedValue = "1"
    End Sub

    Protected Sub insertarExamenA()
        Dim motivoAlmacenamiento As String = txtMotivoE.Text
        Dim fechaCreacion As String = txtHoraA.Text
        Dim horaCreacion As String = txtFechaA.Text
        Dim motivoExamen As String = txtMotivE.Text
        Dim fechaExamen As String = txtFechaEx.Text
        Dim nombreExamenMedi As String = txtNombreEx.Text

        Dim nameArchivo As String = txtUrlE.Text
        Dim idAtleta As String = ddlIdAtl.SelectedValue
        Dim idUsuario As String = ddlUserC.SelectedValue

        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("PROC_InsertarExamenesM", conn)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.AddWithValue("@motivoAlmacenamiento", motivoAlmacenamiento)
        command.Parameters.AddWithValue("@fechaRegistro", fechaCreacion)
        command.Parameters.AddWithValue("@horaRegistro", horaCreacion)
        command.Parameters.AddWithValue("@motivoExamen", motivoExamen)
        command.Parameters.AddWithValue("@fechaExamen", fechaExamen)
        command.Parameters.AddWithValue("@nombreExamenMedico", nombreExamenMedi)
        command.Parameters.AddWithValue("@urlExamenMedico", nameArchivo)
        command.Parameters.AddWithValue("@idAtleta", idAtleta)
        command.Parameters.AddWithValue("@idUsuario", idUsuario)

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        If txtMotivoE.Text = String.Empty Or txtNombreEx.Text = String.Empty Or txtMotivE.Text = String.Empty Or txtNombreEx.Text = String.Empty Then

        Else
            'MsgBox(motivoAlmacenamiento + "," + fechaCreacion + "," + horaCreacion + "," + motivoExamen + "," + fechaExamen + "," + nombreExamenMedi + "," + nameArchivo + "," + idAtleta + "," + idUsuario)

            command.ExecuteNonQuery()
            script = "<script type='text/javascript'> 
                                        swal('En hora buena', 'Se ingreso examen correctamente', 'success'); 
                                        </script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)

            Call cleanText(Me.Controls)
        End If

        pnlExamenMedico.Visible = True
        If conn.State = ConnectionState.Open Then
            conn.Close()

        End If
    End Sub

    'Funcion para seleccionar el nombre deL EXAMEN en el grid
    Protected Sub viewRowName(ByVal sender As Object, ByVal e As EventArgs)
        Dim row As Integer
        Dim button As LinkButton = TryCast(sender, LinkButton)
        Dim getNameFile As String

        If button IsNot Nothing Then
            row = button.CommandArgument
        End If

        Try

            getNameFile = dgvP.Rows(row).Cells(3).Text
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "getUrlFile", "callFile('" & getNameFile & "')", True)

            script = "<script type='text/javascript'> " &
                     "$(" & Chr(34) & "#ModalExpedientes" & Chr(34) & ").modal(" & Chr(34) & "show" & Chr(34) & "); " &
                 "</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)


        Catch ex As Exception

        End Try


    End Sub

    Protected Sub mdlExpediente(ByVal sender As Object, ByVal e As EventArgs)

        Dim row As Integer
        Dim button As LinkButton = TryCast(sender, LinkButton)
        Dim getNameFile As String

        If button IsNot Nothing Then
            row = button.CommandArgument
        End If
        Try
            getNameFile = dgvAtletas.Rows(row).Cells(0).Text
            Call dgvMuestraExp(getNameFile)
            script = "<script type='text/javascript'> " &
                     "$(" & Chr(34) & "#ModalExpedientes" & Chr(34) & ").modal(" & Chr(34) & "show" & Chr(34) & "); " &
                 "</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)
        Catch ex As Exception

        End Try
    End Sub

    'Muestra expediente atletas
    Public Sub dgvMuestraExp(ByVal numeroR As Integer)

        Data = New DataTable("registros")

        Dim conn As SqlConnection
        conn = New SqlConnection(My.Settings.SQLCONN)


        comando = "SELECT (A.nombreAtleta+''+A.apellidoAtleta) as nombreAtleta, E.nombreExamenMedico, E.motivoExamen,E.urlExamenMedico,
                    E.fechaRegistro, E.fechaExamen FROM expedientesAtletas E 
                    INNER JOIN informacionAtleta A 
                    ON E.idAtleta = A.idAtleta
                    WHERE A.idAtleta = '" & numeroR & "'"

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        Dim adaptador As New SqlDataAdapter(comando, conn)

        Try
            adaptador.Fill(Data)
        Catch ex As Exception
        End Try

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If


        dgvP.DataSource = Data
        dgvP.DataBind()
        dgvP.Visible = True

    End Sub
    Protected Sub insertarFoS()
        Dim nameFoS As String = txtNombreFede.Text
        Dim estado As String = ddlEstadoFede.SelectedValue
        Dim direccion As String = txtDireccionFede.Text

        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("SA_InsertFoA", conn)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.AddWithValue("@nombreFederacion", nameFoS)
        command.Parameters.AddWithValue("@estado", estado)
        command.Parameters.AddWithValue("@direccion", direccion)

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        If txtNombreFede.Text = String.Empty Or ddlEstadoFede.SelectedValue = "1" Or txtDireccionFede.Text = String.Empty Then

        Else
            command.ExecuteNonQuery()
            script = "<script type='text/javascript'> 
                                        swal('En hora buena', 'Se ingreso deporte correctamente', 'success'); 
                                        </script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)

            Call cleanText(Me.Controls)
        End If
        Call dgvMuestraFoS()
        pnlAsociacion.Visible = True
        If conn.State = ConnectionState.Open Then
            conn.Close()

        End If

    End Sub

    Protected Sub insertarTipoUsuarioC()
        Dim idPermiso As String = ddlTipoPermiso.SelectedValue
        Dim idUsuario As String = ddlTipoUsuario.SelectedValue


        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("PROC_UsuarioConsultor", conn)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.AddWithValue("@idPermiso", idPermiso)
        command.Parameters.AddWithValue("@idInformacionU", idUsuario)


        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If


        command.ExecuteNonQuery()
        script = "<script type='text/javascript'> 
                                        swal('En hora buena', 'Se ingreso deporte correctamente', 'success'); 
                                        </script>"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)

        Call MuestraPermisos()
        Call dgvMuestraFoS()
        pnlPermiso.Visible = True
        If conn.State = ConnectionState.Open Then
            conn.Close()

        End If

    End Sub

    'Funcion muestra datos en grid Federacion Asociacion
    Public Sub dgvMuestraFoS()

        Data = New DataTable("registros")

        Dim conn As SqlConnection
        conn = New SqlConnection(My.Settings.SQLCONN)


        comando = "SELECT idFederacion,nombreFederacion,estado,direccion FROM federacionAsociacion"

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        Dim adaptador As New SqlDataAdapter(comando, conn)

        Try
            adaptador.Fill(Data)
        Catch ex As Exception
        End Try

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If

        dgvRegistroFoA.DataSource = Data
        dgvRegistroFoA.DataBind()
        dgvRegistroFoA.Visible = True

    End Sub

    'CAMBIO ESTADO DE USUARIO CONSULTOR
    Protected Sub actualizarEstadoP()
        Dim getValue As String
        Dim Number As Integer
        getValue = dgvMuestraPermisos.Rows(Number).Cells(0).Text

    End Sub
    'MUESTRA TIPOS DE PERMISOS
    Public Sub MuestraPermisos()
        Data = New DataTable
        conn = New SqlConnection(My.Settings.SQLCONN)
        comando = "SELECT U.idUsuario,P.tipoPermiso, (I.nombreUsuario + ' '+ I.apellidoUsuario) AS nombreP, U.estadoP
                    FROM (usuarioConsultor U 
                    INNER JOIN 
                    permiso P ON U.idPermiso = P.idPermiso )
                    INNER JOIN
                    informacionUsuario I ON U.idInformacionU = I.idInformacionU"
        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        Dim adaptador As New SqlDataAdapter(comando, conn)

        Try
            adaptador.Fill(Data)
        Catch ex As Exception
        End Try

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If

        dgvMuestraPermisos.DataSource = Data
        dgvMuestraPermisos.DataBind()
        dgvMuestraPermisos.Visible = True
    End Sub
    'Muestra atletas
    Public Sub MuestraAtletas()

        Data = New DataTable("registros")

        'Dim conn As SqlConnection
        conn = New SqlConnection(My.Settings.SQLCONN)

        Dim comando As String
        comando = "SELECT A.idAtleta,A.nombreAtleta, A.apellidoAtleta,A.fechaNacimiento, A.edad,A.peso,A.estatura,A.TipoSangre,A.Direccion,
                    A.telefono, F.nombreFederacion,A.tipoLineaDeportiva, A.medicamentoNoTolerables FROM informacionAtleta A INNER JOIN 
                    federacionAsociacion F ON A.idFederacion = F.idFederacion"

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        Dim adaptador As New SqlDataAdapter(comando, conn)

        Try
            adaptador.Fill(Data)
        Catch ex As Exception
        End Try

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If

        dgvAtletas.DataSource = Data
        dgvAtletas.DataBind()
        dgvAtletas.Visible = True



    End Sub
    'Buscar por nombre Atleta
    Public Sub BusquedaNombreA()

        Data = New DataTable("registros")

        Dim conn As SqlConnection
        conn = New SqlConnection(My.Settings.SQLCONN)

        Dim comando As String
        comando = "SELECT A.idAtleta,A.nombreAtleta, A.apellidoAtleta,A.fechaNacimiento, A.edad,A.peso,A.estatura,A.TipoSangre,A.Direccion,
                    A.telefono, F.nombreFederacion,A.tipoLineaDeportiva, A.medicamentoNoTolerables FROM informacionAtleta A INNER JOIN 
                    federacionAsociacion F ON A.idFederacion = F.idFederacion WHERE A.nombreAtleta LIKE  '%" & txtBusquedaAtleta.Text & "%'  "

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        If txtBusquedaAtleta.Text = String.Empty Then

        Else
            Dim adaptador As New SqlDataAdapter(comando, conn)

            Try
                adaptador.Fill(Data)
            Catch ex As Exception


            End Try
        End If

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If

        dgvAtletas.DataSource = Data
        dgvAtletas.DataBind()
        dgvAtletas.Visible = True

    End Sub


    Protected Sub insertarAtleta()
        Dim nombreAtleta As String = txtnombreAtleta.Text
        Dim apellidoA As String = txtApellidoAtleta.Text
        Dim FechaNac As String = txtFechaNac.Text.ToString
        Dim edadA As String = txtEdad.Text
        Dim direccionA As String = txtDireccion.Text
        Dim telefonoA As String = txtNumeroTel.Text
        Dim pesoA As String = txtPeso.Text
        Dim estaturaA As String = txtEstatura.Text
        Dim tipoSangre As String = txtTipoSan.Text
        Dim medicamentosPer As String = txtMedicamentos.Text
        Dim tipoLinea As String = ddlTipoLinea.SelectedValue
        Dim idFederacion As String = ddlFederacion.SelectedValue

        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("PROC_InsertAtleta", conn)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.AddWithValue("@nombreAtleta", nombreAtleta)
        command.Parameters.AddWithValue("@apellidoAtleta", apellidoA)
        command.Parameters.AddWithValue("@fechaNacimiento", FechaNac)
        command.Parameters.AddWithValue("@edad", edadA)
        command.Parameters.AddWithValue("@Direccion", direccionA)
        command.Parameters.AddWithValue("@telefono", telefonoA)
        command.Parameters.AddWithValue("@peso", pesoA)
        command.Parameters.AddWithValue("@estatura", estaturaA)
        command.Parameters.AddWithValue("@TipoSangre", tipoSangre)
        command.Parameters.AddWithValue("@medicamentoNoTolerables", medicamentosPer)
        command.Parameters.AddWithValue("@tipoLineaDeportiva", tipoLinea)
        command.Parameters.AddWithValue("@idFederacion", idFederacion)

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        command.ExecuteNonQuery()
        script = "<script type='text/javascript'> 
                                        swal('En hora buena', 'Se ingreso correctamente un nuevo Atleta', 'success'); 
                                        </script>"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)
        Call cleanText(Me.Controls)


        If conn.State = ConnectionState.Open Then
            conn.Close()

        End If

    End Sub

    Protected Sub muestraFoA()
        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("SELECT idFederacion,nombreFederacion FROM federacionAsociacion", conn)
        'command.CommandType = CommandType.StoredProcedure

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If
        ddlFederacion.DataSource = command.ExecuteReader

        ddlFederacion.DataTextField = "nombreFederacion"
        ddlFederacion.DataValueField = "idFederacion"
        ddlFederacion.DataBind()

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If


    End Sub

    Protected Sub muestraNombreUsuariC()
        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("SELECT U.idUsuario,(I.nombreUsuario +' ' +I.apellidoUsuario)as nombreU FROM (informacionUsuario I
                                        INNER JOIN usuarioConsultor U 
                                        ON I.idInformacionU = U.idInformacionU)
                                        INNER JOIN 
                                        permiso P ON U.idPermiso = P.idPermiso
                                        WHERE 
                                        P.tipoPermiso = 'Administrador'", conn)

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If
        ddlUserC.DataSource = command.ExecuteReader

        ddlUserC.DataTextField = "nombreU"
        ddlUserC.DataValueField = "idUsuario"
        ddlUserC.DataBind()

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If
    End Sub
    Protected Sub muestraNombreAtleta()
        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("SELECT idAtleta, (nombreAtleta +'  '+ apellidoAtleta) as nombre FROM informacionAtleta", conn)
        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If
        ddlIdAtl.DataSource = command.ExecuteReader

        ddlIdAtl.DataTextField = "nombre"
        ddlIdAtl.DataValueField = "idAtleta"
        ddlIdAtl.DataBind()

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If
    End Sub
    Protected Sub insertarTipoUsuario()

        Dim nombreU As String = txtNombreUser.Text
        Dim apellidoU As String = txtApellidoUser.Text
        Dim edadU As String = txtEdadUser.Text
        Dim correoU As String = txtCorreo.Text
        Dim direccionU As String = txtDireccionU.Text
        Dim telefonoU As String = txtTelefonoU.Text
        Dim estadoU As String = ddlEstadoU.SelectedValue
        Dim idProfesionU As String = ddlRolU.SelectedValue

        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("PROC_insertarTipoUsuario", conn)
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.AddWithValue("@nombreUsuario", nombreU)
        command.Parameters.AddWithValue("@apellidoUsuario", apellidoU)
        command.Parameters.AddWithValue("@edad", edadU)
        command.Parameters.AddWithValue("@correoElectronico", correoU)
        command.Parameters.AddWithValue("@direccion", direccionU)
        command.Parameters.AddWithValue("@telefono", telefonoU)
        command.Parameters.AddWithValue("@estado", estadoU)
        command.Parameters.AddWithValue("@idProfesion", idProfesionU)


        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If


        command.ExecuteNonQuery()

        script = "<script type='text/javascript'> 
                                        swal('En hora buena', 'Se ingreso  correctamente', 'success'); 
                                        </script>"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, False)
        Call cleanText(Me.Controls)
        Call consultarTipoUsuario()
        pnlTipoProfesion.Visible = True
        If conn.State = ConnectionState.Open Then
            conn.Close()

        End If



    End Sub

    Protected Sub cleanText(ByRef clean As ControlCollection)
        Dim saveDate As String = txtDateCre.Text


        For Each control As Control In clean

            If TypeOf control Is TextBox Then
                DirectCast(control, TextBox).Text = String.Empty
            ElseIf TypeOf control Is DropDownList Then
                DirectCast(control, DropDownList).ClearSelection()
            ElseIf TypeOf control Is CheckBox Then
                DirectCast(control, CheckBox).Checked = False
            ElseIf control.HasControls() Then
                cleanText(control.Controls)
            End If
        Next
        txtDateCre.Text = saveDate

    End Sub
    Public Sub CamposVacios()
        Dim nameFoS As String = txtNombreFede.Text
        Dim estado As String = ddlEstadoFede.SelectedValue
        Dim direccion As String = txtDireccionFede.Text
        If txtNombreFede.Text = String.Empty Then
            txtNombreFede.BorderColor = System.Drawing.Color.Red
        Else
            txtNombreFede.BorderColor = System.Drawing.Color.Green
        End If


    End Sub

    Private Sub lbtAtletas_Click(sender As Object, e As EventArgs) Handles lbtAtletas.Click
        pnlAtletas.Visible = True

        pnlAsociacion.Visible = False
        pnlTipoProfesion.Visible = False
        pnlConsultaExpediente.Visible = False
        pnlPermiso.Visible = False
        pnlExamenMedico.Visible = False
    End Sub

    Private Sub lbtAsociacion_Click(sender As Object, e As EventArgs) Handles lbtAsociacion.Click
        pnlAsociacion.Visible = True
        pnlAtletas.Visible = False

        pnlTipoProfesion.Visible = False
        pnlConsultaExpediente.Visible = False
        pnlPermiso.Visible = False
        pnlExamenMedico.Visible = False
    End Sub



    Private Sub btnInsertarFede_Click(sender As Object, e As EventArgs) Handles btnInsertarFede.Click
        Call insertarFoS()
    End Sub

    Private Sub lbtProfesion_Click(sender As Object, e As EventArgs) Handles lbtProfesion.Click
        pnlTipoProfesion.Visible = True
        pnlPermiso.Visible = False
        pnlAsociacion.Visible = False
        pnlAtletas.Visible = False
        pnlConsultaExpediente.Visible = False
        pnlPermiso.Visible = False
        pnlExamenMedico.Visible = False
    End Sub

    Private Sub lbtCrearTPro_Click(sender As Object, e As EventArgs) Handles lbtCrearTPro.Click
        Call insertarTipoProf()
    End Sub

    Protected Sub MostrarTipoProfesion()
        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("consultarTipoProfesion", conn)
        command.CommandType = CommandType.StoredProcedure

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If
        ddlRolU.DataSource = command.ExecuteReader

        ddlRolU.DataTextField = "nombreProfesion"
        ddlRolU.DataValueField = "idProfesion"
        ddlRolU.DataBind()

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If
    End Sub

    Protected Sub MostrarTipoPermiso()
        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("consultarTipoPermiso", conn)
        command.CommandType = CommandType.StoredProcedure

        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If
        ddlTipoPermiso.DataSource = command.ExecuteReader

        ddlTipoPermiso.DataTextField = "tipoPermiso"
        ddlTipoPermiso.DataValueField = "idPermiso"
        ddlTipoPermiso.DataBind()

        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If
    End Sub
    Protected Sub consultarTipoUsuario()
        conn = New SqlConnection(My.Settings.SQLCONN)
        Dim command As New SqlCommand("consultarTipoUsuario", conn)
        command.CommandType = CommandType.StoredProcedure


        If conn.State = ConnectionState.Closed Then
            conn.Open()
        End If

        ddlTipoUsuario.DataSource = command.ExecuteReader

        ddlTipoUsuario.DataTextField = "nombreUsuario"

        ddlTipoUsuario.DataValueField = "idInformacionU"
        ddlTipoUsuario.DataBind()


        If conn.State = ConnectionState.Open Then
            conn.Close()
        End If
    End Sub


    Private Sub ddlRolU_TextChanged(sender As Object, e As EventArgs) Handles ddlRolU.TextChanged


    End Sub

    Private Sub lbtConsuta_Click(sender As Object, e As EventArgs) Handles lbtConsuta.Click
        pnlConsultaExpediente.Visible = True
        pnlAsociacion.Visible = False
        pnlAtletas.Visible = False
        pnlExamenMedico.Visible = False
        pnlTipoProfesion.Visible = False

        pnlPermiso.Visible = False
    End Sub
    Private Sub btnInsertarAtleta_Click(sender As Object, e As EventArgs) Handles btnInsertarAtleta.Click
        Call insertarAtleta()
        pnlAtletas.Visible = True
        Call MuestraAtletas()
    End Sub

    Private Sub btnInsertaTU_Click(sender As Object, e As EventArgs) Handles btnInsertaTU.Click
        Call insertarTipoUsuario()


    End Sub

    Private Sub lbtPermisos_Click(sender As Object, e As EventArgs) Handles lbtPermisos.Click
        pnlPermiso.Visible = True
        pnlConsultaExpediente.Visible = False
        pnlAsociacion.Visible = False
        pnlAtletas.Visible = False

        pnlTipoProfesion.Visible = False
        pnlExamenMedico.Visible = False

    End Sub
    Private Sub lbtExamenM_Click(sender As Object, e As EventArgs) Handles lbtExamenM.Click
        pnlPermiso.Visible = False
        pnlConsultaExpediente.Visible = False
        pnlAsociacion.Visible = False
        pnlAtletas.Visible = False

        pnlTipoProfesion.Visible = False
        pnlExamenMedico.Visible = True

    End Sub
    Private Sub lbtGuardarPermiso_Click(sender As Object, e As EventArgs) Handles lbtGuardarPermiso.Click
        Call insertarTipoUsuarioC()
    End Sub

    Private Sub lbtBusquedaAtleta_Click(sender As Object, e As EventArgs) Handles lbtBusquedaAtleta.Click
        Call BusquedaNombreA()

    End Sub

    Private Sub btnIngresarExam_Click(sender As Object, e As EventArgs) Handles btnIngresarExam.Click
        Call insertarExamenA()
    End Sub

    Private Sub ddlTipoUsuario_TextChanged(sender As Object, e As EventArgs) Handles ddlTipoUsuario.TextChanged

    End Sub


End Class