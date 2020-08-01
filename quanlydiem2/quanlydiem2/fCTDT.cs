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
    public partial class fCTDT : Form
    {
        public fCTDT()
        {
            InitializeComponent();
        }

        private void btnTroVe3_Click(object sender, EventArgs e)
        {
            this.Close();
                
        }

        private void fCTDT_Load(object sender, EventArgs e)
        {
            BUS_CTDT bus_ctdt = new BUS_CTDT();
            dtCTDT.DataSource = bus_ctdt.ShowCTDT();
         
        }

        private void btnTimKiemCTDT_Click(object sender, EventArgs e)
        { 
            BUS_CTDT bus_ctdt= new BUS_CTDT();
            if (txtCTDTMaHP.Text == "" || txtCTDTMaNganh.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ thông tin cần tìm");
            }
            else
            {
                bus_ctdt.MaNganh = txtCTDTMaNganh.Text;
                bus_ctdt.MaHP = txtCTDTMaHP.Text;
                dtCTDT.DataSource = bus_ctdt.LookCTDT(bus_ctdt.MaNganh, bus_ctdt.MaHP);
            }
        }           

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fCTDT_Load(sender, e);
        }
           

        }
    }

