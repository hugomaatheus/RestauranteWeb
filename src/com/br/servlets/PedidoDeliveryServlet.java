package com.br.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.controller.ClienteController;
import com.br.controller.GerenteController;
import com.br.model.Cardapio;
import com.br.model.ItemPedido;
import com.br.model.Usuario;

@WebServlet("/pedido/clientePedido/PedidoDelivery")
public class PedidoDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<ItemPedido> itens; 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession(false);
	    List<Cardapio> cardapios;
		
		if(itens == null) {
			itens = new ArrayList<ItemPedido>();
		}
		cardapios = GerenteController.consultarTodosCardapios();
		
		request.setAttribute("cardapios", cardapios);
		request.setAttribute("itens", itens);
		System.out.println("ITENS ATRIB" + itens);
		
		String trocoPara = request.getParameter("trocoPara");
		System.out.println(trocoPara);
		
		if(!(trocoPara == null)) {
			Usuario cliente;
			cliente = ClienteController.buscarUsuario(1L);
			System.out.println("QTD DOGET" + itens.get(0).getQtd());
			ClienteController.cadastrarPedidoDelivery(cliente, itens, new Double(trocoPara));
		}
		
		
		request.getRequestDispatcher("/pedido/clientePedido/delivery.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemPedido itemPedido = new ItemPedido();
		String cardapioId = request.getParameter("menuCardapio");
		String qtd = request.getParameter("qtde");
		Cardapio cardapio = GerenteController.consultarCardapio(new Long(cardapioId));
		
		itemPedido.setCardapio(cardapio);
		itemPedido.setQtd(Integer.valueOf(qtd));
		System.out.println("QTD DOPOST" + qtd);
		
		boolean exist = false;
		for (ItemPedido itemP : itens) {
			if(itemP.getCardapio().getNome().equals(cardapio.getNome())){
				itemP.setQtd(itemPedido.getQtd()+Integer.valueOf(qtd));
				exist = true;
			}
		}
		if(!exist)
			itens.add(itemPedido);
		doGet(request, response);
	}

}
