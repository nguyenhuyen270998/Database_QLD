using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
   public  class BUS_GiangVien:DAO_ConnectionDb
    {  
       private string magv;

            public string MaGV
            {
                get { return magv; }
                set { magv= value; }
            }
            private string tengv;

            public string TenGV
            {
                get { return tengv; }
                set { tengv = value; }
            }
            private string mavien;

            public string MaVien
            {
                get { return mavien; }
                set { mavien= value; }
            }
            
          DAO_ConnectionDb da = new DAO_ConnectionDb();
            public DataTable ShowGiangVien()
            {
                SqlParameter[] sqlPara = new SqlParameter[0];
                return da.executeSelectQuery("select *from GiangVien ", sqlPara);
            }
            public int InsertGiangVien(BUS_GiangVien GiangVien)
            {
                SqlParameter[] sqlPara = { new SqlParameter("@magv", SqlDbType.NChar, 10),
                                       new SqlParameter("@tengv", SqlDbType.NVarChar, 100),                                      
                                       new SqlParameter("@mavien",SqlDbType.NChar,10)};
                sqlPara[0].Value = GiangVien.magv;
                sqlPara[1].Value = GiangVien.tengv;
                sqlPara[2].Value = GiangVien.mavien;             
                return da.executeInsertQuery("Insert GiangVien values( @magv,@tengv,@mavien)", sqlPara);
            }

            public int DeleteGiangVien(string magv)
            {
                SqlParameter[] sqlPara = new SqlParameter[1];
                sqlPara[0] = new SqlParameter("@magv", SqlDbType.NChar, 10);
                sqlPara[0].Value = magv;
                return da.executeInsertQuery("Delete GiangVien where MaGV=@magv", sqlPara);
            }
            public int UpdateGiangVien(string magv, string tengv, string mavien)
            {
                SqlParameter[] sqlPara = new SqlParameter[3];
                sqlPara[0] = new SqlParameter("@magv", SqlDbType.NChar, 10);
                sqlPara[0].Value = magv;
                sqlPara[1] = new SqlParameter("@tengv", SqlDbType.NChar, 10);
                sqlPara[1].Value = tengv;
                sqlPara[2] = new SqlParameter("@mavien", SqlDbType.NChar, 10);
                sqlPara[2].Value = mavien;
                return da.executeInsertQuery("Update GiangVien set TenGV=@tengv,MaVien=@mavien where MaGV=@magv  ", sqlPara);
            }
            public DataTable LookGiangVien(string magv)
            {
                SqlParameter[] sqlPara = new SqlParameter[1];
                sqlPara[0] = new SqlParameter("@magv", SqlDbType.NChar, 10);
                sqlPara[0].Value = magv;
                return da.executeSelectQuery("select*from GiangVien where MaGV=@magv", sqlPara);

            }

        }
    }

