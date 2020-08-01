using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
   public  class BUS_CTDT:DAO_ConnectionDb
    {
       private string manganh;

            public string MaNganh
            {
                get { return manganh; }
                set { manganh= value; }
            }
            private string mahp;

            public string MaHP
            {
                get { return mahp; }
                set { mahp = value; }
            }
            DAO_ConnectionDb da = new DAO_ConnectionDb();
            public DataTable ShowCTDT()
            {
                SqlParameter[] sqlPara = new SqlParameter[0];
                return da.executeSelectQuery("select *from CTDaoTao ", sqlPara);
            }
            public DataTable LookCTDT(string manganh,string mahp)
            {
                SqlParameter[] sqlPara = new SqlParameter[2];
                sqlPara[0] = new SqlParameter("@manganh", SqlDbType.NChar, 10);
                sqlPara[0].Value = manganh;
                sqlPara[1] = new SqlParameter("@mahp", SqlDbType.NChar, 10);
                sqlPara[1].Value = mahp;
                    
                return da.executeSelectQuery("select*from CTDaoTao where MaNganh=@manganh and MaHP=@mahp", sqlPara);

            }
    }
}
