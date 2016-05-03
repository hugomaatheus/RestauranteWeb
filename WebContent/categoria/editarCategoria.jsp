<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %> <!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- para funções -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
<header><!-- Cabeça da pagina -->
				<ul class="tabs">
				<li><a href="#Create">Editar Categorias</a></li>
				</ul>
			</header>
			
			<section>
				<article class="cont_tab" id="Create">
					<fieldset><legend>Editar Categoria</legend>
						<article class="tab_container" id="criar">
							<form method="post" action="editarCategoria">
								<tbody>
									<tr>
										<td align="left">
											<input id="txtId" type="hidden" name="id" required="" value="${categoria.id}" />
										</td>
										<td align="right">
											<label for="txtNome" id="labelNome"><em>Nome:</em></label>
										</td>
										<td align="left">
											<input id="txtNome" type="text" name="nome" required="" value="${categoria.nome}" />
										</td>
										<td align="right">
											<label for="Opstatus" id="labelStatus"><em>Status:</em></label>
										</td>
										<td align="left">
												<SELECT id="Opstatus" class = "categoria" name = "status" size=1>
													<OPTION>
													<OPTION>ATIVO
													<OPTION>INATIVO
												</SELECT>
										</td>
										<td align="right">
											<input id="btnAdicionar" type="submit" value="Editar" />
										</td>
									</tr>
								</tbody>
							</form>
						</article>
					</fieldset>
				</article>
			</section>
						
			<footer><!-- cabeçalho da pagina -->
				
			</footer>
		</form> 
	</body>
</html>