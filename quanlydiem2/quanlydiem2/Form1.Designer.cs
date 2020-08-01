namespace quanlydiem2
{
    partial class fHeThong
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.txtUser = new System.Windows.Forms.TextBox();
            this.lbNameLogin = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txtPass = new System.Windows.Forms.TextBox();
            this.lbPassLogin = new System.Windows.Forms.Label();
            this.btnLogin = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel5.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.txtUser);
            this.panel1.Controls.Add(this.lbNameLogin);
            this.panel1.Location = new System.Drawing.Point(305, 186);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(388, 39);
            this.panel1.TabIndex = 0;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint_1);
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(148, 13);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(201, 20);
            this.txtUser.TabIndex = 1;
            this.txtUser.Text = "Admin";
            this.txtUser.TextChanged += new System.EventHandler(this.txtUser_TextChanged);
            // 
            // lbNameLogin
            // 
            this.lbNameLogin.AutoSize = true;
            this.lbNameLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbNameLogin.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.lbNameLogin.Location = new System.Drawing.Point(13, 13);
            this.lbNameLogin.Name = "lbNameLogin";
            this.lbNameLogin.Size = new System.Drawing.Size(107, 15);
            this.lbNameLogin.TabIndex = 0;
            this.lbNameLogin.Text = "Tên Đăng Nhập";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.txtPass);
            this.panel2.Controls.Add(this.lbPassLogin);
            this.panel2.Location = new System.Drawing.Point(305, 263);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(388, 39);
            this.panel2.TabIndex = 1;
            // 
            // txtPass
            // 
            this.txtPass.Location = new System.Drawing.Point(148, 10);
            this.txtPass.Name = "txtPass";
            this.txtPass.Size = new System.Drawing.Size(201, 20);
            this.txtPass.TabIndex = 1;
            this.txtPass.Text = "1";
            this.txtPass.UseSystemPasswordChar = true;
            // 
            // lbPassLogin
            // 
            this.lbPassLogin.AutoSize = true;
            this.lbPassLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbPassLogin.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.lbPassLogin.Location = new System.Drawing.Point(13, 17);
            this.lbPassLogin.Name = "lbPassLogin";
            this.lbPassLogin.Size = new System.Drawing.Size(72, 15);
            this.lbPassLogin.TabIndex = 0;
            this.lbPassLogin.Text = "Mật Khẩu ";
            // 
            // btnLogin
            // 
            this.btnLogin.ForeColor = System.Drawing.Color.Red;
            this.btnLogin.Location = new System.Drawing.Point(603, 9);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(98, 23);
            this.btnLogin.TabIndex = 2;
            this.btnLogin.Text = "Đăng Nhập ";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // btnExit
            // 
            this.btnExit.ForeColor = System.Drawing.Color.Red;
            this.btnExit.Location = new System.Drawing.Point(718, 9);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 23);
            this.btnExit.TabIndex = 3;
            this.btnExit.Text = "Thoát";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.label1.Location = new System.Drawing.Point(402, 142);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(169, 18);
            this.label1.TabIndex = 4;
            this.label1.Text = "Đăng Nhập Hệ Thống";
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.SystemColors.HotTrack;
            this.panel3.Controls.Add(this.panel4);
            this.panel3.Controls.Add(this.panel5);
            this.panel3.Controls.Add(this.label6);
            this.panel3.Location = new System.Drawing.Point(12, 3);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(898, 118);
            this.panel3.TabIndex = 18;
            // 
            // panel4
            // 
            this.panel4.BackgroundImage = global::quanlydiem2.Properties.Resources.tải_xuống;
            this.panel4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel4.Location = new System.Drawing.Point(0, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(82, 118);
            this.panel4.TabIndex = 3;
            // 
            // panel5
            // 
            this.panel5.BackColor = System.Drawing.SystemColors.Highlight;
            this.panel5.Controls.Add(this.label4);
            this.panel5.Controls.Add(this.label5);
            this.panel5.Controls.Add(this.btnExit);
            this.panel5.Controls.Add(this.btnLogin);
            this.panel5.Location = new System.Drawing.Point(99, 21);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(796, 76);
            this.panel5.TabIndex = 2;
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
            // fHeThong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(914, 496);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "fHeThong";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Hệ Thống";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lbNameLogin;
        private System.Windows.Forms.TextBox txtUser;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txtPass;
        private System.Windows.Forms.Label lbPassLogin;
        private System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;

    }
}

