package com.br.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import com.br.util.Status;

@Entity
@SequenceGenerator(name="categoria_id", sequenceName="categoria_seq")
public class Categoria implements AbstractEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="nome", unique=true, length=50, nullable=false)
	private String nome;
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	public Categoria(String nome) {
		super();
		this.nome = nome;
	}
	
	public Categoria(Long id) {
		this.id = id;
	}
	
	public Categoria() {}

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
	
	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("Nome: %s\n", getNome());
	}

}
