/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.model;

import java.time.LocalDate;

/**
 *
 * @author mayaracoelho
 */
public class Produto {
    private int codigo;
    private String nome;
    private String descricao;
    private LocalDate dataInicial;
    private LocalDate dataFinal;
    

    public Produto(int codigo, String nome, String descricao, LocalDate dataInicial, LocalDate dataFinal) {
        this.codigo = codigo;
        this.nome = nome;
        this.descricao = descricao;
        this.dataInicial = dataInicial;
        this.dataFinal = dataFinal;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public LocalDate getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(LocalDate dataInicial) {
        this.dataInicial = dataInicial;
    }

    public LocalDate getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(LocalDate dataFinal) {
        this.dataFinal = dataFinal;
    }
    
    
    @Override
    public String toString(){
        String string;
        string = (codigo + " " + nome + " " + descricao + " " + dataInicial + " " + dataFinal);
      return string;  
    }
    
    
}
