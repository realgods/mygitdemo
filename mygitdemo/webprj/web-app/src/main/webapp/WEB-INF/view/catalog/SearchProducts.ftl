<div id="BackLink">
    <a href="${base}/catalog/">Return to Main Menu</a>
</div>

<div id="Catalog">

<table>
	<tr>
		<th>&nbsp;</th>
		<th>Product ID</th>
		<th>Name</th>
	</tr>
    <#list productList as product>
    <tr>
        <td>
            <a href="${base}/catalog/viewProduct?productId=${product.productId}">${product.description}</a>
        </td>
        <td>
            <b><a href="${base}/catalog/viewProduct?productId=${product.productId}"><font color="BLACK"> ${product.productId} </font></a></b>
        </td>
        <td>${product.name}</td>
    </tr>
    </#list>
	<tr>
		<td></td>
	</tr>

</table>

</div>




