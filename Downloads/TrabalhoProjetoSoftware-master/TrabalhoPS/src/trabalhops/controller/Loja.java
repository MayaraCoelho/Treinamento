/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.controller;

import java.io.IOException;
import java.time.LocalDate;
import trabalhops.Util.DateException;
import trabalhops.model.Catalogo;
import trabalhops.model.Produto;

/**
 *
 * @author mayaracoelho
 */
public class Loja {

    Catalogo catalogo = new Catalogo();

    public Loja() {

    }

    public void add(String key, int cod, String nome, String descr, LocalDate dtIn, LocalDate dtFin) throws IOException, DateException, Exception {
        if (key != null && !key.isEmpty()) {
            Produto produto = new Produto(cod, nome, descr, dtIn, dtFin);
            catalogo.add(key, produto);
        }

    }

    public void buscaProduto(String codigo) throws ClassNotFoundException, IOException {
        int cod = (int) Long.parseLong(codigo);
        System.out.println(catalogo.buscarCodigoProduto(cod));
    }

    public void pegaCatalogo() throws ClassNotFoundException, IOException {
        System.out.println(catalogo);

    }

    public void pegaNomes() throws ClassNotFoundException, IOException {
        System.out.println(catalogo.listaNomes());
    }
}
