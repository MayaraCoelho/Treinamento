/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.model;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import trabalhops.Util.Arquivo;
import trabalhops.Util.DateException;

/**
 *
 * @author mayaracoelho
 */
public class Catalogo {

    Map<String, Produto> catalogo = new Hashtable<String, Produto>();
    Arquivo arq = new Arquivo();

    public Catalogo() {
        catalogo = arq.readArquivoCatalogo();
    }

    public Catalogo(String catalogo) throws DateException {
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

    public void add(String key, Produto produto) throws IOException, Exception {
        catalogo.put(key, produto);
        arq.writeArquivoCatalogo(catalogo);

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

    public String buscarCodigoProduto(int codigo) {
        String string = "Produto não encontrado";
        catalogo = arq.readArquivoCatalogo();
        for (Map.Entry<String, Produto> produto : catalogo.entrySet()) {
            if (codigo == produto.getValue().getCodigo()){
                string = produto.toString();
                return string;
            }   
        }
        return string;
    }

    @Override
    public String toString() {
        String string = "";
        for (Produto produto : catalogo.values()) {
            string += produto.toString() + "\n";
        }
        return string;
    }

    public List<String> listaNomes() throws ClassNotFoundException, IOException {
        String string = "";
        catalogo = arq.readArquivoCatalogo();
        ArrayList<String> listString = new ArrayList();
        for (Map.Entry<String, Produto> produto : catalogo.entrySet()) {
            string = produto.getValue().getNome();
            listString.add(string);
        }
        return listString;
    }


} 
 