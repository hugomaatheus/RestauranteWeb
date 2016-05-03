package com.br.model;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name="cardapio_id", sequenceName="cardapio_seq")
@NamedQuery(name="findAllCardapios", query="SELECT c FROM Cardapio c")
public class Cardapio implements AbstractEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String nome;

	private Double preco;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_categoria", nullable=true)
	private Categoria categoria;

	public Cardapio(String nome, double preco, Categoria categoria) {
		super();
		this.nome = nome;
		this.preco = preco;
		this.categoria = categoria;
	}
	
	public Cardapio() {
		
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}
	
	@Override
	public String toString() {
		return String.format("Nome: %s\n"
				+ "Pre�o: R$%f\n"
				+ "Categoria: %s\n", getNome(), getPreco(), getCategoria());
	}
}
