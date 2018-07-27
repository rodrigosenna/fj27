<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cdc" tagdir="/WEB-INF/tags"%>

<cdc:page title="Listagem de Produtos">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<div>Olá ${user.name}</div>
	</sec:authorize>



	<body>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user" />
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<%-- 	${spring:mvcUrl('PC#form').build()} --%>
				<c:url value="/products/form" var="formLink" />
				<a href="${formLink}" method=post>Cadastrar Produto</a>
			</sec:authorize>

			<c:url var="urlToLogout" value="/logout" />
			<a href="${urlToLogout}">Sair</a>

		</sec:authorize>

		<h1>Listagem de Livros</h1>

		${success}
		<table>
			<th>Titulo</th>
			<th>Autor</th>
			<th>Num Paginas</th>
			<th>Tipos</th>

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
