/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.model;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Hashtable;
import java.util.Map;

/**
 *
 * @author mayaracoelho
 */
public class Catalogo {

    Map<String, Produto> catalogo = new Hashtable<String, Produto>();

    public Catalogo() {
    }

    public Catalogo(String catalogo) {
        String[] result = catalogo.split("[\n]");
        for (String r : result) {
            String[] res = r.split(" ");
            int cod = Integer.parseInt(res[0]);
            final LocalDate dtIn = LocalDate.parse(res[3]);
            final LocalDate dtFin = LocalDate.parse(res[4]);
            Produto produto = new Produto(cod, res[1], res[2], dtIn, dtFin);
            this.catalogo.put(res[0], produto);

        }
    }

    public void add(String key, Produto produto) {
        catalogo.put(key, produto);

    }

    public void remove(String key) {
        catalogo.remove(key);

    }

    public void clear() {
        catalogo.clear();

    }

    public boolean checkkey(String key) {

        if (catalogo.containsKey(key)) {
            return true;
        }
        return false;
    }

    public String return_produto(String key) {
        Produto produto;

        produto = catalogo.get(key); //Aqui talvez um toString

        return produto.toString();
    }

    public void buscarCodigoProduto(int codigo) {

    }

    @Override
    public String toString() {
        String string = "";
        for (Map.Entry<String, Produto> produto : catalogo.entrySet()) {
            string += produto.getValue().toString() + "\n";
        }
        return string;
    }

    public String listaNomes() {
        String string = "";
        for (Map.Entry<String, Produto> produto : catalogo.entrySet()) {
            string += produto.getValue().getNome() + "\n";
        }
        return string;
    }

}
