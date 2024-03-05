using IDVFTFBS.Utils;

namespace IDVFTFBS.CampaignProduct
{
    public class ProductImages : ImageEngine
    {
        public ProductImages(string productCode, string imagePath = null) : base(productCode, imagePath ?? "images/products/" + productCode)
        {

        }
    }
}