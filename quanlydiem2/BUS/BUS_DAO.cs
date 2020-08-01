using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
    public class DAO_ConnectionDb
    {
        public SqlConnection conn;
        public SqlDataAdapter myAdapter;
        public DAO_ConnectionDb()
        {
            conn = new SqlConnection(@"Data Source=MAYTINH-93ICU99\SQLEXPRESS;Initial Catalog=QuanLyDiem;Integrated Security=True");
        }
        public SqlConnection openConnect()
        {
            if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
            {
                conn.Open();
            }
            return conn;
        } 

        /// Hàm lấy giá trị bảng từ Procdure trong sql 
        /// Tên của procdure
        /// tham số của procdure
        /// trả về 1 datatable
        public DataTable executeSelectQuery(String query, SqlParameter[] sqlParameter)
        {
            SqlCommand myCommand = new SqlCommand();
            DataTable dataTable = new DataTable();
            myAdapter = new SqlDataAdapter();
            conn = openConnect();
            dataTable = null;
            DataSet ds = new DataSet();
            try
            {
                myCommand.Connection = conn;
                myCommand.CommandText = query;
                myCommand.Parameters.AddRange(sqlParameter);
                myCommand.ExecuteNonQuery();
                myAdapter.SelectCommand = myCommand;
                myAdapter.Fill(ds);
                dataTable = ds.Tables[0];
            }
            catch (SqlException )
            {
                return null;
            }
            return dataTable;
        }
        /// 

        /// Hàm thêm mới , xóa ,sửa dữ liệu với procudre
        /// Truyền tên của procdure trong SQL
        /// Khởi tạo 1 sqlparameter dạng mảng để truyền tham số về
        /// Trả về kiểu số nguyên
        public int executeInsertQuery(String query, SqlParameter[] sqlParameter)
        {
            int kq = -1;
            SqlCommand myCommand = new SqlCommand();
            SqlConnection conn = openConnect();
            myAdapter=new SqlDataAdapter ();
            myCommand.Connection = conn;
            myCommand.CommandText = query;
            myCommand.Parameters.AddRange(sqlParameter);
            myAdapter.InsertCommand = myCommand;
            //conn.Open();
            return kq = myCommand.ExecuteNonQuery();
    }
    }
}
