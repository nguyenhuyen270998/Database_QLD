using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
    public class BUS_DiemHP:DAO_ConnectionDb
    {
        private string mssv;

        public string MSSV
        {
            get { return mssv; }
            set { mssv = value; }
        }
        private string malophp;

        public string MaLopHP 
        {
            get { return malophp; }
            set { malophp = value; }
        }
        private string diemqt;

        public string DiemQT
        {
            get { return diemqt; }
            set { diemqt = value; }
        }
        private string diemkt;
        public string DiemKT
        {
            get { return diemkt; }
            set { diemkt = value; }
        }
        DAO_ConnectionDb da = new DAO_ConnectionDb();
        public DataTable ShowDiemHP()
        {
            SqlParameter[] sqlPara = new SqlParameter[0];
            return da.executeSelectQuery("select *from DiemHP", sqlPara);
        }
        public int InsertDiemHP(BUS_DiemHP DiemHP)
        {
            SqlParameter[] sqlPara = { new SqlParameter("@mssv", SqlDbType.NChar, 10),
                                       new SqlParameter("@malophp", SqlDbType.NVarChar, 100), 
                                       new SqlParameter("@diemqt",SqlDbType.Float ),
                                       new SqlParameter("@diemkt",SqlDbType.Float)};
            sqlPara[0].Value = DiemHP.mssv;
            sqlPara[1].Value = DiemHP.malophp;
            sqlPara[2].Value = DiemHP.diemqt;
            sqlPara[3].Value = DiemHP.diemkt;
            return da.executeInsertQuery("Insert dbo.DiemHP( MSSV,MaLopHP,DiemQT,DiemKT) values( @mssv,@malophp,Convert(Float,@diemqt),Convert(Float,@diemkt))", sqlPara);
        }
        public int UpdateDiemHP(string mssv, string malophp, string diemqt, string diemkt)
        {
            SqlParameter[] sqlPara = new SqlParameter[4];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            sqlPara[1] = new SqlParameter("@malophp", SqlDbType.NChar, 10);
            sqlPara[1].Value = malophp;
            sqlPara[2] = new SqlParameter("@diemqt", SqlDbType.Float);
            sqlPara[2].Value = diemqt;
            sqlPara[3] = new SqlParameter("@diemkt", SqlDbType.Float);
            sqlPara[3].Value = diemkt;
            return da.executeInsertQuery("Update DiemHP set  DiemQT=Convert(Float,@diemqt),DiemKT=Convert(Float,@diemkt) where mssv=@mssv and MaLopHP=@malophp  ", sqlPara);
        }
        public DataTable LookDiemHP(string mssv, string malophp)
        {
            SqlParameter[] sqlPara = new SqlParameter[2];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            sqlPara[1] = new SqlParameter("@malophp", SqlDbType.NChar, 10);
            sqlPara[1].Value = malophp;

            return da.executeSelectQuery("select*from DiemHP  where MSSV=@mssv and MaLopHP=@malophp", sqlPara);

        }
        public int CapNhatDiemHP(string mssv)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            return da.executeInsertQuery("exec updattte @mssv", sqlPara);
        }
        public DataTable LookDiemSV(string mssv)
        {
            SqlParameter[] sqlPara = new SqlParameter[1];
            sqlPara[0] = new SqlParameter("@mssv", SqlDbType.NChar, 10);
            sqlPara[0].Value = mssv;
            return da.executeSelectQuery("select*from DiemHP  where MSSV=@mssv", sqlPara);
        }
    }
}
