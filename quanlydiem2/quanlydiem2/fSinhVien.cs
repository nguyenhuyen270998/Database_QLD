using BUS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace quanlydiem2
{
    public partial class fSinhVien : Form
    {
        //   BUS_SinhVien bus_sinhvien = new BUS_SinhVien();
        public fSinhVien()
        {
            InitializeComponent();

        }
        private void btnTroVe5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void fSinhVien_Load(object sender, EventArgs e)
        {
            BUS_SinhVien bus_sinhvien = new BUS_SinhVien();
            dtSV.DataSource = bus_sinhvien.ShowSinhVien();
        }

        private void dtSV_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void dtSV_RowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e)
        {
        }
        private void dtSV_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
        }
        private void btnThemSV_Click(object sender, EventArgs e)
        {
                BUS_SinhVien bus_sinhvien = new BUS_SinhVien();
                bus_sinhvien.MSSV = txtTMSSV.Text;
                bus_sinhvien.HoTenSV = txtTHoTen.Text;
                bus_sinhvien.NgSinh = txtTNgSinh.Text;
                bus_sinhvien.MaLopSV = txtTLopHoc.Text;
                if (txtTMSSV.Text == "" || txtTHoTen.Text == "" || txtTNgSinh.Text == "" || txtTLopHoc.Text == "")
                {
                    MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
                }
                else
                {
                    try
                    {
                        if (bus_sinhvien.InsertSinhVien(bus_sinhvien) > 0)
                        {
                            MessageBox.Show("Thêm Thành Công");
                            fSinhVien_Load(sender, e);
                        }
                    }
                    //  else
                    catch
                    {
                        {
                            MessageBox.Show("MSSV đã tồn tại ");
                        }
                    }
                }
            }
        


        private void btnTimKiemSV_Click(object sender, EventArgs e)
        {
            
                BUS_SinhVien bus_sinhvien = new BUS_SinhVien();
                bus_sinhvien.MSSV=txtTKMSSV.Text;
                bus_sinhvien.MaLopSV = txtTLopHoc.Text;
                if (txtTKMSSV.Text != "")
                {
                    dtSV.DataSource = bus_sinhvien.LookSinhVien(bus_sinhvien.MSSV);                   
                }
               else
                {
                    if (txtTLopHoc.Text != "")
                    {
                        dtSV.DataSource = bus_sinhvien.LookLopSinhVien(bus_sinhvien.MaLopSV);
                    }
                }
                
        }
        private void btnXoaSV_Click(object sender, EventArgs e)
        {
            BUS_SinhVien bus_sinhvien = new BUS_SinhVien();
            bus_sinhvien.MSSV = txtTMSSV.Text;
            if (txtTMSSV.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
                bus_sinhvien.DeleteSinhVien(bus_sinhvien.MSSV);
                MessageBox.Show("Xóa Thành Công");
                dtSV.DataSource = bus_sinhvien.ShowSinhVien();
            }

        }
        private void btnSuaSV_Click(object sender, EventArgs e)
        {
            BUS_SinhVien bus_sinhvien = new BUS_SinhVien();
            bus_sinhvien.MSSV = txtTMSSV.Text;
            bus_sinhvien.HoTenSV = txtTHoTen.Text;
            bus_sinhvien.NgSinh = txtTNgSinh.Text;
            bus_sinhvien.MaLopSV = txtTLopHoc.Text;
            if (txtTMSSV.Text == "" || txtTHoTen.Text == "" || txtTNgSinh.Text == "" || txtTLopHoc.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
          bus_sinhvien.UpdateSinhVien(bus_sinhvien.MSSV,bus_sinhvien.HoTenSV,bus_sinhvien.NgSinh,bus_sinhvien.MaLopSV);
            MessageBox.Show("Sửa Thành Công");
            dtSV.DataSource = bus_sinhvien.ShowSinhVien();
        }}

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fSinhVien_Load(sender, e);
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dtSV_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dtSV.Rows[e.RowIndex];
                txtTMSSV.Text = row.Cells[0].Value.ToString();
                txtTHoTen.Text = row.Cells[1].Value.ToString();
                txtTNgSinh.Text = row.Cells[2].Value.ToString();
                txtTLopHoc.Text = row.Cells[3].Value.ToString();
            }
            catch (Exception) { }
        }

        private void txtTHoTen_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
        

 