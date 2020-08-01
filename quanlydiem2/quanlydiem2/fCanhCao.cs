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
    public partial class fCanhCao : Form
    {
        public fCanhCao()
        {
            InitializeComponent();
        }

        private void fCanhCao_Load(object sender, EventArgs e)
        {
            BUS_CanhCao bus_canhcao = new BUS_CanhCao();
            dtCanhCao.DataSource = bus_canhcao.ShowCanhCao();
        }

        private void btnTroVe0_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            BUS_CanhCao bus_canhcao = new BUS_CanhCao();
            bus_canhcao.MSSV = txtMSSV.Text;
            bus_canhcao.HocKy = txtHocKy.Text;
            if (txtMSSV.Text == "" || txtHocKy.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            {
                try
                {
                    if (bus_canhcao.InsertCanhCao(bus_canhcao) > 0)
                    {
                        MessageBox.Show("Thêm Thành Công");
                        fCanhCao_Load(sender, e);
                    }
                }
                catch
                {
                    
                        MessageBox.Show("Thêm Thất Bại");
                    
                }
            }
        }

        private void btnTimKiemCC_Click(object sender, EventArgs e)
        {
            BUS_CanhCao bus_canhcao = new BUS_CanhCao();
            bus_canhcao.MSSV = txtMSSV.Text;
            if (txtMSSV.Text != "" )
            {
                dtCanhCao.DataSource = bus_canhcao.LookCanhCao(bus_canhcao.MSSV);
            }
            
        }

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fCanhCao_Load(sender, e);
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dtCanhCao_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void dtCanhCao_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dtCanhCao.Rows[e.RowIndex];
                txtMSSV.Text = row.Cells[0].Value.ToString();
                txtHocKy.Text = row.Cells[2].Value.ToString();
            }
            catch (Exception) { }
        
        }
    }
}
