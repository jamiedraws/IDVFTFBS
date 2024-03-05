using Dtm.Framework.Base.Controllers;
using Dtm.Framework.Base.Models;
using Dtm.Framework.ClientSites.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Caching;
using System.Web.Mvc;
using System.Linq;

namespace IDVFTFBS.Controllers
{
    public class CategoryController : DtmContextController
    {
        [HttpPost]
        public ActionResult RenderCategory()
        {
            SetOfferVersion();
            return PartialView("GetDynamicCategory");
        }

        private void SetOfferVersion ()
        {
            Guid covid = Guid.TryParse(Request["covid"], out covid) ? covid : Guid.Empty;
            if ( covid != Guid.Empty && DtmContext.CampaignOfferVersions.Any(cov => cov.OfferVersionId == covid))
            {
                var offerVersion = DtmContext.CampaignOfferVersions.First(cov => cov.OfferVersionId == covid);
                DtmContext.OfferCode = offerVersion.OfferCode;
                DtmContext.Version = offerVersion.VersionNumber;
            }
        }
    }
}