<div id="BackLink">
    <a href="${base}/catalog/viewCategory?categoryId=${product.categoryId}">Return to ${product.categoryId}</a>
</div>

<div id="Catalog">
    <h2>${product.name}</h2>
    <table>
    <tr>
        <th>Item ID</th>
        <th>Product ID</th>
        <th>Description</th>
        <th>List Price</th>
        <th>&nbsp;</th>
    </tr>
    <#list itemList as item>
    <tr>
        <td>
            <a href="${base}/catalog/viewItem?itemId=${item.itemId}">${item.itemId}</a>
        </td>
        <td>${item.product.productId}</td>
        <td>${item.attribute1} ${item.attribute2} ${item.attribute3}
			${item.attribute4} ${item.attribute5} ${product.name}
        </td>
        <td>${item.listPrice}</td>
        <td>
            <a href="${base}/cart/addItemToCart?workingItemId=${item.itemId}" class="Button">Add to Cart</a>
        </td>
    </tr>
    </#list>
    <tr>
        <td>
        </td>
    </tr>
</table>

</div>





