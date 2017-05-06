/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.controller;

import java.io.IOException;
import java.time.LocalDate;
import trabalhops.Util.Arquivo;
import trabalhops.model.Catalogo;
import trabalhops.model.Produto;

/**
 *
 * @author mayaracoelho
 */
public class Loja {

    Catalogo catalogo = new Catalogo();
    Arquivo arquivo = new Arquivo();

    public Loja() {

    }

    public void add(String key, int cod, String nome, String descr, LocalDate dtIn, LocalDate dtFin) throws IOException {
        if (key != null && !key.isEmpty()) {
            Produto produto = new Produto(cod, nome, descr, dtIn, dtFin);
            catalogo.add(key, produto);

        }

    }

    public void buscaProduto(String codigo) {
        if (!catalogo.checkkey(codigo)) {
            System.out.println("Produto não encontrado.");
        }
        System.out.println(catalogo.return_produto(codigo));
    }

    public void pegaCatalogo() {
        System.out.println(catalogo.toString());
    }

    public void pegaNomes() {
        System.out.println(catalogo.listaNomes());
    }

    public void atualizaCatalogo(Catalogo catalogo) throws IOException {
        arquivo.atualizarArquivo(catalogo);
    }
}
