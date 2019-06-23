using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace USAMarketingWebForms
{
    public partial class ItemEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
           {
               if(Request.QueryString["mode"] == "add")
            {
                dvItemDetails.DefaultMode = DetailsViewMode.Insert;
            }
            else if (Request.QueryString["mode"] == "edit")
            {
                dvItemDetails.DefaultMode = DetailsViewMode.Edit;
            }
            else if (Request.QueryString["mode"] == "read")
            {
                dvItemDetails.DefaultMode = DetailsViewMode.ReadOnly;
            }
          }
        }

        protected void dvItemDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("ItemList.aspx");
        }

        protected void dvItemDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            Response.Redirect("ItemList.aspx");
        }
    }
}