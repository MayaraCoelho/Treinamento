/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.Util;

/**
 *
 * @author mayaracoelho
 */
public class DateException extends Exception {
    
    private String mensagem; 

    public DateException(String mensagem) {
        this.mensagem = mensagem;
    }
    
    @Override
    public String getMessage() {
        return mensagem;
    }
    
}
