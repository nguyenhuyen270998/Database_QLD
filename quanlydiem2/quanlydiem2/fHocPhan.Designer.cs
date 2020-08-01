namespace quanlydiem2
{
    partial class fHocPhan
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
            this.dtHocPhan = new System.Windows.Forms.DataGridView();
            this.txtTimKiemHP = new System.Windows.Forms.TextBox();
            this.btnTroVe1 = new System.Windows.Forms.Button();
            this.btnTimKiemHP = new System.Windows.Forms.Button();
            this.btnReSet = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtHocPhan)).BeginInit();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtHocPhan
            // 
            this.dtHocPhan.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.dtHocPhan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtHocPhan.Location = new System.Drawing.Point(183, 234);
            this.dtHocPhan.Name = "dtHocPhan";
            this.dtHocPhan.Size = new System.Drawing.Size(545, 178);
            this.dtHocPhan.TabIndex = 0;
            this.dtHocPhan.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtHocPhan_CellContentClick);
            // 
            // txtTimKiemHP
            // 
            this.txtTimKiemHP.Location = new System.Drawing.Point(114, 188);
            this.txtTimKiemHP.Name = "txtTimKiemHP";
            this.txtTimKiemHP.Size = new System.Drawing.Size(139, 20);
            this.txtTimKiemHP.TabIndex = 2;
            // 
            // btnTroVe1
            // 
            this.btnTroVe1.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnTroVe1.Location = new System.Drawing.Point(718, 3);
            this.btnTroVe1.Name = "btnTroVe1";
            this.btnTroVe1.Size = new System.Drawing.Size(75, 23);
            this.btnTroVe1.TabIndex = 3;
            this.btnTroVe1.Text = "Exit";
            this.btnTroVe1.UseVisualStyleBackColor = true;
            this.btnTroVe1.Click += new System.EventHandler(this.btnTroVe1_Click);
            // 
            // btnTimKiemHP
            // 
            this.btnTimKiemHP.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnTimKiemHP.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.btnTimKiemHP.Location = new System.Drawing.Point(12, 188);
            this.btnTimKiemHP.Name = "btnTimKiemHP";
            this.btnTimKiemHP.Size = new System.Drawing.Size(79, 23);
            this.btnTimKiemHP.TabIndex = 8;
            this.btnTimKiemHP.Text = "Tìm Kiếm";
            this.btnTimKiemHP.UseVisualStyleBackColor = true;
            this.btnTimKiemHP.Click += new System.EventHandler(this.btnTimKiemHP_Click);
            // 
            // btnReSet
            // 
            this.btnReSet.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnReSet.Location = new System.Drawing.Point(627, 3);
            this.btnReSet.Name = "btnReSet";
            this.btnReSet.Size = new System.Drawing.Size(75, 23);
            this.btnReSet.TabIndex = 9;
            this.btnReSet.Text = "ReSet";
            this.btnReSet.UseVisualStyleBackColor = true;
            this.btnReSet.Click += new System.EventHandler(this.btnReSet_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(343, 143);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(218, 24);
            this.label1.TabIndex = 10;
            this.label1.Text = "Danh Mục Học Phần";
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.HotTrack;
            this.panel2.Controls.Add(this.panel1);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Controls.Add(this.label6);
            this.panel2.Location = new System.Drawing.Point(1, 3);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(898, 118);
            this.panel2.TabIndex = 15;
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
            this.panel3.Controls.Add(this.btnTroVe1);
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
            // fHocPhan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(902, 479);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnTimKiemHP);
            this.Controls.Add(this.txtTimKiemHP);
            this.Controls.Add(this.dtHocPhan);
            this.Name = "fHocPhan";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Danh Sách  Học Phần";
            this.Load += new System.EventHandler(this.fHocPhan_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtHocPhan)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtHocPhan;
        private System.Windows.Forms.TextBox txtTimKiemHP;
        private System.Windows.Forms.Button btnTroVe1;
        private System.Windows.Forms.Button btnTimKiemHP;
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