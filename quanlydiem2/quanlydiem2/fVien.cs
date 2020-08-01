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
    public partial class fVien : Form
    {
        public fVien()
        {
            InitializeComponent();
        }

        private void btnTroVe2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void fVien_Load(object sender, EventArgs e)
        {
            BUS_Vien bus_vien = new BUS_Vien();
            dtVien.DataSource = bus_vien.ShowVien();
        }
    }
}
