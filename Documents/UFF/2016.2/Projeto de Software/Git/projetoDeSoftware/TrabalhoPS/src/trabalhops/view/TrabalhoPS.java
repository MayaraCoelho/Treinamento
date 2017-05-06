/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trabalhops.view;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.InputMismatchException;
import java.util.Scanner;
import trabalhops.Util.Arquivo;
import trabalhops.controller.Loja;
import trabalhops.model.Produto;

/**
 *
 * @author mayaracoelho
 */
public class TrabalhoPS {


    public static void main(String[] args) throws IOException {
        Loja loja = new Loja();
        
        Integer option = 0;
        while(option!=5){
            printMenu();
            
            Scanner scanner = new Scanner(System.in).useDelimiter("\\n");
            
            try {
                    option = scanner.nextInt();
            } catch (InputMismatchException e) {
                    System.err.println("Opção inválida!");
            }
            
            String sentence;

				switch (option) {
					case 1:
						System.out.print("Favor digitar dados do produto. \n");
                                                System.out.print("Código: \n");
                                                String codigo = scanner.next();
                                                Integer cod = Integer.parseInt(codigo);
                                                System.out.print("Nome: \n");
                                                String nome = scanner.next();
                                                System.out.print("Descrição: \n");
                                                String descr = scanner.next();
                                                System.out.print("Data de inicio (yyyy-MM-dd: \n");
                                                final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MMM-dd");
                                                final LocalDate dtIn = LocalDate.parse(scanner.next());
                                                System.out.print("Data Final (yyyy-MM-dd: \n");
                                                final LocalDate dtFin = LocalDate.parse(scanner.next());                                                
                                                loja.add(codigo, cod, nome, descr, dtIn, dtFin);
						break;
					case 2:
						System.out.print("Insira o código do produto que deseja visualizar: \n");
                                                codigo = scanner.next();
                                                loja.buscaProduto(codigo);
                                                //imprimir produto X
						break;
                                        case 3:
                                                loja.pegaCatalogo();
                                                //basta usar toString do catalogo
						break;
					case 4:
                                                loja.pegaNomes();
						//listar nomes dos produtos, basta criar um metodo com um loop no catálogo
						break;
					case 5:
						break;
					default:
						System.err.println("Opção inválida!");
				}
            
        }
    }
    
    private static void printMenu() {
        System.out.print("\nFavor escolher opção desejada: \n");
        System.out.print("    1 - Adicionar Produto.\n");
        System.out.print("    2 - Ver um Produto.\n");
        System.out.print("    3 - Listar Produtos.\n");
        System.out.print("    4 - Listar nomes dos produtos.\n");
        System.out.print("    5 - Sair.\n\n");
    }

}
