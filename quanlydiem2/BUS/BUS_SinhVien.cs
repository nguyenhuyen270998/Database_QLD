
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
namespace BUS
{          
    public class BUS_SinhVien:DAO_ConnectionDb 
    {
          private string mssv;

        public string MSSV
        {
            get { return mssv; }
            set { mssv = value; }
        }
        private string hotensv;

        public string HoTenSV
        {
            get { return hotensv; }
            set { hotensv = value; }
        }
         private string ngsinh;

        public string NgSinh
        {
            get { return ngsinh; }
            set { ngsinh = value; }
        }
         private string malopsv;

        public string MaLopSV
        {
            get { return malopsv; }
            set { malopsv = value; }
        }
         

        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable ShowSinhVien()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];           
            return da.executeSelectQuery("select*from SinhVien",sqlPara);
        }
        public int InsertSinhVien(BUS_SinhVien SinhVien)
        {
            SqlParameter[] sqlPara = { new SqlParameter("@mssv", SqlDbType.NChar, 10),
                                       new SqlParameter("@hotensv", SqlDbType.NVarChar, 100), 
                                       new SqlParameter("@ngsinh",SqlDbType.DateTime ),
                                       new SqlParameter("@malopsv",SqlDbType.NChar,10)};
            sqlPara[0].Value = SinhVien.mssv;
            sqlPara[1].Value = SinhVien.hotensv;
            sqlPara[2].Value=SinhVien.ngsinh;
            sqlPara[3].Value=SinhVien.malopsv;
            return da.executeInsertQuery("Insert SinhVien values( @mssv,@hotensv,Convert(DateTime,@ngsinh),@malopsv)", sqlPara);           
        }

        public int DeleteSinhVien(string mssv)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            return da.executeInsertQuery("Delete SinhVien where MSSV=@mssv", sqlPara);  
        }
        public int UpdateSinhVien(string mssv,string hotensv,string ngsinh,string malopsv)
        {
            SqlParameter[] sqlPara = new SqlParameter[4];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            sqlPara[1] = new SqlParameter("@hotensv", SqlDbType.NChar, 10);
            sqlPara[1].Value = hotensv;
            sqlPara[2] = new SqlParameter("@ngsinh", SqlDbType.DateTime);
            sqlPara[2].Value = ngsinh;
            sqlPara[3] = new SqlParameter("@malopsv", SqlDbType.NChar, 10);
            sqlPara[3].Value = malopsv;
            return da.executeInsertQuery("Update SinhVien set HoTenSV=@hotensv ,ngsinh=Convert(DateTime,@ngsinh),malopsv=@malopsv where mssv=@mssv  ", sqlPara);
        }
         public DataTable LookSinhVien(string mssv )
         {
             SqlParameter[] sqlPara=new SqlParameter[1];
             sqlPara[0]=new SqlParameter("@mssv",SqlDbType.NChar,10);
             sqlPara[0].Value=mssv;
             return da.executeSelectQuery("select*from SinhVien where MSSV=@mssv",sqlPara);

         }
         public DataTable LookLopSinhVien(string malopsv)
         {
             SqlParameter[] sqlPara = new SqlParameter[1];
             sqlPara[0] = new SqlParameter("@malopsv", SqlDbType.NChar, 10);
             sqlPara[0].Value = malopsv;
             return da.executeSelectQuery(" exec TKLopSV @malopsv", sqlPara);

         }
      
    }
   
    }

