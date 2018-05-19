using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Init(object sender, EventArgs e) {
        Grid.DataSource = Data.GetData();
        Grid.KeyFieldName = "ID";
        Grid.DataBind();
    }
}

public class Data {
    public int ID { get; set; }
    public string SomeData { get; set; }
    public string AnotherData { get; set; }
    public static List<Data> GetData() {
        return Enumerable.Range(0, 20).Select(i => new Data() { ID = i, SomeData = "Data " + i, AnotherData = "AnotherData" + i }).ToList<Data>();
    }
}
