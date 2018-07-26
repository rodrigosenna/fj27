<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE	html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de Produtos</title>
</head>
<body>

	<table>
		<tr>
			<th>Título</th>
			<th>Valores</th>
			<th>Detalhes</th>
		</tr>

		<c:forEach items="${products}" var="product">
			<tr>
				<td>${product.title}</td>
				<td><c:forEach items="${product.prices}" var="price">
						[${price.value}	-	${price.bookType}]
					 </c:forEach></td>
				<td><c:url value="/products/${product.id}" var="linkDetalhar" />
					<a href="${linkDetalhar}"> Detalhar </a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>