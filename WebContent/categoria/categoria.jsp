<%@page import="java.nio.charset.CodingErrorAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %> <!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- para funções -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Categoria</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
		<formid = "form">
			<header><!-- Cabeça da pagina -->
				<ul class="tabs">
				<li><a href="#Create">Categorias</a></li>
				<li><a href="#Read">Cadastrar Categorias</a></li>
				<a href='${pageContext.request.contextPath}/logout'>sair</a>
				</ul>
			</header>
			
			<section>
				<article class="tab_container">
					<article class="cont_tab" id="Create">
						<fieldset ><legend>Categorias</legend>
							<article class="tab_container" id="pesquisa"><!-- Centro da pagina -->
								<form method="get" action="listarCategoria">
								<tbody >
									<tr> 
										<td align="right">
											<label for="filtro"><em>Filtrar por nome:</em></label>
										</td>
										<td align="left">
											<input id="filtro" type="text" name="categoriaFiltro" autofocus="" 
											value="${param.categoriaFiltro}"/>
										</td>
										<td align="left">
											<input id="btnPesquisar" type="submit" value="Pesquisar" />
										</td>
									</tr>
								</tbody>
								</form>
							</article>
							<article class="tabContainer" id="lista">
								<table border="0px">
									<thead>
										<tr>
											<th class="tabela-coluna"><span>Codigo</span></th>
											<th class="tabela-coluna"><span>Descricao</span></th>
											<th class="tabela-coluna"><span>Status</span></th>
											<th class="tabela-coluna"><span>Acoes</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
										
										<c:forEach var="categoria" items="${categoriasFiltradas}" >
											<tr>
												<td class="tabela-coluna"><span>${categoria.id}</span></td>
												<td class="tabela-coluna"><span>${categoria.nome}</span></td>
												<td class="tabela-coluna"><span>${categoria.status}</span></td>
												<td class="tabela-coluna">
													<span>
													<a href='removerCategoria?id=${categoria.id}'>[excluir]</a>
													<a href='editarCategoria?id=${categoria.id}'>[Editar]</a>
													</span>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</article>
							</article>
						</article>
					</fieldset>
				</article>
			</section>
			
			<section>
				<article class="cont_tab" id="Read">
					<fieldset><legend>Cadastrar Categoria</legend>
						<article class="tab_container" id="criar">
							<form method='post' action="CadastraCategoria">
								<tbody>
									<tr>
										<td align="right">
											<input id="txtid" type="hidden" name="id" required="" value="" />
										</td>	
										<td align="right">
											<label id="labelNome"><em>Nome:</em></label>
										</td>
										<td align="left">
											<input id="txtNome" type="text" name="nome" required="" value="" />
										</td>
										<td align="right">
											<label id="labelStatus"><em>Status:</em></label>
										</td>
										<td align="left">
												<SELECT id="Opstatus" class = "categoria" name ="status" size=1>
													<OPTION>ATIVO
													<OPTION>INATIVO
												</SELECT>
										</td>
										<td align="right">
											<input id="btnAdicionar" type="submit" value="Adicionar" />
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