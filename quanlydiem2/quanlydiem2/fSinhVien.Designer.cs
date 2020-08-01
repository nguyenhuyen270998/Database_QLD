namespace quanlydiem2
{
    partial class fSinhVien
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dtSV = new System.Windows.Forms.DataGridView();
            this.btnTroVe5 = new System.Windows.Forms.Button();
            this.lbTKMSSV = new System.Windows.Forms.Label();
            this.btnThemSV = new System.Windows.Forms.Button();
            this.btnSuaSV = new System.Windows.Forms.Button();
            this.btnXoaSV = new System.Windows.Forms.Button();
            this.txtTMSSV = new System.Windows.Forms.TextBox();
            this.lbTLopHoc = new System.Windows.Forms.Label();
            this.lbTHoten = new System.Windows.Forms.Label();
            this.lbTNgSinh = new System.Windows.Forms.Label();
            this.txtTHoTen = new System.Windows.Forms.TextBox();
            this.txtTNgSinh = new System.Windows.Forms.TextBox();
            this.txtTLopHoc = new System.Windows.Forms.TextBox();
            this.txtTKMSSV = new System.Windows.Forms.TextBox();
            this.btnTimKiemSV = new System.Windows.Forms.Button();
            this.btnReSet = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtSV)).BeginInit();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtSV
            // 
            this.dtSV.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.dtSV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtSV.Location = new System.Drawing.Point(15, 288);
            this.dtSV.Name = "dtSV";
            this.dtSV.Size = new System.Drawing.Size(623, 150);
            this.dtSV.TabIndex = 0;
            this.dtSV.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtSV_CellContentClick);
            this.dtSV.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dtSV_CellMouseClick);
            this.dtSV.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtSV_RowEnter);
            this.dtSV.RowPrePaint += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(this.dtSV_RowPrePaint);
            // 
            // btnTroVe5
            // 
            this.btnTroVe5.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnTroVe5.Location = new System.Drawing.Point(715, 3);
            this.btnTroVe5.Name = "btnTroVe5";
            this.btnTroVe5.Size = new System.Drawing.Size(75, 23);
            this.btnTroVe5.TabIndex = 1;
            this.btnTroVe5.Text = "Exit";
            this.btnTroVe5.UseVisualStyleBackColor = true;
            this.btnTroVe5.Click += new System.EventHandler(this.btnTroVe5_Click);
            // 
            // lbTKMSSV
            // 
            this.lbTKMSSV.AutoSize = true;
            this.lbTKMSSV.Location = new System.Drawing.Point(12, 207);
            this.lbTKMSSV.Name = "lbTKMSSV";
            this.lbTKMSSV.Size = new System.Drawing.Size(66, 13);
            this.lbTKMSSV.TabIndex = 3;
            this.lbTKMSSV.Text = "Nhập MSSV";
            // 
            // btnThemSV
            // 
            this.btnThemSV.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnThemSV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnThemSV.Location = new System.Drawing.Point(710, 307);
            this.btnThemSV.Name = "btnThemSV";
            this.btnThemSV.Size = new System.Drawing.Size(75, 23);
            this.btnThemSV.TabIndex = 4;
            this.btnThemSV.Text = "Thêm";
            this.btnThemSV.UseVisualStyleBackColor = true;
            this.btnThemSV.Click += new System.EventHandler(this.btnThemSV_Click);
            // 
            // btnSuaSV
            // 
            this.btnSuaSV.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnSuaSV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnSuaSV.Location = new System.Drawing.Point(710, 348);
            this.btnSuaSV.Name = "btnSuaSV";
            this.btnSuaSV.Size = new System.Drawing.Size(75, 23);
            this.btnSuaSV.TabIndex = 5;
            this.btnSuaSV.Text = "Sửa";
            this.btnSuaSV.UseVisualStyleBackColor = true;
            this.btnSuaSV.Click += new System.EventHandler(this.btnSuaSV_Click);
            // 
            // btnXoaSV
            // 
            this.btnXoaSV.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnXoaSV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnXoaSV.Location = new System.Drawing.Point(710, 386);
            this.btnXoaSV.Name = "btnXoaSV";
            this.btnXoaSV.Size = new System.Drawing.Size(75, 23);
            this.btnXoaSV.TabIndex = 6;
            this.btnXoaSV.Text = "Xóa";
            this.btnXoaSV.UseVisualStyleBackColor = true;
            this.btnXoaSV.Click += new System.EventHandler(this.btnXoaSV_Click);
            // 
            // txtTMSSV
            // 
            this.txtTMSSV.Location = new System.Drawing.Point(103, 200);
            this.txtTMSSV.Name = "txtTMSSV";
            this.txtTMSSV.Size = new System.Drawing.Size(100, 20);
            this.txtTMSSV.TabIndex = 8;
            // 
            // lbTLopHoc
            // 
            this.lbTLopHoc.AutoSize = true;
            this.lbTLopHoc.Location = new System.Drawing.Point(232, 238);
            this.lbTLopHoc.Name = "lbTLopHoc";
            this.lbTLopHoc.Size = new System.Drawing.Size(80, 13);
            this.lbTLopHoc.TabIndex = 9;
            this.lbTLopHoc.Text = "Nhập Lớp Học ";
            // 
            // lbTHoten
            // 
            this.lbTHoten.AutoSize = true;
            this.lbTHoten.Location = new System.Drawing.Point(232, 203);
            this.lbTHoten.Name = "lbTHoten";
            this.lbTHoten.Size = new System.Drawing.Size(72, 13);
            this.lbTHoten.TabIndex = 10;
            this.lbTHoten.Text = "Nhập Họ Tên";
            // 
            // lbTNgSinh
            // 
            this.lbTNgSinh.AutoSize = true;
            this.lbTNgSinh.Location = new System.Drawing.Point(12, 238);
            this.lbTNgSinh.Name = "lbTNgSinh";
            this.lbTNgSinh.Size = new System.Drawing.Size(85, 13);
            this.lbTNgSinh.TabIndex = 11;
            this.lbTNgSinh.Text = "Nhập Ngày Sinh";
            // 
            // txtTHoTen
            // 
            this.txtTHoTen.Location = new System.Drawing.Point(318, 200);
            this.txtTHoTen.Name = "txtTHoTen";
            this.txtTHoTen.Size = new System.Drawing.Size(186, 20);
            this.txtTHoTen.TabIndex = 13;
            this.txtTHoTen.TextChanged += new System.EventHandler(this.txtTHoTen_TextChanged);
            // 
            // txtTNgSinh
            // 
            this.txtTNgSinh.Location = new System.Drawing.Point(103, 235);
            this.txtTNgSinh.Name = "txtTNgSinh";
            this.txtTNgSinh.Size = new System.Drawing.Size(100, 20);
            this.txtTNgSinh.TabIndex = 14;
            // 
            // txtTLopHoc
            // 
            this.txtTLopHoc.Location = new System.Drawing.Point(318, 231);
            this.txtTLopHoc.Name = "txtTLopHoc";
            this.txtTLopHoc.Size = new System.Drawing.Size(100, 20);
            this.txtTLopHoc.TabIndex = 15;
            // 
            // txtTKMSSV
            // 
            this.txtTKMSSV.Location = new System.Drawing.Point(685, 200);
            this.txtTKMSSV.Name = "txtTKMSSV";
            this.txtTKMSSV.Size = new System.Drawing.Size(100, 20);
            this.txtTKMSSV.TabIndex = 16;
            // 
            // btnTimKiemSV
            // 
            this.btnTimKiemSV.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnTimKiemSV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.btnTimKiemSV.Location = new System.Drawing.Point(562, 197);
            this.btnTimKiemSV.Name = "btnTimKiemSV";
            this.btnTimKiemSV.Size = new System.Drawing.Size(85, 23);
            this.btnTimKiemSV.TabIndex = 17;
            this.btnTimKiemSV.Text = "Tìm Kiếm";
            this.btnTimKiemSV.UseVisualStyleBackColor = true;
            this.btnTimKiemSV.Click += new System.EventHandler(this.btnTimKiemSV_Click);
            // 
            // btnReSet
            // 
            this.btnReSet.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnReSet.Location = new System.Drawing.Point(627, 3);
            this.btnReSet.Name = "btnReSet";
            this.btnReSet.Size = new System.Drawing.Size(75, 23);
            this.btnReSet.TabIndex = 18;
            this.btnReSet.Text = "ReSet";
            this.btnReSet.UseVisualStyleBackColor = true;
            this.btnReSet.Click += new System.EventHandler(this.btnReSet_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(325, 151);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(225, 24);
            this.label1.TabIndex = 19;
            this.label1.Text = "Thông Tin Sinh Viên";
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.HotTrack;
            this.panel2.Controls.Add(this.panel1);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Controls.Add(this.label6);
            this.panel2.Location = new System.Drawing.Point(2, 3);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(898, 118);
            this.panel2.TabIndex = 20;
            this.panel2.Paint += new System.Windows.Forms.PaintEventHandler(this.panel2_Paint);
            // 
            // panel1
            // 
            this.panel1.BackgroundImage = global::quanlydiem2.Properties.Resources.tải_xuống;
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(82, 118);
            this.panel1.TabIndex = 3;
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.SystemColors.Highlight;
            this.panel3.Controls.Add(this.label4);
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.btnReSet);
            this.panel3.Controls.Add(this.btnTroVe5);
            this.panel3.Location = new System.Drawing.Point(99, 21);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(796, 76);
            this.panel3.TabIndex = 2;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Corbel", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label4.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label4.Location = new System.Drawing.Point(12, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(314, 29);
            this.label4.TabIndex = 0;
            this.label4.Text = "Student  Information  System";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("High Tower Text", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label5.Location = new System.Drawing.Point(14, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(322, 18);
            this.label5.TabIndex = 1;
            this.label5.Text = "HaNoi University of Science and Technology";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label6.ForeColor = System.Drawing.Color.White;
            this.label6.Location = new System.Drawing.Point(723, 2);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(145, 16);
            this.label6.TabIndex = 1;
            this.label6.Text = "Trang Chủ ĐHBKHN";
            // 
            // fSinhVien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(903, 458);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnTimKiemSV);
            this.Controls.Add(this.txtTKMSSV);
            this.Controls.Add(this.txtTLopHoc);
            this.Controls.Add(this.txtTNgSinh);
            this.Controls.Add(this.txtTHoTen);
            this.Controls.Add(this.lbTNgSinh);
            this.Controls.Add(this.lbTHoten);
            this.Controls.Add(this.lbTLopHoc);
            this.Controls.Add(this.txtTMSSV);
            this.Controls.Add(this.btnXoaSV);
            this.Controls.Add(this.btnSuaSV);
            this.Controls.Add(this.btnThemSV);
            this.Controls.Add(this.lbTKMSSV);
            this.Controls.Add(this.dtSV);
            this.Name = "fSinhVien";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thông Tin Sinh Viên";
            this.Load += new System.EventHandler(this.fSinhVien_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtSV)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtSV;
        private System.Windows.Forms.Button btnTroVe5;
        private System.Windows.Forms.Label lbTKMSSV;
        private System.Windows.Forms.Button btnThemSV;
        private System.Windows.Forms.Button btnSuaSV;
        private System.Windows.Forms.Button btnXoaSV;
        private System.Windows.Forms.TextBox txtTMSSV;
        private System.Windows.Forms.Label lbTLopHoc;
        private System.Windows.Forms.Label lbTHoten;
        private System.Windows.Forms.Label lbTNgSinh;
        private System.Windows.Forms.TextBox txtTHoTen;
        private System.Windows.Forms.TextBox txtTNgSinh;
        private System.Windows.Forms.TextBox txtTLopHoc;
        private System.Windows.Forms.TextBox txtTKMSSV;
        private System.Windows.Forms.Button btnTimKiemSV;
        private System.Windows.Forms.Button btnReSet;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
    }
}