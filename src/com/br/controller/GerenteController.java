package com.br.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.swing.JOptionPane;

import com.br.dao.CardapioDao;
import com.br.dao.CategoriaDao;
import com.br.dao.ClienteDao;
import com.br.dao.FuncionarioDao;
import com.br.dao.ItemPedidoDao;
import com.br.dao.MesaDao;
import com.br.dao.UsuarioDao;
import com.br.model.Cardapio;
import com.br.model.Categoria;
import com.br.model.Cliente;
import com.br.model.Funcionario;
import com.br.model.Gerente;
import com.br.model.ItemPedido;
import com.br.model.Mesa;
import com.br.util.Status;
import com.br.util.Tipo;

public class GerenteController extends UsuarioController<Funcionario> {
	

	
	//Manter Cardapio
	//OK
	public static void cadastrarCardapio(Cardapio c) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CardapioDao cDao = new CardapioDao(eM);
		try {
			cDao.update(c);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	public static List<Cardapio> buscar(Cardapio filtro){
		EntityManager  eM =  AbstractController.factory.createEntityManager();
		List<Cardapio> cardapios = new ArrayList<Cardapio>();
		try{
			CardapioDao cardapioDao = new CardapioDao(eM);
			cardapios = cardapioDao.filtrar(filtro);
		}
		finally{
			eM.close();
		}
		return cardapios;
	}
	
	
	public static List<Cardapio> consultarTodosCardapios() {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		CardapioDao cardDao = new CardapioDao(eM);
		List<Cardapio> cardapios = new ArrayList<Cardapio>();
		
		try {
			cardapios = cardDao.listar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		return cardapios; 
	}
	
	public static Cardapio consultarCardapio(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CardapioDao cDao = new CardapioDao(eM);
		Cardapio c = new Cardapio();
		
		try {
			c = cDao.getById(id);
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
		return c;
	}
	//OK
	public static void atualizarCardapio(Cardapio c) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CardapioDao cDao = new CardapioDao(eM);
		
		try {
			cDao.update(c);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	//OK
	public void excluirCardapio(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CardapioDao cDao = new CardapioDao(eM);
		Cardapio c;
		
		try {
			c = cDao.getById(id);
			c.setCategoria(null);
			cDao.delete(c);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	public static Gerente logar(String login, String senha){
		EntityManager eM = AbstractController.factory.createEntityManager();
		UsuarioDao gerenteDao = new UsuarioDao(eM);
		return (Gerente) gerenteDao.fazerLogin(login, senha);
	}
	////////////////////////////////////////
	
	
	//Manter Categoria - OK
	public static void cadastrarCategoria(Categoria c) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CategoriaDao categoriaDao = new CategoriaDao(eM);
		
		try {
			c.setStatus(Status.ATIVO);
			categoriaDao.save(c);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	//OK
	public static void atualizarCategoria(Categoria c) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CategoriaDao categoriaDao = new CategoriaDao(eM);
		
		 try {
			 categoriaDao.update(c);
			 eM.getTransaction().begin();
			 eM.getTransaction().commit();
		 }catch (Exception e) {
			 eM.getTransaction().rollback();
		 }
		 finally {
			eM.close();
		}
	}
	
	//OK
	public static void excluirCategoria(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CategoriaDao cDao = new CategoriaDao(eM);
		Categoria categoria;
		
		try {
			categoria = cDao.getById(id);
//			categoria.setId(null);
//			cDao.update(categoria);
			cDao.delete(categoria);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	//OK
	public static Categoria consultarCategoria(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		CategoriaDao cDao = new CategoriaDao(eM);
		Categoria c = new Categoria();
		
		try {
			c = cDao.getById(id);
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
		return c;
	}
	
	
	public static List<Categoria> listarTodasCategorias() {
		EntityManager eM = AbstractController.factory.createEntityManager();

		List<Categoria> categorias = new ArrayList<Categoria>();
		
		try {
			CategoriaDao catDao = new CategoriaDao(eM);
			categorias = catDao.listar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
		return categorias; 
	}
	
	public static List<Categoria> buscar(Categoria filtro){
		EntityManager  eM =  AbstractController.factory.createEntityManager();
		List<Categoria> categorias = new ArrayList<Categoria>();
		try{
			CategoriaDao categoriaDao = new CategoriaDao(eM);
			categorias = categoriaDao.filtrar(filtro);
		}
		finally{
			eM.close();
		}
		return categorias;
	}
	
	/////////////////////////////////////////////
	
	
	//OK
	public static void cadastrarMesa(Funcionario f) {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		MesaDao mDao = new MesaDao(eM);
		Mesa mesa = new Mesa(3, 4);
				
		try {			
			mesa.setStatus(Status.LIVRE);
			mDao.save(mesa);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	//OK
	public static void atualizarMesa(Mesa m) {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		MesaDao mesaDao = new MesaDao(eM);
		
		try {
			mesaDao.update(m);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	//OK
	public static Mesa buscarMesa(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		MesaDao mesaDao = new MesaDao(eM);
		Mesa m = new Mesa();
		
		try {
			m = mesaDao.getById(id);
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
			return m;
	}
	
	//OK
	public static void excluirMesa(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		MesaDao mesaDao = new MesaDao(eM);
		Mesa m = mesaDao.getById(id);
//		Query query = eM.createNamedQuery("fecharMesa");
		
		try {
//			query.setParameter("id", id);
//			query.executeUpdate();
			mesaDao.delete(m);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
public static List<Mesa> consultarTodosMesas() {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		MesaDao mesasDao = new MesaDao(eM);
		List<Mesa> mesas = new ArrayList<Mesa>();
		
		try {
			mesas = mesasDao.listar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		return mesas; 
	}
	
	/////////////////////////////////////////////
	
	//OK
	@Override
	public void cadastrarUsuario(Funcionario f) {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		FuncionarioDao fDao = new FuncionarioDao(eM);
		
		try {
			f.setStatus(Status.ATIVO);
			f.setTipo(Tipo.FUNCIONARIO);
			fDao.save(f);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
	}

//	@Override
//	public void desativarUsuario(Long id) {
//		
//	}
	
	//Violando fk na tabela Reserva
	//Criar consulta que deixe nulo a fk da reserva que aquele funcionario fez
	public void excluirUsuario(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		FuncionarioDao fDao = new FuncionarioDao(eM);
		Funcionario f = fDao.getById(id);
		
		try{
			
			fDao.delete(f);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch(Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
	}
	
	//OK
	public void atualizarUsuario(Funcionario f) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		FuncionarioDao fDao = new FuncionarioDao(eM);
		
		try {
			fDao.update(f);
			eM.getTransaction().begin();
			eM.getTransaction().commit();
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
	}
	
	//OK
	@Override
	public Funcionario buscarUsuario(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		FuncionarioDao fDao = new FuncionarioDao(eM);
		Funcionario f = null;
		
		try {
			f = fDao.getById(id);
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		
		return f;
	}
	
	public static List<Cliente> listarTodosClientes() {
		EntityManager eM = AbstractController.factory.createEntityManager();

		List<Cliente> clientes = new ArrayList<Cliente>();
		
		try {
			ClienteDao cDao = new ClienteDao(eM);
			clientes = cDao.listar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
		return clientes; 
	}
	
	public static Mesa buscar(int numero) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		MesaDao mesaDao = new MesaDao(eM);
		Mesa mesa = new Mesa();
		
		try {
			mesa = (Mesa) mesaDao.buscarMesa(numero);
		}catch(Exception e){
			eM.getTransaction().rollback();
		}
			return mesa;
		
	}
	
	public ItemPedido buscarItem(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		ItemPedidoDao itemPedidoDao = new ItemPedidoDao(eM);
		ItemPedido itemPedido = new ItemPedido();
		
		try {
			itemPedido = itemPedidoDao.getById(id);
		}catch(Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
		return itemPedido;
	}

}
