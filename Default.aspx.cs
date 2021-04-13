using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strPic = "";
        if(filePhoto.HasFile)
        {
            string strcmd= "";
            //to check product name is exist or not
            strcmd = "select ProductID from Products where ProductName='" + txtProductName.Text + "'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                lblMsg.Text = "Product name is already exist !!!";
                return;
            }
            string strFile = filePhoto.PostedFile.FileName;
            string strMIME = Path.GetExtension(strFile);
            if (strMIME.ToLower() == ".jpeg" || strMIME.ToLower() == ".jpg" || 
                strMIME.ToLower() == ".bmp" || strMIME.ToLower() == ".png")
            {
                long lngSize = filePhoto.PostedFile.ContentLength;
                if (lngSize <= 5242880)//5MB
                {
                    string strFilePath = Server.MapPath("~//Files//");
                    string strFolderName = Guid.NewGuid().ToString();
                    if (!Directory.Exists(strFilePath + strFolderName))
                    {
                        Directory.CreateDirectory(strFilePath + strFolderName);
                    }
                    string strVFilePath = "~//Files//" + strFolderName + "//";
                    string strFileNameOnly = Path.GetFileName(filePhoto.FileName);
                    strPic = strVFilePath + strFileNameOnly;//for to save in a table
                    strFilePath = Server.MapPath("~//Files//" + strFolderName + "//");
                    filePhoto.SaveAs(strFilePath + filePhoto.FileName);//save file to folder
                    //save to the table
                    strcmd = "insert into Products(ProductName,Price,Pic) values(";
                    strcmd += "'" + txtProductName.Text + "',";
                    strcmd += txtPrice.Text + ",";
                    strcmd += "'" + strPic + "')";
                    SqlHelper.ExecuteNonQuery(strcmd);
                    txtProductName.Text = "";
                    txtPrice.Text = "";
                    lblMsg.Text = "Product saved successfully";
                }
                else
                {
                    lblMsg.Text = "Max Picture Size is 5 MB !!!";
                }
            }
            else
            {
                lblMsg.Text = "Select Only Picture File !!!";
            }
         }
        else
        {
            lblMsg.Text = "Select Any Picture";
        }
    }
}