using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dtm.Framework.ClientSites.Web;

namespace IDVFTFBS.Navigation
{
    public class NavigationList
    {
        public List<NavigationItem> Entries;

        public NavigationList()
        {
            Entries = new List<NavigationItem>();
        }

        public void AddItem(NavigationItem item)
        {
            Entries.Add(SetPage(item));
        }

        public bool HasItem(NavigationItem item)
        {
            return !string.IsNullOrEmpty(item.Id) && !string.IsNullOrWhiteSpace(item.Id);
        }

        public NavigationItem GetItemById(string id)
        {
            var entry = Entries.Where(i => string.Equals(i.Id, id, StringComparison.InvariantCultureIgnoreCase));

            return entry.Any() ? entry.FirstOrDefault() : new NavigationItem();
        }

        public List<NavigationItem> GetItemsByIdRange(List<string> idRange)
        {
            var entries = new List<NavigationItem>();

            foreach (var id in idRange)
            {
                entries.Add(GetItemById(id));
            }

            return entries.Where(entry => HasItem(entry)).ToList();
        }

        public bool IsOnSamePage(string page)
        {
            return string.Equals(page, DtmContext.Page.PageAlias, StringComparison.InvariantCultureIgnoreCase) || string.Equals(page, DtmContext.Page.PageCode, StringComparison.InvariantCultureIgnoreCase);
        }

        public NavigationItem SetPage(NavigationItem item)
        {
            if (item.IsExternal)
            {
                return item;
            }

            if (string.IsNullOrEmpty(item.Page) && !string.IsNullOrEmpty(item.Hash))
            {
                item.Page = item.Hash;

                return item;
            }

            item.Page = !string.IsNullOrEmpty(item.Route)
                ? string.Format("/{0}", item.Route)
                : IsOnSamePage(item.Page)
                    ? item.Hash
                    : FormatPageByOfferVersion(item);

            return item;
        }

        public string ModifyAttributeList(NavigationItem item)
        {
            string attributeList = string.Format(@"href=""{0}""", item.Page);

            if (item.IsExternal)
            {
                attributeList = string.Format(@"{0} target=""_blank""", attributeList);
            }

            return attributeList;
        }

        private string FormatPageByOfferVersion(NavigationItem item)
        {
            return string.Format("/{0}/{1}/{2}{3}{4}",
                DtmContext.OfferCode,
                DtmContext.Version,
                item.Page,
                DtmContext.ApplicationExtension,
                item.ApplyHash ? item.Hash : string.Empty);
        }
    }
}