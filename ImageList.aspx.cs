using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ImageList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            LoadProducts();
        }
    }
    private void LoadProducts()
    {
        DataTable dt = new DataTable();
        string strcmd = "select ProductID,ProductName,Price,Pic from Products order by ProductName";
        dt = SqlHelper.FillData(strcmd);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
}