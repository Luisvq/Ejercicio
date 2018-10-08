using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Web.Logica.Clases
{
    public class clsClientes
    {
        string stConexion = "";
        SqlCommand sqlCommand = null;
        SqlConnection sqlConnection = null;
        SqlParameter sqlParameter = null;
        SqlDataAdapter sqlDataAdapter = null;

        public clsClientes()
        {
            clsConexion obclsConexion = new clsConexion();
            stConexion = obclsConexion.stGetConexion();
        }

        public string stInsertBuilding(string buildings)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                
                sqlCommand = new SqlCommand("spInsertBuildings", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.Clear();
                sqlCommand.Parameters.Add(new SqlParameter("@Building", buildings));

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@Message";
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                sqlParameter.Size = 100;
                sqlParameter.Direction = ParameterDirection.Output;

                sqlCommand.Parameters.Add(sqlParameter);
                sqlCommand.ExecuteNonQuery();

                return sqlParameter.Value.ToString();
            }
            catch (Exception ex) 
            { 
                throw ex; 
            }
            finally 
            { 
                sqlConnection.Close(); 
            }
        }

        public string stInsertCustomer(string id, string customers, string prefix)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spInsertCustomers", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                
                sqlCommand.Parameters.Add(new SqlParameter("@Customer",customers));
                sqlCommand.Parameters.Add(new SqlParameter("@Prefix",prefix));
                sqlCommand.Parameters.Add(new SqlParameter("@FKBuilding",id));

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@Message";
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                sqlParameter.Size = 100;
                sqlParameter.Direction = ParameterDirection.Output;

                sqlCommand.Parameters.Add(sqlParameter);
                sqlCommand.ExecuteNonQuery();

                return sqlParameter.Value.ToString();
            }
            catch (Exception ex) 
            { 
                throw ex; 
            }
            finally 
            { 
                sqlConnection.Close(); 
            }
        }

        public string stInsertPartNumber(string partNumber,string idCustomer, bool check)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spInsertPartNumbers", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@PartNumbers", partNumber));
                sqlCommand.Parameters.Add(new SqlParameter("@FKCustomer", idCustomer));
                sqlCommand.Parameters.Add(new SqlParameter("@Available", check));

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@Message";
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                sqlParameter.Size = 100;
                sqlParameter.Direction = ParameterDirection.Output;

                sqlCommand.Parameters.Add(sqlParameter);
                sqlCommand.ExecuteNonQuery();

                return sqlParameter.Value.ToString();
            }
            catch (Exception ex)
            {
                throw ex; 
            }
            finally
            {
                sqlConnection.Close(); 
            }
        }

        public DataSet stConsultarClientes(string partNumber=null, string customers=null)
        {
            try
            {
                DataSet dsConsulta = new DataSet();

                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spCheckPartNumbers", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@PartNumber", partNumber));
                sqlCommand.Parameters.Add(new SqlParameter("@Customer", customers));

                sqlCommand.ExecuteNonQuery();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(dsConsulta);

                return dsConsulta;
            }
            catch (Exception ex) 
            { 
                throw ex; 
            }
            finally 
            { 
                sqlConnection.Close(); 
            }
        }

        public string stEliminarClientes(long lnIdentificacion)
        {
            try
            {
                sqlConnection = new SqlConnection(stConexion);
                sqlConnection.Open();

                sqlCommand = new SqlCommand("spEliminarClientes", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add(new SqlParameter("@nIdentificacion", lnIdentificacion));

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@cMensaje";
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                sqlParameter.Size = 100;
                sqlParameter.Direction = ParameterDirection.Output;

                sqlCommand.Parameters.Add(sqlParameter);
                sqlCommand.ExecuteNonQuery();

                return sqlParameter.Value.ToString();
            }
            catch (Exception ex) { throw ex; }
            finally { sqlConnection.Close(); }
        }
    }
}
