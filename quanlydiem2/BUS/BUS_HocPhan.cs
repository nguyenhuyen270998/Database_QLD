using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
    public class BUS_HocPhan :DAO_ConnectionDb
    {
        private string mahp;
        public string MaHP
        {
            get { return mahp; }
            set { mahp = value; }
        }
        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable ShowHocPhan()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery("select *from HocPhan ", sqlPara);
        }
        public DataTable LookHocPhan(string mahp)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mahp", SqlDbType.NChar, 10);
            sqlPara[0].Value = mahp;
            return da.executeSelectQuery("select*from HocPhan where MaHP=@mahp", sqlPara);

        }
    }
}
