<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %> <!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- para funções -->
<html>
	<head>
		<title>titulo da pagina</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>

	<body>
		<form method="post" action="Login" id="form">
			<header><!-- CabeÃ§a da pagina -->

			</header>
			
			<c:if test="${mensagem != null}">
			
			<div id="alert">
		    	<a class="alert" href="#alert">${mensagem}</a>	    	
			</div>	
			
		    </c:if>
			
			<section>
				<article>
					<fieldset><legend>Login</legend>
						<tr>
							<td>
								<label id="labellogin"><em>Login:</em></label>
							</td>
						</tr>
						<tr>
							<td>
								<input id="txtlogin" name="login" type="text" required=""></input>
							</td>
						</tr>
						<tr>
							<td>
								<label id="labelsenha"><em>Senha:</em></label>
							</td>
						</tr>
						<tr>
							<td>
								<input id="txtsenha" name="senha" type="password" required=""></input>
							</td>
						</tr>
						<tr>
							<td>
								<input id="logar" class="botao" type="submit" value="Logar"></input>
							</td>
						</tr>
						<tr>
							<td>
								<input id="novo" class="botao" type="button" onclick="window.location.href='../cliente/cadastro/cadastro.jsp'" value="Novo Usuario"></input>
							</td>
						</tr>
					</fieldset>
				</article>		
			</section>
			<footer><!-- cabeÃ§alho da pagina -->
				
			</footer>
		</form>
	</body>
</html>