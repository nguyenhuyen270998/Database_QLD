namespace quanlydiem2
{
    partial class fDiemToiec
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
            this.dtDiemToeic = new System.Windows.Forms.DataGridView();
            this.txtSCD = new System.Windows.Forms.TextBox();
            this.txtNgayThi = new System.Windows.Forms.TextBox();
            this.txtMSSVDT = new System.Windows.Forms.TextBox();
            this.txtSCN = new System.Windows.Forms.TextBox();
            this.lbMSSVDT = new System.Windows.Forms.Label();
            this.lbSCD = new System.Windows.Forms.Label();
            this.lbNgayThi = new System.Windows.Forms.Label();
            this.lbSCN = new System.Windows.Forms.Label();
            this.btnThemDiemT = new System.Windows.Forms.Button();
            this.btnReSet = new System.Windows.Forms.Button();
            this.btnSuaDiemT = new System.Windows.Forms.Button();
            this.btnTroVe8 = new System.Windows.Forms.Button();
            this.btnTimKiemDiemToiec = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtDiemToeic)).BeginInit();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtDiemToeic
            // 
            this.dtDiemToeic.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.dtDiemToeic.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtDiemToeic.Location = new System.Drawing.Point(5, 263);
            this.dtDiemToeic.Name = "dtDiemToeic";
            this.dtDiemToeic.Size = new System.Drawing.Size(644, 150);
            this.dtDiemToeic.TabIndex = 0;
            this.dtDiemToeic.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dtDiemToeic.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dtDiemToeic_CellMouseClick);
            // 
            // txtSCD
            // 
            this.txtSCD.Location = new System.Drawing.Point(330, 183);
            this.txtSCD.Name = "txtSCD";
            this.txtSCD.Size = new System.Drawing.Size(100, 20);
            this.txtSCD.TabIndex = 13;
            this.txtSCD.TextChanged += new System.EventHandler(this.txtSCD_TextChanged);
            // 
            // txtNgayThi
            // 
            this.txtNgayThi.Location = new System.Drawing.Point(87, 221);
            this.txtNgayThi.Name = "txtNgayThi";
            this.txtNgayThi.Size = new System.Drawing.Size(100, 20);
            this.txtNgayThi.TabIndex = 14;
            // 
            // txtMSSVDT
            // 
            this.txtMSSVDT.Location = new System.Drawing.Point(87, 183);
            this.txtMSSVDT.Name = "txtMSSVDT";
            this.txtMSSVDT.Size = new System.Drawing.Size(100, 20);
            this.txtMSSVDT.TabIndex = 15;
            // 
            // txtSCN
            // 
            this.txtSCN.Location = new System.Drawing.Point(330, 224);
            this.txtSCN.Name = "txtSCN";
            this.txtSCN.Size = new System.Drawing.Size(100, 20);
            this.txtSCN.TabIndex = 17;
            // 
            // lbMSSVDT
            // 
            this.lbMSSVDT.AutoSize = true;
            this.lbMSSVDT.Location = new System.Drawing.Point(12, 190);
            this.lbMSSVDT.Name = "lbMSSVDT";
            this.lbMSSVDT.Size = new System.Drawing.Size(37, 13);
            this.lbMSSVDT.TabIndex = 18;
            this.lbMSSVDT.Text = "MSSV";
            // 
            // lbSCD
            // 
            this.lbSCD.AutoSize = true;
            this.lbSCD.Location = new System.Drawing.Point(249, 186);
            this.lbSCD.Name = "lbSCD";
            this.lbSCD.Size = new System.Drawing.Size(68, 13);
            this.lbSCD.TabIndex = 19;
            this.lbSCD.Text = "Số Câu Đọc ";
            // 
            // lbNgayThi
            // 
            this.lbNgayThi.AutoSize = true;
            this.lbNgayThi.Location = new System.Drawing.Point(12, 224);
            this.lbNgayThi.Name = "lbNgayThi";
            this.lbNgayThi.Size = new System.Drawing.Size(50, 13);
            this.lbNgayThi.TabIndex = 20;
            this.lbNgayThi.Text = "Ngày Thi";
            // 
            // lbSCN
            // 
            this.lbSCN.AutoSize = true;
            this.lbSCN.Location = new System.Drawing.Point(243, 228);
            this.lbSCN.Name = "lbSCN";
            this.lbSCN.Size = new System.Drawing.Size(74, 13);
            this.lbSCN.TabIndex = 22;
            this.lbSCN.Text = "Số Câu Nghe ";
            // 
            // btnThemDiemT
            // 
            this.btnThemDiemT.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnThemDiemT.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnThemDiemT.Location = new System.Drawing.Point(769, 332);
            this.btnThemDiemT.Name = "btnThemDiemT";
            this.btnThemDiemT.Size = new System.Drawing.Size(75, 23);
            this.btnThemDiemT.TabIndex = 23;
            this.btnThemDiemT.Text = "Thêm";
            this.btnThemDiemT.UseVisualStyleBackColor = true;
            this.btnThemDiemT.Click += new System.EventHandler(this.btnThemDiemT_Click);
            // 
            // btnReSet
            // 
            this.btnReSet.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnReSet.Location = new System.Drawing.Point(646, 9);
            this.btnReSet.Name = "btnReSet";
            this.btnReSet.Size = new System.Drawing.Size(75, 23);
            this.btnReSet.TabIndex = 24;
            this.btnReSet.Text = "Reset";
            this.btnReSet.UseVisualStyleBackColor = true;
            this.btnReSet.Click += new System.EventHandler(this.btnLuuDiemT_Click);
            // 
            // btnSuaDiemT
            // 
            this.btnSuaDiemT.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnSuaDiemT.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnSuaDiemT.Location = new System.Drawing.Point(769, 379);
            this.btnSuaDiemT.Name = "btnSuaDiemT";
            this.btnSuaDiemT.Size = new System.Drawing.Size(75, 23);
            this.btnSuaDiemT.TabIndex = 26;
            this.btnSuaDiemT.Text = "Sửa";
            this.btnSuaDiemT.UseVisualStyleBackColor = true;
            this.btnSuaDiemT.Click += new System.EventHandler(this.btnSuaDiemT_Click);
            // 
            // btnTroVe8
            // 
            this.btnTroVe8.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnTroVe8.Location = new System.Drawing.Point(747, 9);
            this.btnTroVe8.Name = "btnTroVe8";
            this.btnTroVe8.Size = new System.Drawing.Size(75, 23);
            this.btnTroVe8.TabIndex = 27;
            this.btnTroVe8.Text = "Exit";
            this.btnTroVe8.UseVisualStyleBackColor = true;
            this.btnTroVe8.Click += new System.EventHandler(this.btnTroVe8_Click);
            // 
            // btnTimKiemDiemToiec
            // 
            this.btnTimKiemDiemToiec.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnTimKiemDiemToiec.ForeColor = System.Drawing.Color.Fuchsia;
            this.btnTimKiemDiemToiec.Location = new System.Drawing.Point(12, 140);
            this.btnTimKiemDiemToiec.Name = "btnTimKiemDiemToiec";
            this.btnTimKiemDiemToiec.Size = new System.Drawing.Size(99, 23);
            this.btnTimKiemDiemToiec.TabIndex = 28;
            this.btnTimKiemDiemToiec.Text = "Tìm Kiếm";
            this.btnTimKiemDiemToiec.UseVisualStyleBackColor = true;
            this.btnTimKiemDiemToiec.Click += new System.EventHandler(this.btnTimKiemDiemToiec_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(362, 140);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(222, 24);
            this.label1.TabIndex = 29;
            this.label1.Text = "Quản Lý Điểm Toeic";
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.HotTrack;
            this.panel2.Controls.Add(this.panel1);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Controls.Add(this.label6);
            this.panel2.Location = new System.Drawing.Point(5, 5);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(927, 118);
            this.panel2.TabIndex = 30;
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
            this.panel3.Controls.Add(this.btnTroVe8);
            this.panel3.Location = new System.Drawing.Point(99, 21);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(825, 76);
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
            this.label6.Location = new System.Drawing.Point(761, 2);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(145, 16);
            this.label6.TabIndex = 1;
            this.label6.Text = "Trang Chủ ĐHBKHN";
            // 
            // fDiemToiec
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(933, 485);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnTimKiemDiemToiec);
            this.Controls.Add(this.btnSuaDiemT);
            this.Controls.Add(this.btnThemDiemT);
            this.Controls.Add(this.lbSCN);
            this.Controls.Add(this.lbNgayThi);
            this.Controls.Add(this.lbSCD);
            this.Controls.Add(this.lbMSSVDT);
            this.Controls.Add(this.txtSCN);
            this.Controls.Add(this.txtMSSVDT);
            this.Controls.Add(this.txtNgayThi);
            this.Controls.Add(this.txtSCD);
            this.Controls.Add(this.dtDiemToeic);
            this.Name = "fDiemToiec";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Điểm Toiec ";
            this.Load += new System.EventHandler(this.fDiemToiec_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtDiemToeic)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtDiemToeic;
        private System.Windows.Forms.TextBox txtSCD;
        private System.Windows.Forms.TextBox txtNgayThi;
        private System.Windows.Forms.TextBox txtMSSVDT;
        private System.Windows.Forms.TextBox txtSCN;
        private System.Windows.Forms.Label lbMSSVDT;
        private System.Windows.Forms.Label lbSCD;
        private System.Windows.Forms.Label lbNgayThi;
        private System.Windows.Forms.Label lbSCN;
        private System.Windows.Forms.Button btnThemDiemT;
        private System.Windows.Forms.Button btnReSet;
        private System.Windows.Forms.Button btnSuaDiemT;
        private System.Windows.Forms.Button btnTroVe8;
        private System.Windows.Forms.Button btnTimKiemDiemToiec;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
    }
}