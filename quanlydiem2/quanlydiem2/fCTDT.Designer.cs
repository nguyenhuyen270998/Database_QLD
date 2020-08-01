namespace quanlydiem2
{
    partial class fCTDT
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
            this.dtCTDT = new System.Windows.Forms.DataGridView();
            this.txtCTDTMaNganh = new System.Windows.Forms.TextBox();
            this.btnTroVe3 = new System.Windows.Forms.Button();
            this.btnTimKiemCTDT = new System.Windows.Forms.Button();
            this.txtCTDTMaHP = new System.Windows.Forms.TextBox();
            this.btnReSet = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtCTDT)).BeginInit();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtCTDT
            // 
            this.dtCTDT.BackgroundColor = System.Drawing.Color.Aquamarine;
            this.dtCTDT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtCTDT.Location = new System.Drawing.Point(201, 252);
            this.dtCTDT.Name = "dtCTDT";
            this.dtCTDT.Size = new System.Drawing.Size(476, 150);
            this.dtCTDT.TabIndex = 0;
            // 
            // txtCTDTMaNganh
            // 
            this.txtCTDTMaNganh.Location = new System.Drawing.Point(210, 193);
            this.txtCTDTMaNganh.Name = "txtCTDTMaNganh";
            this.txtCTDTMaNganh.Size = new System.Drawing.Size(100, 20);
            this.txtCTDTMaNganh.TabIndex = 2;
            // 
            // btnTroVe3
            // 
            this.btnTroVe3.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnTroVe3.Location = new System.Drawing.Point(715, 3);
            this.btnTroVe3.Name = "btnTroVe3";
            this.btnTroVe3.Size = new System.Drawing.Size(75, 23);
            this.btnTroVe3.TabIndex = 3;
            this.btnTroVe3.Text = "Exit";
            this.btnTroVe3.UseVisualStyleBackColor = true;
            this.btnTroVe3.Click += new System.EventHandler(this.btnTroVe3_Click);
            // 
            // btnTimKiemCTDT
            // 
            this.btnTimKiemCTDT.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnTimKiemCTDT.ForeColor = System.Drawing.Color.MediumOrchid;
            this.btnTimKiemCTDT.Location = new System.Drawing.Point(12, 208);
            this.btnTimKiemCTDT.Name = "btnTimKiemCTDT";
            this.btnTimKiemCTDT.Size = new System.Drawing.Size(87, 23);
            this.btnTimKiemCTDT.TabIndex = 8;
            this.btnTimKiemCTDT.Text = "Tìm Kiếm";
            this.btnTimKiemCTDT.UseVisualStyleBackColor = true;
            this.btnTimKiemCTDT.Click += new System.EventHandler(this.btnTimKiemCTDT_Click);
            // 
            // txtCTDTMaHP
            // 
            this.txtCTDTMaHP.Location = new System.Drawing.Point(210, 224);
            this.txtCTDTMaHP.Name = "txtCTDTMaHP";
            this.txtCTDTMaHP.Size = new System.Drawing.Size(100, 20);
            this.txtCTDTMaHP.TabIndex = 9;
            // 
            // btnReSet
            // 
            this.btnReSet.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.btnReSet.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.btnReSet.Location = new System.Drawing.Point(627, 3);
            this.btnReSet.Name = "btnReSet";
            this.btnReSet.Size = new System.Drawing.Size(75, 23);
            this.btnReSet.TabIndex = 10;
            this.btnReSet.Text = "Reset";
            this.btnReSet.UseVisualStyleBackColor = false;
            this.btnReSet.Click += new System.EventHandler(this.btnReSet_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(111, 198);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 15);
            this.label1.TabIndex = 11;
            this.label1.Text = "mã ngành";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(111, 227);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(72, 13);
            this.label2.TabIndex = 12;
            this.label2.Text = " mã học phần";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Lucida Sans Unicode", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Red;
            this.label3.Location = new System.Drawing.Point(273, 145);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(294, 20);
            this.label3.TabIndex = 13;
            this.label3.Text = "Chương Trình Đào Tạo ĐHBKHN ";
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.SystemColors.HotTrack;
            this.panel2.Controls.Add(this.panel1);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Controls.Add(this.label6);
            this.panel2.Location = new System.Drawing.Point(1, 4);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(898, 118);
            this.panel2.TabIndex = 14;
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
            this.panel3.Controls.Add(this.btnTroVe3);
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
            // fCTDT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(898, 476);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtCTDTMaHP);
            this.Controls.Add(this.btnTimKiemCTDT);
            this.Controls.Add(this.txtCTDTMaNganh);
            this.Controls.Add(this.dtCTDT);
            this.Name = "fCTDT";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Chương Trình Đào Tạo";
            this.Load += new System.EventHandler(this.fCTDT_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtCTDT)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtCTDT;
        private System.Windows.Forms.TextBox txtCTDTMaNganh;
        private System.Windows.Forms.Button btnTroVe3;
        private System.Windows.Forms.Button btnTimKiemCTDT;
        private System.Windows.Forms.TextBox txtCTDTMaHP;
        private System.Windows.Forms.Button btnReSet;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panel1;
    }
}