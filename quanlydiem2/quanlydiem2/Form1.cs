using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace quanlydiem2
{
    public partial class fHeThong : Form
    {
        public fHeThong()
        {
            InitializeComponent();
        }


        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void panel1_Paint_1(object sender, PaintEventArgs e)
        {

        }

        
        private void btnLogin_Click(object sender, EventArgs e)
        {
            if ((this.txtUser.Text == "Admin") && (this.txtPass.Text == "1"))
            {
                fTrangChu tc = new fTrangChu();
                this.Hide();
                tc.ShowDialog();
                this.Show();
                
                
            }
            else MessageBox.Show("Không đúng tên người dùng/mật khẩu", "Thông Báo");
            this.txtUser.Focus();
            
        }
        private void btnExit_Click(object sender, EventArgs e)
        {
            DialogResult tl;
            tl = MessageBox.Show("Bạn có chắc chắn muốn thoát không?", "trả lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (tl == DialogResult.OK)
                Application.Exit();
           


        }

        private void txtUser_TextChanged(object sender, EventArgs e)
        {

        }
        


    }
}
