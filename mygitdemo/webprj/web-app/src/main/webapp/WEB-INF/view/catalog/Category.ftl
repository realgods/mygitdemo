<div id="BackLink">
    <a href="${base}/catalog/">Return to Main Menu</a>
</div>

<div id="Catalog">

    <h2>${category.name}</h2>
    <table>
    <tr>
        <th>Product ID</th>
        <th>Name</th>
    </tr>
    <#list productList as product>
    <tr>
        <td>
        <a href="${base}/catalog/viewProduct?productId=${product.productId}">${product.productId}</a>
        </td>
        <td>${product.name}</td>
    </tr>
    </#list>
    </table>

</div>


