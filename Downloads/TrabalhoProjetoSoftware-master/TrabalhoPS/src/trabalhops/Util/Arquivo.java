/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import trabalhops.model.Produto;
import trabalhops.view.AppendingObjectOutputStream;

/**
 *
 * @author mayaracoelho
 */
public class Arquivo implements Serializable {

    public Arquivo() {

    }

    public ObjectOutputStream openStream(File f) throws Exception {
        ObjectOutputStream oos = null;
        if (f.exists()) {
            FileOutputStream fos = new FileOutputStream(f, true);
            oos = new AppendingObjectOutputStream(fos);
        } else {
            FileOutputStream fos = new FileOutputStream(f);
            oos = new ObjectOutputStream(fos);
        }
        return oos;
    }

    public void writeArquivoCatalogo(Map<String, Produto> catalogo) throws FileNotFoundException, IOException, Exception {
        // The name of the file to create.
        String nomeArquivo = "Arquivo.dat";
        File file = new File(nomeArquivo);
        if (!file.exists()) {
            file.createNewFile();
        }
        OutputStream writeArquivo = new FileOutputStream(file);
        ObjectOutputStream os = new ObjectOutputStream(writeArquivo);
        os.writeObject(catalogo);
        os.close();

 }

    public Map<String, Produto> readArquivoCatalogo() {
        FileInputStream readArquivo = null;
        Map<String, Produto> dados = null;
        try {
            String nomeArquivo = "Arquivo.dat";

            File file = new File(nomeArquivo);
            readArquivo = new FileInputStream(file);
            ObjectInputStream is = new ObjectInputStream(readArquivo);
            dados = (Map<String, Produto>) is.readObject();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Arquivo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Arquivo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Arquivo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                readArquivo.close();
            } catch (IOException ex) {
                Logger.getLogger(Arquivo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return dados;
    }

}
