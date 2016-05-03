<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %> <!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  <!-- para funções -->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Editar Cardapio</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
		<formid = "form">
			<header><!-- CabeÃ§a da pagina -->
				<ul class="tabs">
				<li><a href="#Create">Editar Cardapio</a></li>
				</ul>
			</header>
			
			
			<section>
				<article class="cont_tab" id="Create">
					<fieldset><legend>Editar Cardapio</legend>
						<article class="tab_container" id="criar">
							<form method="post" action="editarCardapio">
								<tbody>
									<tr>
										<td align="left">
											<input id="txtid" name="id" type="hidden" required="" value="${cardapio.id}" />
										</td>
										<td align="right">
											<label id="labelCateg"><em>Categoria:</em></label>
										</td>
										<td align="left">
												<SELECT id="Opcateg" class = "categoria" name = "Editecategoria" size=1>
													<OPTION>selecione</OPTION>
													<c:forEach var="categ" items="${categorias}">
														<OPTION value="${categ.id}" ${cardapio.categoria.id == categ.id ? 'selected=selected' : ''} > ${categ.nome}</OPTION>
													</c:forEach>
												</SELECT>
										</td>
										<td align="right">
											<label for="txtNome" id="labelNome"><em>Nome:</em></label>
										</td>
										<td align="left">
											<input id="txtNome" name="Editenome" type="text" required="" value="${cardapio.nome}" />
										</td>
										<td align="right">
											<label for="txtpreco" id="labelpreco"><em>Preco:</em></label>
										</td>
										<td align="left">
											<input id="txtpreco" name="Editepreco" type="tel" required="required" maxlength="15" title = "Digite o Preco no formato minimo 0.00   maximo 000.000" pattern="([0-9]{1,3}\.)?[0-9]{1,3}" value="${cardapio.preco}" />
										</td>
										
										<td align="right">
											<label for="Opsituacao" id="labelSituacao"><em>Situacao:</em></label>
										</td>
										<td align="left">
												<SELECT id="Opsituacao" class="categoria" name="Situacao" size=1>
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
			
			<footer><!-- cabeÃ§alho da pagina -->
				
			</footer>
		</form> 
	</body>
</html>