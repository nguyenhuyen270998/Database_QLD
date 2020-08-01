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
    public partial class fTrangChu : Form
    {
        public fTrangChu()
        {
            InitializeComponent();
        }

        private void điểmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fDiemHP DiemHP = new fDiemHP();
            this.Hide();
            DiemHP.ShowDialog();
            this.Show();
        }

        private void họcPhầnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fHocPhan hp = new fHocPhan();
            this.Hide();
            hp.ShowDialog();
            this.Show();
        }

        private void đổiMậtKhẩuToolStripMenuItem1_Click(object sender, EventArgs e)
        {
           
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn có chắc chắn muốn Đăng Xuất không?", "trả lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK)
                this.Close();
           
            
        }

        private void việnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fVien Vien = new fVien();
            this.Hide();
            Vien.ShowDialog();
            this.Show();
        }

        private void chươngTrìnhĐàoTạoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fCTDT CTDT = new fCTDT();
            this.Hide();
            CTDT.ShowDialog();
            this.Show();
        }

        private void lớpSinhViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fLopSV LopSV = new fLopSV();
            this.Hide();
            LopSV.ShowDialog();
            this.Show();
        }

        private void danhMụcToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void sinhViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fSinhVien SV = new fSinhVien();
            this.Hide();
            SV.ShowDialog();
            this.Show();

        }

        private void giangViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fGiangVien GV = new fGiangVien();
            this.Hide();
            GV.ShowDialog();
            this.Show();
        }

        private void điểmToiecToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fDiemToiec DiemT = new fDiemToiec();
            this.Hide();
            DiemT.ShowDialog();
            this.Show();
        }

        private void kếtQuảHọcTậpGPACPAToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fCapNhat KQHT = new fCapNhat();
            this.Hide();
            KQHT.ShowDialog();
            this.Show();
        }

        private void sinhViênCảnhCáoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fCanhCao CanhCao = new fCanhCao();
            this.Hide();
            CanhCao.ShowDialog();
            this.Show();
        }

        private void fTrangChu_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void thôngKêToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void kếtQuảHọcTậpTheoLớpSinhViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fThongKe KetQua = new fThongKe();
            this.Hide();
            KetQua.ShowDialog();
            this.Show();
        }

    }
}
