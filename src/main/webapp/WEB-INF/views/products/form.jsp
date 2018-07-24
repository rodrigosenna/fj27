
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE	html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de livros</title>
</head>
<body>
	<c:url value="/products" var="url" />

	<form:form action="${url}" method="post" commandName="product"
	 enctype="multipart/form-data">
	
		<div>
			<label for="title">T�tulo</label> 
			
			<form:input type="text" path="title" name="title" id="title" />
			<form:errors path="title"/>
		</div>
		<div>
			<label for="description">Descri��o</label>
			<textarea rows="10" cols="20" name="description" id="description"></textarea>
		</div>
		<div>
			<label for="Autor">Autor</label> <input type="text" name="Author"
				id="Author" />
		</div>
		<div>
			<label for="numberOfPages">N�mero de p�ginas</label> <input
				type="text" name="numberOfPages" id="numberOfPages" />
		</div>
		<div>
			<label for="releaseDate">Data de lan�amento</label>
			<form:input path="releaseDate" type="date" id="releaseDate" />
			<form:errors path="releaseDate" />
		</div>
		<div>
			<label for="summary">Sumario do livro</label> <input type="file"
				name="summary" id="summary" />
			<form:errors path="summaryPath" />
		</div>
		<div>
			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div>
					<label for="price_${bookType}">${bookType}</label> <input
						type="text" name="prices[${status.index}].value"
						id="price_${bookType}" /> <input type="hidden"
						name="prices[${status.index}].bookType" value="${bookType}" />
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form:form>
</body>
</html>