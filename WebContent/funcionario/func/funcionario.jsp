<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- para estruturas de controle e repetição e setar variáveis -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- para formatações -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- para funções -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>titulo da pagina</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="../plugins/jquery-1.12.2.min.js"></script>
		<script type="text/javascript" src="../plugins/Projeto.js"></script>
	</head>
	<body>
		<formid = "form">
			<header><!-- CabeÃ§a da pagina -->
				<ul class="tabs">
				<li><a href="#Create">Funcionario</a></li>
				<li><a href="#Read">Cadastrar Funcionario</a></li>
				<input id="btnSair" type="submit" value="Sair" />
				</ul>
			</header>
			
			<section>
				<article class="tab_container">
					<article class="cont_tab" id="Create">
						<fieldset ><legend>Funcionario</legend>
							<article class="tab_container" id="pesquisa"><!-- Centro da pagina -->

								<tbody>
									<tr> 
										<td>
											<label for="txtNome"><em>nome:</em></label>
										</td>
										<td align="left">
											<input id="filtro" type="text" autofocus="" required="" />
										</td>
										<td align="left">
											<input id="btnPesquisar" type="submit" value="Pesquisar" />
										</td>
									</tr>
								</tbody>
							</article>
							<article class="tabContainer" id="lista">
								<table border="0px">
									<thead>
										<tr>
											<th class="tabela-coluna"><span>Nome</span></th>
											<th class="tabela-coluna"><span>CPF</span></th>
											<th class="tabela-coluna"><span>Cargo</span></th>
											<th class="tabela-coluna"><span>Salario</span></th>
											<th class="tabela-coluna"><span>Acoes</span></th>
										</tr>
									</thead>
								</table>
								<article class="scrollContainer">
									<table border="0">
										<tbody>
											<c:forEach var="funcionario" items="funcionarios">
												<tr>
												<td class="tabela-coluna"><span>${funcionario.nome}</span></td>
												<td class="tabela-coluna"><span>${funcionario.cpf}</span></td>
												<td class="tabela-coluna"><span>${funcionario.cargo}</span></td>
												<td class="tabela-coluna"><span><fmt:formatNumber
									type="currency" value="${funcionario.salario}" /></span></td>
												<td class="tabela-coluna">
													<span>
														<a href='removerCardapio?id=${funcionario.id}'>[excluir]</a>
														<a href="Comando para inativar">[Inativar]</a>
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
				<form method="post" action="CadastraFuncionario">
					<article class="cont_tab" id="Read">
						<fieldset><legend>Cadastrar Funcionario</legend>
							<article class="tab_Cadastro" id="caixa_1">
								<tbody>
									<tr>
										<td align="right">
											<label id="labellogin"><em>Login:</em></label>
										</td>
										<td align="left">
											<input id="txtlogin" name="nome" type="text" required=""></input>
										</td>
										<td align="right">
											<label id="labelsenha"><em>Senha:</em></label>
										</td>
										<td align="left">
											<input id="txtsenha" name="senha" type="password" required="" />
										</td>
										<td align="right">
											<label id="labelNome"><em>Nome:</em></label>
										</td>
										<td align="left">
											<input id="txtNome" name="nome" type="text" required="" />
										</td>
										<td align="right">
											<label id="labeltelefone"><em>Telefone:</em></label>
										</td>
										<td align="left">
											<input id="txttelefone" type="tel" name="telefone" required="required" maxlength="15" name="phone" pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$" title="Digite no seguinte formato (xx)xxxxx-xxxx" />
										<td>
									</tr>
								</tbody>
							</article>
							<article class="tab_Cadastro" id="caixa_2">
								<tbody>
									<tr>
										<td align="right">
											<label id="labelemail"><em>Email:</em></label>
										</td>
										<td align="left">
											<input id="txtemail" type="email" required="required" class="input-text" name="email" pattern="[a-z0-9._%+-]+@[a-0-9.-]+\.[a-z]{2,4}$" />											
										</td>
										<td align="right">												
											<label id="labelcpf"><em>CPF:</em></label>
										</td>											
										<td align="left">
											<input id="txtcpf" Title="Digite no formato mmm.mmm.mmm-mm" type="text" required="" name="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}$"/>
										</td>											
										<td align="right">
											<label id="labelcargo"><em>Cargo:</em></label>
										</td>											
										<td align="left">
											<input id="txtcargo" type="text" name="cargo" required="" />
										</td>											
										<td align="right">
											<label id="labelsalario"><em>Salario:</em></label>
										</td>											
										<td align="left">
											<input id="txtsalario" type="tel" required="required" maxlength="15" name="salario" pattern="([0-9]{1,3}\.)?[0-9]{1,3},[0-9]{2}$" title="Digite no seguinte formato min: x,xx  max: x.xxx,xx ou " />
										</td>
									</tr>
								</tbody>
							</article>
							<article id= caixa_salvar>
								<tr>
									<td align="right">
										<input id="btnsalvar" type="submit" value="Salvar" />
									</td>
								</tr>
							</article>
						</fieldset>
					</article>
				</form>
			</section>
			
			<footer><!-- cabeÃ§alho da pagina -->
				
			</footer>
		</form> 
	</body>
</html>