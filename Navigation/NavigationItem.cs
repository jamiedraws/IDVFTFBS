﻿namespace IDVFTFBS.Navigation
{
    public class NavigationItem
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Page { get; set; }
        public string Label { get; set; }
        public string Hash { get; set; }
        public string Route { get; set; }
        public bool IsExternal { get; set; }
        public bool IsDropDown { get; set; }
        public bool ApplyHash { get; set; }
        public bool IsRoute { get; set; }

        public NavigationItem()
        {
            Id = string.Empty;
            Name = string.Empty;
            Page = string.Empty;
            Label = string.Empty;
            Hash = string.Empty;
            Route = string.Empty;
            IsExternal = false;
            IsDropDown = false;
            ApplyHash = false;
            IsRoute = false;
        }
    }
}