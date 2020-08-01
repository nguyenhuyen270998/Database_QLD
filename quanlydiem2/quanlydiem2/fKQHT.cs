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
    public partial class fCapNhat : Form
    {
        public fCapNhat()
        {
            InitializeComponent();
        }

        private void fKQHT_Load(object sender, EventArgs e)
        {
            BUS_KQHT bus_ketquahoctap = new BUS_KQHT();
            dtKQHT.DataSource = bus_ketquahoctap.ShowKetQuaHocTap();
        }


        private void btnTroVe9_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            BUS_KQHT bus_ketquahoctap = new BUS_KQHT();
            bus_ketquahoctap.MSSV = txtMSSV.Text;
            bus_ketquahoctap.HocKy = txtHocKy.Text;
            if (txtMSSV.Text == "" || txtHocKy.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập đủ dữ liệu");
            }
            else
            { try{
                if (bus_ketquahoctap.InsertKetQuaHocTap(bus_ketquahoctap) > 0)
                {
                    MessageBox.Show("Thêm Thành Công");
                    fKQHT_Load(sender, e);
                }}
                catch
                {
                    MessageBox.Show("Thêm Thất Bại");
                }
            }
        }
        private void btnTimKiemKQHT_Click(object sender, EventArgs e)
        {
            BUS_KQHT bus_ketquahoctap = new BUS_KQHT();
            bus_ketquahoctap.MSSV = txtMSSV.Text;

            if (txtMSSV.Text != "" )
            {
                dtKQHT.DataSource = bus_ketquahoctap.LookKetQuaHocTap(bus_ketquahoctap.MSSV);
            }
            
        }

        private void btnCapNhatGPA_Click(object sender, EventArgs e)
        {
            BUS_KQHT bus_ketquahoctap = new BUS_KQHT();
            bus_ketquahoctap.HocKy = txtHocKy.Text;
            if (txtHocKy.Text == "")
            {
                MessageBox.Show(" bạn chưa nhập Học Kỳ cần cập nhật GPA");
            }
            else
            {
                dtKQHT.DataSource = bus_ketquahoctap.CapNhatGPA(bus_ketquahoctap.HocKy);
                MessageBox.Show(" Cập Nhật Điểm  Thành Công");
                fKQHT_Load(sender, e);

            }
        }

        private void btnCapNhatCPA_Click(object sender, EventArgs e)
        {
            BUS_KQHT bus_ketquahoctap = new BUS_KQHT();
            bus_ketquahoctap.HocKy = txtHocKy.Text;
            if (txtHocKy.Text == "")
            {
                MessageBox.Show(" bạn chưa nhập Học Kỳ cần cập nhật CPA");
            }
            else
            {
                dtKQHT.DataSource = bus_ketquahoctap.CapNhatCPA(bus_ketquahoctap.HocKy);
                MessageBox.Show(" Cập Nhật Điểm  Thành Công");
                fKQHT_Load(sender, e);

            }
        }

        private void btnReSet_Click(object sender, EventArgs e)
        {
            fKQHT_Load(sender, e);
        }

        private void lbHK_Click(object sender, EventArgs e)
        {

        }

    }
}
