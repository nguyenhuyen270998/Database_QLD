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
    public partial class fGiangVien : Form
    {
        public fGiangVien()
        {
            InitializeComponent();
        }

        private void btnTroVe6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtGiangVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void bnThemGV_Click(object sender, EventArgs e)
        {
            if (txtMGV.Text != "")
            {
                BUS_GiangVien bus_giangvien = new BUS_GiangVien();
                bus_giangvien.MaGV = txtMGV.Text;
                bus_giangvien.TenGV = txtTenGV.Text;
                bus_giangvien.MaVien = txtMaVien.Text;
                if (txtMGV.Text == "" || txtTenGV.Text == "" || txtMaVien.Text == "")
                {
                    MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
                }
                else
                {  try{
                    if (bus_giangvien.InsertGiangVien(bus_giangvien) > 0)
                    {
                        MessageBox.Show("Thêm Thành Công");
                        fGiangVien_Load(sender, e);
                    }}
                    catch
                    {
                        MessageBox.Show("Thêm Thất Bại");
                    }
                }
            }
        }

        private void btnTimKiemGV_Click(object sender, EventArgs e)
        {
            BUS_GiangVien bus_giangvien = new BUS_GiangVien();
            bus_giangvien.MaGV = txtTKGV.Text;
            dtGiangVien.DataSource = bus_giangvien.LookGiangVien(bus_giangvien.MaGV);
        }

        private void btnXoaGV_Click(object sender, EventArgs e)
        {
            BUS_GiangVien bus_giangvien= new BUS_GiangVien();
            bus_giangvien.MaGV = txtMGV.Text;
            bus_giangvien.DeleteGiangVien(bus_giangvien.MaGV);
            MessageBox.Show("Xóa Thành Công");
            dtGiangVien.DataSource = bus_giangvien.ShowGiangVien();
        }

        private void btnSuaGV_Click(object sender, EventArgs e)
        {
            BUS_GiangVien bus_giangvien = new BUS_GiangVien();
            bus_giangvien.MaGV = txtMGV.Text;
            bus_giangvien.TenGV = txtTenGV.Text;
            bus_giangvien.MaVien = txtMaVien.Text;
            if (txtMGV.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
                bus_giangvien.UpdateGiangVien(bus_giangvien.MaGV, bus_giangvien.TenGV, bus_giangvien.MaVien);
                MessageBox.Show("Sửa Thành Công");
                dtGiangVien.DataSource = bus_giangvien.ShowGiangVien();
            }
        }

        private void fGiangVien_Load(object sender, EventArgs e)
        {
            BUS_GiangVien bus_giangvien = new BUS_GiangVien();
            dtGiangVien.DataSource = bus_giangvien.ShowGiangVien();
        }

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fGiangVien_Load(sender, e);
        }

        private void dtGiangVien_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dtGiangVien.Rows[e.RowIndex];
                txtMGV.Text = row.Cells[0].Value.ToString();
                txtTenGV.Text = row.Cells[1].Value.ToString();
                txtMaVien.Text = row.Cells[2].Value.ToString();
               
            }
            catch (Exception) { }
        }


    }
}
