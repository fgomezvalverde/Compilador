/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package analizador_lexico;

import Token.Tabla_Token;
import Token.Token;
import analizador_lexico.Lexer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;

/**
 *
 * @author Fabian
 */
public class Principal extends javax.swing.JFrame {

   
    public Principal() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        Table_Tokens = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        Txt_Error = new javax.swing.JTextArea();
        jButton1 = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        Txt_Arch = new javax.swing.JTextArea();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        Table_Tokens.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(Table_Tokens);

        Txt_Error.setColumns(20);
        Txt_Error.setRows(5);
        jScrollPane2.setViewportView(Txt_Error);

        jButton1.setText("Buscar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        Txt_Arch.setColumns(20);
        Txt_Arch.setRows(5);
        jScrollPane3.setViewportView(Txt_Arch);

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel4.setText("Archivo");

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel5.setText("Seleccione el Archivo");

        jLabel6.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel6.setText("Errores");

        jLabel7.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel7.setText("Tabla de Tokens");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 757, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 760, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1)
                    .addComponent(jLabel6)
                    .addComponent(jLabel7)
                    .addComponent(jLabel5))
                .addGap(44, 44, 44)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 615, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(32, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jButton1)
                        .addGap(22, 22, 22)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 287, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(33, 33, 33)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 193, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane3))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        fc =  new JFileChooser();
        int returnVal = fc.showOpenDialog(Principal.this);
        fc.setVisible(true);
        String direc = "";
        if (returnVal == JFileChooser.APPROVE_OPTION) {
            File file = fc.getSelectedFile();
            
                    direc=file.getPath();
                    fc= null;
        

        }
        
        
        Reader reader = null ;
        BufferedReader reader1 = null;
        int contador_errores=1;
        Txt_Arch.setText("");
        Txt_Error.setText("");
        String txt = "",linea="";
        Tabla_Token tabla = new Tabla_Token();
        try {
            reader = new BufferedReader(new FileReader(direc));
            reader1 = new BufferedReader(new FileReader(direc));
            while ((linea = reader1.readLine()) != null) 
                txt+= linea + "\n"; 
            Txt_Arch.setText(txt);
            Lexer lexer = new Lexer (reader);
            String resultado="";
            while (true){
                Token token =lexer.yylex();
                if (token == null){
                            Table_Tokens.setModel(new javax.swing.table.DefaultTableModel(tabla.HacerTabla(),
                new String [] {
                    "Token", "Tipo de Token","Linea"
                }
                ));
                
                    return;
                }
                switch (token){
                    case ETIQUETA:
                        tabla.Agregar(lexer.lexeme, "ETIQUETA", lexer.linea+"");
                        break;
                    case OPERADOR:
                        tabla.Agregar(lexer.lexeme, "OPERADOR", lexer.linea+"");
                        break;
                    case PALABRA_RESERVADA:
                        tabla.Agregar(lexer.lexeme, "PALABRA RESERVADA", lexer.linea+"");
                        break;
                    case LITERAL:
                        tabla.Agregar(lexer.lexeme, "LITERAL", lexer.linea+"");
                        break;
                    case COMENTARIO:
                        tabla.Agregar(lexer.lexeme, "COMENTARIO", lexer.linea+"");
                        break;
                    case ERROR:
                        Txt_Error.setText(Txt_Error.getText()+
                                contador_errores+"."+"ERROR EN LA LINEA "+lexer.linea+".Con el codigo-> "+lexer.lexeme+"\n");
                        contador_errores++;
                        break;
                    case IDENTIFICADOR: {
                        tabla.Agregar(lexer.lexeme, "IDENTIFICADOR", lexer.linea+"");
                        break;
                    }
                    case OTRO: {
                        tabla.Agregar(lexer.lexeme, "COR-PAREN-PUNTO/COMA", lexer.linea+"");
                        break;
                    }
                    default:
                        tabla.Agregar(lexer.lexeme, "DEFAULT", lexer.linea+"");
                }
            }   } catch (FileNotFoundException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                reader.close();
            } catch (IOException ex) {
                Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        
        
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
     * @param args the command line arguments
     */
    JFileChooser fc ;

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable Table_Tokens;
    private javax.swing.JTextArea Txt_Arch;
    private javax.swing.JTextArea Txt_Error;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    // End of variables declaration//GEN-END:variables
}
