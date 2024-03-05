<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<CampaignProductView>>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="System.IO" %>

<div class="row row-to-top u-pad--vert @x2-pad replacement-heads">
    <%


        var products = Model;

        foreach (var product in products.OrderBy(y => y.DisplayRank))
        {
            if (product.ProductCode == "REPLACE")
            { %>
            <div class="flex" id="dv_Replace">
                <div class="gallery">
                    <img id="gallery__main" src="/images/products/flawless-full.png" alt="Flawless&reg; Replacement Heads" class="gallery__main">
                </div>
                <div class="product product__heads product__heads--main">
                    <h2 class="product__title sans-secondary-bold uppercase">Facial Hair Remover Replacement Heads</h2>
                   <%-- <div class="col">
                        <div class="row">
                            <div class="col col__heads--main">
                                <img src="/images/products/3.0000/replacement-heads.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Replacement Heads">
                            </div>
                            <div class="col col__heads--main left-padding uppercase sans-secondary-bold">
                                <h3>2 PACK</h3>
                                <h5><span class="product__price-label">Price:</span> $12.99</h5>
                                <small>SKU Number: 20101290</small>

                                <div class="c-brand top-margin">
                                    <div class="c-brand--form product__options">
                                        QTY<br>
                                        <select id="addon_R2">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- end form -->
                                <% if (DtmContext.Version >= (decimal)19.0000)
                                    { %>
                                <a href="#order"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="R219" data-select-id="addon_R2" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a> 
                                <% } else   {%>
                                <a href="#order"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="R2" data-select-id="addon_R2" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a> 
                                <%} %>
                                <!-- <a href="#order" class="btn--product sans-primary-medium top-margin btn--sold-out">SOLD OUT</a>-->
                                <small style="text-transform: none; display: block; line-height: 16px; font-size: 75%;">Single Halo - When looking at your Facial Hair Remover unit, if you see a single halo (like in the image above) please select this head.</small>
                            </div>
                        </div>
                
                        <!-- end images and 2 pack text-->
                    </div>--%>
            

                    <%--<div class="col col__heads--main">
                        <hr class="vertical-rule">
                    </div>--%>
                   <div class="col col__heads--main">
                        <div class="row">
                            <div class="col">
                            <img src="/images/products/3.0000/replacement-heads-3_0.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Replacement Heads"></div>
                            <div class="col left-padding uppercase sans-secondary-bold">
                                <h3>2 PACK</h3>
                                <h5><span class="product__price-label">Price:</span> $12.99</h5>
                                <small>SKU Number: 20507234</small>

                                <div class="top-padding">
                                    <p style="text-transform: capitalize; font-weight: bold; color: #db8f83; font-size: .9em;">Temporarily out of stock. Estimated ship date October 2022</p>
                                </div>

                                <div class="c-brand top-margin">
                                    <div class="c-brand--form product__options">
                                        QTY<br>
                                        <select id="addon_RF30">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- end form -->
<%--                                <a href="#order" data-code="RF30" data-select-id="addon_RF30" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a>--%>
                                <a href="javascript:window._klOnsite.push(['openForm', 'Ux7ZUP']);" style="max-width: 14em;" class="btn--product sans-primary-medium top-margin btn--waitlist">JOIN THE WAITLIST</a>
                                <small style="text-transform: none; display: block; line-height: 16px; font-size: 75%;">Double Halo - When looking at your Facial Hair Remover unit, if you see a double halo (like in the image above) please select this head.</small>
                          </div>
                        </div>
                        <!-- end images and 2 pack text-->
                    </div>
            
                <p class="top-margin @x3-mar"><span class="span sans-secondary-bold">IMPORTANT &ndash; To select your replacement heads, please match exactly by sliding your cursor over each. Replacement heads are not interchangeable, you must use the same one.</span></p>
            
                    <hr>


                    <!--END DESCRIPTION HTML-->
                </div>
            </div>
            <!-- end flex -->
            <%}
                else
                {

                    var galleryImage = product.PropertyIndexer["GalleryImage", string.Empty];
                    var productImage = product.PropertyIndexer["ProductImage", string.Empty];
                    var description = product.DisplayText;
                    var soldOut = product.PropertyIndexer["SoldOut", string.Empty];
                    var soldOutText = product.PropertyIndexer["SoldOutText", "Sold Out"];
                    var addedText = product.PropertyIndexer["AddedText", string.Empty];
                    var addedText2 = product.PropertyIndexer["AddedText2", string.Empty];
                    var addedText3 = product.PropertyIndexer["AddedText3", string.Empty];
                    var removeForm = product.PropertyIndexer["RemoveForm", string.Empty];
                    if (removeForm.ToLower() == "true")
                        {%>
                            <div class="flex" id="<%= product.ProductCode %>">
                            <div class="gallery">
                                <img id="gallery__main" src="<%=galleryImage %>" alt="<%=product.ProductName %>" class="gallery__main">
                            </div>
                            <div class="product  product__heads product__heads--legs">
                                <h2 class="product__title sans-secondary-bold uppercase"><%=product.ProductName %></h2>
                                <p class="bottom-margin @x3-mar"><%=description %></p>
                                <div class="col col__heads--legs">
                                    <div class="row-to-center">
                                        <div class="col">
                                            <img src="<%=productImage %>?appV=<%= DtmContext.ApplicationVersion %>" alt="<%=product.ProductName %>">
                                        </div>
                                        <div class="col left-padding uppercase sans-secondary-bold">
                                            <h3><%=product.ShortName %> <span class="color-tertiary"><%= addedText3 %></span></h3>
                                            <p style="text-transform: none;"><%= addedText %></p>
                                        </div>
                                    </div>
                                    <!-- end images and 2 pack text-->
                                    <p class="top-margin @x2-mar"><%= addedText2 %></p>
                                </div>
                                <hr>
                                <!--DESCRIPTION HTML -->



                                <!--END DESCRIPTION HTML-->
                            </div>
                        </div>
                        <%}
                    else { 
                        %>
                        <div class="flex" id="<%= product.ProductCode %>">
                            <div class="gallery">
                                <img id="gallery__main" src="<%=galleryImage %>" alt="<%=product.ProductName %>" class="gallery__main">
                            </div>
                            <div class="product  product__heads product__heads--legs">
                                <h2 class="product__title sans-secondary-bold uppercase"><%=product.ProductName %></h2>
                                <p class="bottom-margin @x3-mar"><%=description %></p>
                                <div class="col col__heads--legs">
                                    <div class="row">
                                        <div class="col">
                                            <img src="<%=productImage %>?appV=<%= DtmContext.ApplicationVersion %>" alt="<%=product.ProductName %>">
                                        </div>
                                        <div class="col left-padding uppercase sans-secondary-bold">
                                            <h3><%=product.ShortName %> <!--<span class="color-tertiary">BEST VALUE!</span>--></h3>
								            <h5><span class="product__price-label">Price:</span> <%=string.Format("{0:C}",product.Price) %></h5>
                                            <% if (soldOut.ToLower() == "true" && product.ProductCode == "PREP") { %>
                                            <div class="top-padding">
                                                <p style="text-transform: capitalize; font-weight: bold; color: #db8f83;">Temporarily Out Of Stock. <br>Estimated Back in Stock Date 4/20/22</p>
                                            </div>
                                            <% } %>
                                            <div class="c-brand u-pad--vert @x2-pad top-margin">
                                                <div class="c-brand--form product__options">
                                                    QTY<br>
                                                    <select id="addon_LEGREP">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- end form -->
                                            <%if (soldOut.ToLower() == "true")
                                                { %>
                                                <p style="text-transform: capitalize; font-weight: bold; color: #db8f83; font-size: 1em;">Temporarily out of stock.</p>
                                             <%-- <a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin"><%=soldOutText %></a> --%>
                                            <%}
                                            else
                                            { %>
                                            <a href="#order"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="<%=product.ProductCode %>" data-select-id="addon_<%=product.ProductCode %>" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a>
                                            <%} %>
                                            <p style="text-transform: none;"><%= addedText %></p>
                                        </div>
                                    </div>
                                    <!-- end images and 2 pack text-->
                                    <p class="top-margin @x2-mar"><%= addedText2 %></p>
                                </div>
                                <hr>
                                <!--DESCRIPTION HTML -->



                                <!--END DESCRIPTION HTML-->
                            </div>
                        </div>
    <!-- end flex -->
                        <%}
                }
        }



%>



</div>
