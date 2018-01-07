using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Web.UI.WebControls;
using System.IO;
using Stripe;
using Newtonsoft.Json;
using Xero.Api.Core;
using Xero.Api.Common;
using Xero.Api.Infrastructure;
using Xero.Api.Serialization;
using System.Net;
using System.Threading;

public partial class System_StripeToXero : System.Web.UI.Page
{
    public string table = string.Empty;
    public string XeroAuthData = string.Empty;
    public int reporter = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string oauth_token = string.Empty;
        string oauth_verifier = string.Empty;
        string org = string.Empty;
        //if (!Page.IsPostBack)
        //{
        //oauth_token=9CWVSOTB1B3MQBLWKT4L1IYT61LGKL&oauth_verifier=3159045&org=irE7GOpS2aYbxZXgLjURbm
        try
        {
            oauth_token = Request.QueryString["oauth_token"].ToString();
            oauth_verifier = Request.QueryString["oauth_verifier"].ToString();
            org = Request.QueryString["org"].ToString();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }

        XeroAuthData = "oauth_token=" + oauth_token + "&oauth_verifier=" + oauth_verifier + "&org=" + org;
    }
    protected void AnalyseData_Click(object sender, EventArgs e)
    {
        string source1 = string.Empty;
        source1 = FileSource1.Value.ToString();
        table = "<div class=\"table-responsive pre-scrollable\"><h3>Matching Shopify to Stripe result</h3><div class=\"row clear_1m\"></div><table class=\"table\"><thead><th>#</th><th>Product/Item</th><th>Email</th><th>Payment Method</th><th> Currency </th><th>Amount</th><th>Order ID(Stripe)</th><th>Tool</th></tr></thead><tbody>";
        List<string> listA = new List<string>();

        try
        {
           
            int ctr = 0;
            using (var reader = new StreamReader(source1))
            {

                // List<string> listB = new List<string>();
                while (!reader.EndOfStream)
                {
                    var line = reader.ReadLine();
                    var values = line.Split(',');

                    listA.Add(values[16]);// Item   
                    listA.Add(values[1]);// email
                    listA.Add(values[47]);// Method
                    listA.Add(values[6]);// Currency
                    listA.Add(values[2]);// Amount
                    listA.Add(values[48]);// Order ID
                                          
                    if (ctr == 0) { }
                    else
                    {
                        table += " <tr><td>" + ctr + "</td><td>" + values[16].ToString() + "</td><td>" + values[1].ToString() + "</td><td>" + values[47].ToString() + "</td><td>" + values[6].ToString() + "</td><td>" + values[2].ToString() + "</td><td>" + values[48].ToString() + "</td><td><a href=\"#\">[Import to Xero]</a>&nbsp;&nbsp;<a href=\"#\">[View Details</a>]</td></tr>";
                    }
                    ctr += 1;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
        

            StripeConfiguration.SetApiKey("rk_live_TAhKeciddUKS2Jj955vshk6h");
            var chargeService = new StripeChargeService();
            StripeList<StripeCharge> chargeItems = chargeService.List(
            Thread th = new Thread(new StripeChargeListOptions())
            {
                Limit = 100
                    th.Start();
             });
        
        /*used for orders
         * 
         * StripeConfiguration.SetApiKey("rk_live_TAhKeciddUKS2Jj955vshk6h");

        var orderService = new StripeOrderService();
        StripeList<StripeOrder> orderItems = orderService.List(
          new StripeOrderListOptions()
          {
              Limit = 3
          }
        );*/

        String XeroTransactiionXML = "<BankTransactions>";
        //'Transaction Date','Description', 'Transaction Amount', 'Reference', 'Transaction Type', 'Payee'
        //*Date	*Amount	Payee	Description	Reference	Check Number

        for (int ctr = 0; ctr < 3; ctr++)
        {
            try
            {
                String[] ItemsValues = new String[5];
                ItemsValues[0] = chargeItems.Data[ctr].Source["name"].ToString();
                ItemsValues[1] = chargeItems.Data[ctr].Created.ToString();
                ItemsValues[2] = chargeItems.Data[ctr].Description.ToString();
                ItemsValues[3] = chargeItems.Data[ctr].Amount.ToString();
                ItemsValues[4] = chargeItems.Data[ctr].Id.ToString();

                XeroTransactiionXML += ConvertToXML(ItemsValues, "BankTransaction", "");

            }
            catch (Exception ex)
            {
                continue;
            }
            reporter = 1;
           
        }

        XeroTransactiionXML += "</BankTransactions>";
        String XeroResponse = postXeroXMLData("https://api.xero.com/api.xro/2.0/BankTransactions?" + XeroAuthData, XeroTransactiionXML, "LYRTRXIY5PYO5R9FZUK6T4HSXU7UVJ");

       // Response.Write(XeroResponse);

       
        table += "</tbody></table></div>";
        //var details = JObject.Parse(chargeItems);

        // for(int x=0; x <= chargeItems.Count; x++)
        //{

        // Response.Write(cha )
        //        }

        // Public Application Sample
        /*
        var user = new Xero.Api.Infrastructure.OAuth.ApiUser { Name = "Barry Jone" };
        var tokenStore = Xero.Api.Infrastructure.Interfaces.ITokenStore();

        var api = new Xero.Api.Example.Applications.Public.Core(tokenStore, user)
        {
            UserAgent = "Something to show your application"
        };
        */
        /*
        var public_app_api = new XeroCoreApi("https://api.xero.com", new Xero.Api.Example.Applications.Public.PublicAuthenticator("https://api.xero.com", "https://api.xero.com", "oob",
            new MemoryTokenStore()),
            new Xero.Api.Infrastructure.OAuth.Consumer("TTLGJ2OSYVNHKFCS2VHBUMAJYOYOJJ", "IXUX1RCEYMEMI4QXLELG0G779EWCTJ"), user,
            new DefaultMapper(), new DefaultMapper());
            

        var public_contacts = public_app_api.Contacts.Find().ToList();

    */




    }
    private String ConvertToXML(String[] args, string rootName, string elemName)
    {
        string xmlStr = "<" + rootName + ">";


        //foreach (String arg in args)
        for (int ctr = 0; ctr < args.Length; ctr++)
        {
            //'Transaction Date','Description', 'Transaction Amount', 'Reference', 'Transaction Type', 'Payee'
            //*Date	*Amount	Payee	Description	Reference	Check Number

            xmlStr += "<Type>RECEIVE</Type>";
            xmlStr += "<Contact><Name>" + args[0].ToString() + "</Name></Contact>";
            xmlStr += "<Date>" + args[1].ToString() + "</Date>";
            xmlStr += "<LineItems><LineItem>";
            xmlStr += "<Description>" + args[2].ToString() + "</Description>";
            xmlStr += "<Quantity>1</Quantity>";
            xmlStr += "<UnitAmount>" + Convert.ToDecimal(args[3].ToString()) + "</UnitAmount>";
            xmlStr += "<AccountCode>200</AccountCode>";
            xmlStr += "</LineItem></LineItems>";
            xmlStr += "<Reference>" + args[4].ToString() + "</Reference>";
            xmlStr += "<BankAccount><Code>090-8007-006543</Code></BankAccount>";

        }

        xmlStr += "</" + rootName + ">";

        return xmlStr;
    }
    public string postXeroXMLData(string destinationUrl, string requestXml, string AccToken)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(destinationUrl);

        byte[] bytes;
        bytes = System.Text.Encoding.ASCII.GetBytes(requestXml);
        request.ContentType = "text/xml; encoding='utf-8'";
        request.ContentLength = bytes.Length;
        request.Headers.Add("Authorization", "Bearer " + AccToken);
        request.Timeout = -1;
        request.Method = "PUT";
        Stream requestStream = request.GetRequestStream();
        requestStream.Write(bytes, 0, bytes.Length);

        HttpWebResponse response;
        response = (HttpWebResponse)request.GetResponse();
        if (response.StatusCode == HttpStatusCode.OK)
        {
            Stream responseStream = response.GetResponseStream();
            string responseStr = new StreamReader(responseStream).ReadToEnd();

            reporter = 1;
            return responseStr;
        }
        requestStream.Close();
        return null;
    }
}