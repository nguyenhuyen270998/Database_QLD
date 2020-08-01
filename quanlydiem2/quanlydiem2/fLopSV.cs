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
    public partial class fLopSV : Form
    {
        public fLopSV()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void fLopSV_Load(object sender, EventArgs e)
        {

            BUS_LopSV bus_lopsv = new BUS_LopSV();
            cboLopSV.DataSource = bus_lopsv.ShowLopSV();
            cboLopSV.DisplayMember = "MaLopSV";
            
        }

        private void btnTimKiemLopSV_Click(object sender, EventArgs e)
        {
            BUS_LopSV bus_lopsv = new BUS_LopSV();
            bus_lopsv.MaLopSV = cboLopSV.Text;
            bus_lopsv.MaNganh = txtMaNganh.Text;
            bus_lopsv.GVCN = txtGVCN.Text;
            dtLopSV.DataSource = bus_lopsv.LookLopSV(bus_lopsv.MaLopSV,bus_lopsv.MaNganh,bus_lopsv.GVCN);
        }

        private void cboLopSV_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fLopSV_Load(sender, e);
        }

        private void dtLopSV_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
