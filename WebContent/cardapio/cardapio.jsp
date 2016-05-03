<%@page import="java.util.Collection, com.br.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- para funções -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cardapios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../plugins/Projeto.js"></script>
</head>
<body>
	<formid= "form"> <header><!-- CabeÃ§a da pagina -->
	<ul class="tabs">
		<li><a href="#Create">Cardapio</a></li>
		<li><a href="#Read">Cadastrar Cardapio</a></li>
		<a href='${pageContext.request.contextPath}/logout'>sair</a>
	</ul>
	
	</header> <section> <article class="tab_container"> <article
		class="cont_tab" id="Create">
	<fieldset>
		<legend>Cardapio</legend>
		<form method="get" action="listarCardapio">
			<article class="tab_container" id="pesquisa"><!-- Centro da pagina -->
			<article>
			<td align="right"><label for="txtNumero"><em>Filtrar
						por:</em></label></td>
			</article>
			<tbody>
				<tr>
					<td><label for="txtNome"><em>nome:</em></label></td>
					<td align="left"><input id="nomeFiltro" type="text"
						name="nomeFiltro" autofocus="" value="${param.nomeFiltro}" /></td>
					<td><label for="categoria"><em>Categoria:</em></label></td>
					<td align="left"><SELECT id="OpCategoria" class="categoria"
						name="categoriaFiltro" size=1>
							<OPTION>
								<c:forEach var="categoria" items="${categorias}">
									<OPTION>${categoria.nome}
								</c:forEach>
					</SELECT></td>
					<td align="left"><input id="btnPesquisar" type="submit"
						value="Pesquisar" /></td>
				</tr>
			</tbody>
			</article>
		</form>
		<article class="tabContainer" id="lista">
		<table border="0px">
			<thead>
				<tr>
					<th class="tabela-coluna"><span>Codigo</span></th>
					<th class="tabela-coluna"><span>Descricao</span></th>
					<th class="tabela-coluna"><span>Preco</span></th>
					<th class="tabela-coluna"><span>Categoria</span></th>
					<th class="tabela-coluna"><span>Acoes</span></th>
				</tr>
			</thead>
		</table>
		<article class="scrollContainer">
		<table border="0">
			<tbody>

				<c:forEach var="cardapio" items="${cardapiosFiltrados}">
					<tr>
						<td class="tabela-coluna"><span>${cardapio.id}</span></td>
						<td class="tabela-coluna"><span>${cardapio.nome}</span></td>
						<td class="tabela-coluna"><span><fmt:formatNumber
									type="currency" value="${cardapio.preco}" /></span></td>
						<td class="tabela-coluna"><span>${cardapio.categoria.nome}</span></td>
						<td class="tabela-coluna"><span> <a
								href='removerCardapio?id=${cardapio.id}'>[excluir]</a> <a
								href='editarCardapio?id=${cardapio.id}'>[Editar]</a>
						</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</article> </article>
	</article>
	</fieldset>
	</article> </section> <section> <article class="cont_tab" id="Read">
	<fieldset>
		<legend>Cadastrar Cardapio</legend>
		<article class="tab_container" id="criar">
		<form method='post' action="CadastroCardapio">
			<tbody>
				<tr>
					<td align="right"><label id="labelCateg"><em>Categoria:</em></label>
					</td>
					<td align="left"><SELECT id="Opcateg" class="categoria"
						name="categoria" size=1>
							<OPTION>
								<c:forEach var="categoria" items="${categorias}">
									<OPTION>${categoria.id}- ${categoria.nome}
								</c:forEach>
					</SELECT></td>
					<td align="right"><label id="labelNome"><em>Nome:</em></label>
					</td>
					<td align="left"><input id="txtNome" type="text" name="nome"
						required="" /></td>
					<td align="right"><label id="labelpreco"><em>Preco:</em></label>
					</td>
					<td align="left"><input id="txtpreco" type="tel"
						required="required" maxlength="15" name="preco"
						title="Digite o Preco no formato minimo 0,00   maximo 000.000,00"
						pattern="([0-9]{1,3}\.)?[0-9]{1,3}$" /></td>

					<td align="right"><label id="labelSituacao"><em>Situacao:</em></label>
					</td>
					<td align="left"><SELECT id="Opsituacao" class="categoria"
						name="situacao" size=1>
							<OPTION>
							<OPTION>ATIVO
							<OPTION>INATIVO
					</SELECT></td>
					<td align="right"><input id="btnAdicionar" type="submit"
						value="Adicionar" /></td>
				</tr>
			</tbody>
		</form>
		</article>
	</fieldset>
	</article> </section> <section>
	<div id="openModal" class="modalDialog">
		<div>
			<a href="#close" title="Close" class="close">X</a>
			<h2>Editar Dados</h2>
			<form method="post" action="editarCardapio">
				<tr>
					<td align="right"><label id="labelCateg"><em>Categoria:</em></label>
					</td>
					<td align="left"><SELECT id="Opcateg" class="categoria"
						name="Editecategoria" size=1>
							<OPTION>
								<c:forEach var="categoria" items="${categorias}">
									<OPTION>${categoria.id}- ${categoria.nome}
								</c:forEach>
					</SELECT></td>
					<td align="right"><input id="txtid" type="hidden"
						name="Editeid" required="" value="${cardapio.id}" /></td>
					<td align="right"><label id="labelNome"><em>Nome:</em></label>
					</td>
					<td align="left"><input id="txtNome" type="text"
						name="Editenome" required="" value="${cardapio.nome}" /></td>
					<td align="right"><label id="labelpreco"><em>Preco:</em></label>
					</td>
					<td align="left"><input id="txtpreco" type="tel"
						required="required" maxlength="15" name="Editepreco"
						title="Digite o Preco no formato minimo 0.0   maximo 000.000"
						pattern="([0-9]{1,3}\.)?[0-9]{1,3}$" value="${cardapio.preco}" />
					</td>
					<td align="right"><label id="labelSituacao"><em>Situacao:</em></label>
					</td>
					<td align="left"><SELECT id="Opsituacao" class="categoria"
						name="Editesituacao" size=1>
							<OPTION>
							<OPTION>ATIVO
							<OPTION>INATIVO
					</SELECT></td>
					<td align="right"><input id="btnAdicionar" type="submit"
						value="Adicionar" /></td>
				</tr>
			</form>
		</div>
	</div>
	</section> <footer><!-- cabeÃ§alho da pagina --> </footer>
	</form>
</body>
</html>