using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.OleDb;
using System.Data.Common;
using System.Xml;
using System.Text.RegularExpressions;
using System.Text;
using System.Globalization;
using System.Web.SessionState;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.ComponentModel;
using Xero.Api.Core;
using Xero.Api.Infrastructure.Interfaces;
using Xero.Api.Example.Applications.Public;
using Xero.Api.Infrastructure.OAuth;
using System.Collections.Concurrent;

public partial class System_XeroOuth_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        XeroCoreApi myxeroapi = default(XeroCoreApi);
        if (IsPostBack == false)
        {
            if (Page.Request.QueryString["oauth_verifier"] == null)
            {
                myxeroapi = XeroAuthenticate(this, false, "");
            }
            else
            {
                myxeroapi = XeroAuthenticate(this, true, "");
                if ((myxeroapi != null))
                {
                    Response.Write(myxeroapi.Organisation.Name);
                    string auth_token = string.Empty;
                    //string query_active_terminals = "";

                    try
                    {
                        auth_token = Request.QueryString["oauth_token"].ToString();

                        if (auth_token == string.Empty)
                        {

                           
                        }
                        else
                        {
                           //query_active_terminals = "SELECT * FROM [dbo].devices WHERE IS_ACTIVE = 1 AND domain='" + domain_location + "'";
                        }
                    }
                    catch (Exception ex)
                    {
                       // query_active_terminals = "SELECT * FROM [dbo].devices WHERE IS_ACTIVE = 1";
                    }


                }//end (myxeroapi != null)
            }
        }
    }
    protected XeroCoreApi XeroAuthenticate(Page inpage, bool authpagereturnedauthentication, string incode)
    {
       
        Consumer myxeroconsumer = new Consumer("TTLGJ2OSYVNHKFCS2VHBUMAJYOYOJJ", "IXUX1RCEYMEMI4QXLELG0G779EWCTJ");
        dynamic myxerouser = new ApiUser { Name = "Barry Jone" };

      

        if ((System.Configuration.ConfigurationManager.AppSettings.Get("XeroApiConsumerKey") != null))
        {
            if ((System.Configuration.ConfigurationManager.AppSettings.Get("XeroApiConsumerSecret") != null))
            {
                if (!string.IsNullOrEmpty(System.Configuration.ConfigurationManager.AppSettings.Get("XeroApiConsumerKey").ToString()))
                {
                    myxeroconsumer = new Consumer(System.Configuration.ConfigurationManager.AppSettings.Get("XeroApiConsumerKey").ToString(), System.Configuration.ConfigurationManager.AppSettings.Get("XeroApiConsumerSecret").ToString());
                }
            }
        }

       
        dynamic myxerocallbackurl = "http://medialeven.com/System/StripeToXero.aspx";
        dynamic myxeromemorystore = new MemoryAccessTokenStore();
        dynamic myxerorequestTokenStore = new MemoryRequestTokenStore();
        dynamic myxerobaseapiurl = "https://api.xero.com";

        
        PublicMvcAuthenticator myxeroauthenticator = new PublicMvcAuthenticator(myxerobaseapiurl, myxerobaseapiurl, myxerocallbackurl, myxeromemorystore, myxeroconsumer, myxerorequestTokenStore);

        if (authpagereturnedauthentication == false)
        {
           
            string requri = myxeroauthenticator.GetRequestTokenAuthorizeUrl(myxerouser.Name);
            if (!string.IsNullOrEmpty(requri))
                Response.Redirect(requri, true);
            return null;
        }
        else
        {
           
            IToken myxerotoken = myxeroauthenticator.RetrieveAndStoreAccessToken(myxerouser.Name, Request.QueryString["oauth_token"].ToString(), Request.QueryString["oauth_verifier"].ToString(), Request.QueryString["org"].ToString());
            if ((myxerotoken != null))
            {
                XeroCoreApi myxeroapi = new XeroCoreApi("https://api.xero.com", myxeroauthenticator, myxeroconsumer, myxerouser);
                return myxeroapi;
            }
            else
            {
                return null;
            }
        }
    }
    public class MemoryAccessTokenStore : ITokenStore
    {
        private static readonly IDictionary<string, IToken> _tokens = new ConcurrentDictionary<string, IToken>();

        public IToken Find(string userId)
        {
            if (string.IsNullOrWhiteSpace(userId))
                return null;

            IToken token;

            _tokens.TryGetValue(userId, out token);
            return token;
        }

        public void Add(IToken token)
        {
            _tokens[token.UserId] = token;
        }

        public void Delete(IToken token)
        {
            if (_tokens.ContainsKey(token.UserId))
            {
                _tokens.Remove(token.UserId);
            }
        }
    }
    public class MemoryRequestTokenStore : ITokenStore
    {
        private static readonly IDictionary<string, IToken> _tokens = new ConcurrentDictionary<string, IToken>();

        public IToken Find(string userId)
        {
            if (string.IsNullOrWhiteSpace(userId))
                return null;

            IToken token;

            _tokens.TryGetValue(userId, out token);
            return token;
        }

        public void Add(IToken token)
        {
            _tokens[token.UserId] = token;
        }

        public void Delete(IToken token)
        {
            if (_tokens.ContainsKey(token.UserId))
            {
                _tokens.Remove(token.UserId);
            }
        }
    }

}