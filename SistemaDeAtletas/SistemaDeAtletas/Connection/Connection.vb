Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Public Class Connection

    Dim conexion As New SqlConnection(My.Settings.SQLCONN)

    Public Sub CrearComando(ByVal consulta As String)

        Dim SqlCommand As New SqlCommand(consulta, conexion)

    End Sub

    Public Function openConnection() As SqlConnection

        If conexion.State = ConnectionState.Closed Then
            conexion.Open()
        End If
        Return conexion

    End Function
    Public Function closeConnection() As SqlConnection

        If conexion.State = ConnectionState.Open Then
            conexion.Close()
        End If
        Return conexion

    End Function

End Class
