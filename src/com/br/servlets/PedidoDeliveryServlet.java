package com.br.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.controller.GerenteController;
import com.br.model.Cardapio;
import com.br.model.ItemPedido;

@WebServlet("/pedido/clientePedido/PedidoDelivery")
public class PedidoDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private List<ItemPedido> itens; 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession(false);
	    List<Cardapio> cardapios;
		
		if(itens == null  || request.getAttribute("itens") == null) {
			itens = new ArrayList<ItemPedido>();
		}
		cardapios = GerenteController.consultarTodosCardapios();
		
		request.setAttribute("cardapios", cardapios);
		request.setAttribute("itens", itens);
		System.out.println("ITENS ATRIB" + itens);
		request.getRequestDispatcher("/pedido/clientePedido/delivery.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qtd = request.getParameter("qtde");
		String cardapioId = request.getParameter("menuCardapio");
		ItemPedido itemPedido = new ItemPedido();
		Cardapio cardapio;
		
		cardapio = GerenteController.consultarCardapio(new Long(cardapioId));
		
		System.out.println("CARDAPIO"+cardapio);
		System.out.println("QTD"+qtd);
		itemPedido.setCardapio(cardapio);
		itemPedido.setQtd(new Integer(qtd));
		itens.add(itemPedido);
		System.out.println("ITENS" + itens);
		
		
		doGet(request, response);
	}

}
