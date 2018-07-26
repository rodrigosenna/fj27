<%@	page language="java" contentType="text/html;	charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="cdc"%>

<cdc:page title="Listagem	de	Produtos">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<div>Olá ${user.name}</div>
	</sec:authorize>
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
</cdc:page>	
