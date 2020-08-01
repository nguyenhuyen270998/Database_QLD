using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
   public class BUS_LopSV:DAO_ConnectionDb
    {
        private string malopsv;

        public string MaLopSV
        {
            get { return malopsv; }
            set { malopsv = value; }
        }
        private string manganh;

        public string MaNganh
        {
            get { return manganh; }
            set { manganh = value; }
        }
        private string gvcn;

        public string GVCN
        {
            get { return gvcn; }
            set { gvcn = value; }
        }
        DAO_ConnectionDb da = new DAO_ConnectionDb();
       public DataTable ShowLopSV()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery("select *from LopSV", sqlPara);
        }
        public DataTable LookLopSV(string malopsv,string manganh,string gvcn)
        {
            SqlParameter[] sqlPara = new SqlParameter[3];
            sqlPara[0] = new SqlParameter("@malopsv", SqlDbType.NChar, 10);
            sqlPara[0].Value = malopsv;
            sqlPara[1] = new SqlParameter("@manganh", SqlDbType.NChar, 10);
            sqlPara[1].Value = manganh;
            sqlPara[2] = new SqlParameter("@gvcn", SqlDbType.NChar, 10);
            sqlPara[2].Value = gvcn;

            return da.executeSelectQuery("select*from LopSV where MaLopSV=@malopsv or MaNganh=@manganh or GVCN=@gvcn", sqlPara);

        }
      
    }
}
