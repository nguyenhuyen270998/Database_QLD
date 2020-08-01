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
    public partial class fDiemToiec : Form
    {
        public fDiemToiec()
        {
            InitializeComponent();
        }

        private void btnTroVe8_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtSCD_TextChanged(object sender, EventArgs e)
        {

        }

        private void fDiemToiec_Load(object sender, EventArgs e)
        {
            BUS_DiemToeic bus_diemtoeic = new BUS_DiemToeic();
            dtDiemToeic.DataSource = bus_diemtoeic.ShowDiemToeic();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnThemDiemT_Click(object sender, EventArgs e)
        {
            BUS_DiemToeic bus_diemtoeic = new BUS_DiemToeic();
            bus_diemtoeic.MSSV = txtMSSVDT.Text;
            bus_diemtoeic.NgayThi = txtNgayThi.Text;
            bus_diemtoeic.SoCauDoc = txtSCD.Text;
            bus_diemtoeic.SoCauNghe = txtSCN.Text;
            if (txtMSSVDT.Text == "" || txtNgayThi.Text == "" || txtSCD.Text == "" || txtSCN.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
                try{
                if (bus_diemtoeic.InsertDiemToeic(bus_diemtoeic) > 0)
                {
                    MessageBox.Show("Thêm Thành Công");
                    fDiemToiec_Load(sender, e);
                }}
                catch
                {
                    MessageBox.Show("Thêm Thất Bại");
                }
            }
        }

        private void btnSuaDiemT_Click(object sender, EventArgs e)
        {
            BUS_DiemToeic bus_diemtoeic = new BUS_DiemToeic();
            bus_diemtoeic.MSSV = txtMSSVDT.Text;
            bus_diemtoeic.NgayThi = txtNgayThi.Text;
            bus_diemtoeic.SoCauDoc = txtSCD.Text;
            bus_diemtoeic.SoCauNghe = txtSCN.Text;
            if (txtMSSVDT.Text == "" || txtNgayThi.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
                bus_diemtoeic.UpdateDiemToeic(bus_diemtoeic.MSSV, bus_diemtoeic.NgayThi, bus_diemtoeic.SoCauDoc, bus_diemtoeic.SoCauNghe);
                MessageBox.Show("Sửa Thành Công");
                dtDiemToeic.DataSource = bus_diemtoeic.ShowDiemToeic();
            }
        }

        private void btnTimKiemDiemToiec_Click(object sender, EventArgs e)
        {
            BUS_DiemToeic bus_diemtoeic = new BUS_DiemToeic();
            bus_diemtoeic.MSSV = txtMSSVDT.Text;
            bus_diemtoeic.NgayThi = txtNgayThi.Text;

            if (txtMSSVDT.Text != "" && txtNgayThi.Text == "")
            {
                dtDiemToeic.DataSource = bus_diemtoeic.LookDiemToeicSV(bus_diemtoeic.MSSV);
            }
            if (txtMSSVDT.Text != "" && txtNgayThi.Text != "")
            {
                dtDiemToeic.DataSource = bus_diemtoeic.LookDiemToeic(bus_diemtoeic.MSSV, bus_diemtoeic.NgayThi);
            }


        }

        private void btnLuuDiemT_Click(object sender, EventArgs e)
        {
            fDiemToiec_Load(sender, e);
        }

        private void dtDiemToeic_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dtDiemToeic.Rows[e.RowIndex];
                txtMSSVDT.Text = row.Cells[0].Value.ToString();
                txtNgayThi.Text = row.Cells[1].Value.ToString();
                txtSCD.Text = row.Cells[2].Value.ToString();
                txtSCN.Text = row.Cells[3].Value.ToString();
            }
            catch (Exception) { }
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}


