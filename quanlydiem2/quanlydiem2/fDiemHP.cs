using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using System.Data.SqlClient;
namespace quanlydiem2
{
    public partial class fDiemHP : Form
    {
        public fDiemHP()
        {
            InitializeComponent();
        }

        private void btnTroVe7_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtDiemHP_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void fDiemHP_Load(object sender, EventArgs e)
        {
            BUS_DiemHP bus_diemhp = new BUS_DiemHP();
            dtDiemHP.DataSource = bus_diemhp.ShowDiemHP();
        }

        private void btnThemDiemHP_Click(object sender, EventArgs e)
        {
            if (txtMSSVD.Text != "")
            {
                BUS_DiemHP bus_diemhp = new BUS_DiemHP();
                bus_diemhp.MSSV = txtMSSVD.Text;
                bus_diemhp.MaLopHP = txtLopHP.Text;
                bus_diemhp.DiemQT = txtDiemQT.Text;
                bus_diemhp.DiemKT = txtDiemKT.Text;
                if (txtMSSVD.Text == "" || txtLopHP.Text == "" || txtDiemQT.Text == "" || txtDiemKT.Text == "")
                {
                    MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
                }
                else
                {     try{

                    if (bus_diemhp.InsertDiemHP(bus_diemhp) > 0)
                    {
                        MessageBox.Show("Thêm Thành Công");
                        fDiemHP_Load(sender, e);
                    }}
                    catch
                    {
                        MessageBox.Show("Thêm Thất Bại");
                    }
                }
            }
        }
        private void btnTimKiemDiemHP_Click(object sender, EventArgs e)
           
        {
            BUS_DiemHP bus_diemhp = new BUS_DiemHP();
            bus_diemhp.MSSV = txtMSSV.Text;
            bus_diemhp.MaLopHP = txtMaLopHP.Text;
            
                if (txtMSSV.Text != "" && txtMaLopHP.Text == "")
                {
                    dtDiemHP.DataSource = bus_diemhp.LookDiemSV(bus_diemhp.MSSV);
                }
                if(txtMSSV.Text != "" && txtMaLopHP.Text !="")
                {
                    dtDiemHP.DataSource = bus_diemhp.LookDiemHP(bus_diemhp.MSSV, bus_diemhp.MaLopHP);
                }}
      
        

        private void btnCapNhatDiem_Click(object sender, EventArgs e)
        {
            BUS_DiemHP bus_diemhp = new BUS_DiemHP();
            bus_diemhp.MSSV = txtMSSV.Text;
            if ( txtMSSV.Text == "")
            {
                MessageBox.Show(" bạn chưa nhập MSSV cần cập nhật điểm ");
            }
            else
            {
                dtDiemHP.DataSource = bus_diemhp.CapNhatDiemHP(bus_diemhp.MSSV);
                MessageBox.Show(" Cập Nhật Điểm  Thành Công");
                fDiemHP_Load(sender, e);

            }
           

        }

        private void btnSuaDiemHP_Click(object sender, EventArgs e)
        {
            BUS_DiemHP bus_diemhp = new BUS_DiemHP();
            bus_diemhp.MSSV = txtMSSVD.Text;
            bus_diemhp.MaLopHP = txtLopHP.Text;
            bus_diemhp.DiemQT = txtDiemQT.Text;
            bus_diemhp.DiemKT = txtDiemKT.Text;
            if (txtMSSVD.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
                bus_diemhp.UpdateDiemHP(bus_diemhp.MSSV, bus_diemhp.MaLopHP, bus_diemhp.DiemQT, bus_diemhp.DiemKT);
                MessageBox.Show("Sửa Thành Công");
                dtDiemHP.DataSource = bus_diemhp.ShowDiemHP();
            }
        }

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fDiemHP_Load(sender, e);
        }

        private void lbMSSV_Click(object sender, EventArgs e)
        {

        }

        private void txtMSSV_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtDiemHP_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dtDiemHP.Rows[e.RowIndex];
                txtMSSVD.Text = row.Cells[0].Value.ToString();
                txtLopHP.Text = row.Cells[1].Value.ToString();
                txtDiemQT.Text = row.Cells[2].Value.ToString();
                txtDiemKT.Text = row.Cells[3].Value.ToString();
            }
            catch (Exception) { }
        
        }


    }
}
