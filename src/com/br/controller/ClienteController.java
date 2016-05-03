package com.br.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.swing.JOptionPane;

import com.br.dao.ClienteDao;
import com.br.dao.DeliveryDao;
import com.br.dao.ItemPedidoDao;
import com.br.dao.UsuarioDao;
import com.br.model.Cardapio;
import com.br.model.Cliente;
import com.br.model.Delivery;
import com.br.model.ItemPedido;
import com.br.model.Usuario;
import com.br.util.Status;
import com.br.util.Tipo;


public class ClienteController implements AbstractController {



	//Manter cliente - OK
	public static void cadastrarUsuario(Usuario cliente) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		ClienteDao clienteDao = new ClienteDao(eM);
		
		try {	
				cliente.setStatus(Status.ATIVO);
				cliente.setTipo(Tipo.CLIENTE);
				clienteDao.save((Cliente) cliente);
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
	public static void desativarUsuario(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		ClienteDao clienteDao = new ClienteDao(eM);
		Cliente cliente = new Cliente();
		
		try {
			
			cliente = clienteDao.getById(id);
			
			if(cliente.getStatus() == Status.ATIVO) {
				cliente.setStatus(Status.INATIVO);
				clienteDao.update(cliente);
				eM.getTransaction().begin();
				eM.getTransaction().commit();
			}
			else
				JOptionPane.showConfirmDialog(null, "Você está tentando desativar"
						+ " um cliente já inativo");
				
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		
	}
	
	//OK
	public static void atualizarUsuario(Cliente cliente) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		ClienteDao clienteDao = new ClienteDao(eM);
		
		try {
			clienteDao.update(cliente);
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
	public static Cliente buscarUsuario(Long id) {
		EntityManager eM = AbstractController.factory.createEntityManager();
		ClienteDao clienteDao = new ClienteDao(eM);
		Cliente c = null;
		
		try {
			c = clienteDao.getById(id);
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}
		
		return c;
	}
	
	public static Cliente logar(String login, String senha){
		EntityManager eM = AbstractController.factory.createEntityManager();
		UsuarioDao clienteDao = new UsuarioDao(eM);
		return (Cliente)clienteDao.fazerLogin(login, senha);
	}
	//////////////////////////////////////////
	
	
	//Manter pedido - OK
	public static Delivery buscarPedidoDelivery(Long id) {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		Delivery d = null;

		try {
			DeliveryDao deliveryDao = new DeliveryDao(eM);
			d = (Delivery) deliveryDao.getById(id);
		}catch (Exception e) {
			eM.getTransaction().rollback();
		}

		return d;	
	}
	
	public static Collection<Delivery> listarTodos() {
		EntityManager eM = AbstractController.factory.createEntityManager();
		DeliveryDao deliveryDao = new DeliveryDao(eM);
		Collection<Delivery> deliverys = new ArrayList<Delivery>();
		
		try {
			deliveryDao.listar();
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			eM.getTransaction().rollback();
		}
		finally {
			eM.close();
		}
		return deliverys;
	}
	
	//
public static void cadastrarPedidoDelivery(Usuario cliente, List<ItemPedido> itens, Double trocoPara) {
		
		EntityManager eM = AbstractController.factory.createEntityManager();
		DeliveryDao deliveryDao = new DeliveryDao(eM);
		ItemPedidoDao iDao = new ItemPedidoDao(eM);
		ItemPedido i = new ItemPedido(); 
		Calendar c = Calendar.getInstance();
		Date data = c.getTime();
		
		try {
			
			Delivery delivery = new Delivery(trocoPara, (Cliente) cliente);
			delivery.setStatus(Status.ANDAMENTO);
			delivery.setData(data);
			deliveryDao.save(delivery);
			

			for (ItemPedido item : itens) {
				i.setCardapio(item.getCardapio());
				i.setPedido(delivery);
				i.setQtd(item.getQtd());
				iDao.update(i);
			}
			
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
	///////////////////////////////////////////
}
