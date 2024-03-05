using IDVFTFBS.Utils;

namespace IDVFTFBS.CategoryRouter
{
    public class CategoryImages : ImageEngine
    {
        public CategoryImages(string categoryCode, string imagePath = null) : base(categoryCode, imagePath ?? "images/categories/" + categoryCode)
        {

        }
    }
}