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
namespace quanlydiem2
{
    public partial class fHocPhan : Form
    {
        public fHocPhan()
        {
            InitializeComponent();
        }

        private void dtHocPhan_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnTroVe1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void fHocPhan_Load(object sender, EventArgs e)
        {
            BUS_HocPhan bus_hocphan = new BUS_HocPhan();
            dtHocPhan.DataSource = bus_hocphan.ShowHocPhan();
        }

        private void btnTimKiemHP_Click(object sender, EventArgs e)
        {
            BUS_HocPhan bus_hocphan = new BUS_HocPhan();
            bus_hocphan.MaHP = txtTimKiemHP.Text;
            dtHocPhan.DataSource = bus_hocphan.LookHocPhan(bus_hocphan.MaHP);
            if (txtTimKiemHP.Text == "")
            {
                MessageBox.Show("Không Tìm thấy Học Phần");

            }
                

        }
      private void btnReSet_Click(object sender, EventArgs e)
        {
            fHocPhan_Load(sender, e);
        }
    }
}
