using Dtm.Framework.Base.Controllers;
using Dtm.Framework.ClientSites.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Caching;
using System.Web.Mvc;

namespace IDVFTFBS.Controllers
{
    public class PageController : DtmContextController
    {
        [HttpPost]
        public ActionResult RenderPage()
        {
            return View("GetDynamicPage");
        }
    }
}