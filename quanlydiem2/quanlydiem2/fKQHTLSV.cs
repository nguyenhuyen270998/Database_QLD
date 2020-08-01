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
    public partial class fThongKe : Form
    {
        public fThongKe()
        {
            InitializeComponent();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_ThongKe bus_thongke = new BUS_ThongKe();
            bus_thongke.MaHP = txtMaHP.Text;
            if (txtMaHP.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập dữ liệu");
            }
            else
            {
                txtSoLuong.DataBindings.Clear();
                txtSoLuong.DataBindings.Add( "Text",bus_thongke.LookSinhVienHocLai(bus_thongke.MaHP),"soluong");
                 dtDanhSach.DataSource = bus_thongke.LookDSSinhVienHocLai(bus_thongke.MaHP);
               
            }
        }
        private void dtSoLuong_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dtDanhSach_RowEnter(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dtDanhSach_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dtDanhSach.Rows[e.RowIndex];
                txtMaHP.Text = row.Cells[0].Value.ToString();
            }
            catch (Exception) { }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void fThongKe_Load(object sender, EventArgs e)
        {

        }
    }
}
