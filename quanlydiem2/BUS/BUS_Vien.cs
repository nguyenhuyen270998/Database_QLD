using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
   public  class BUS_Vien:DAO_ConnectionDb
    {
        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable ShowVien()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery("select *from Vien ", sqlPara);
        }
    }
}
