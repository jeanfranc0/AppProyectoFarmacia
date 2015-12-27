package data;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import java.net.UnknownHostException;

public class cConexion {

    //ATRIBUTOS
    private String aServidor;
    private String aBaseDatos;
    private String aUsuario;
    private String aPassword;

    public MongoClient mCliente;
    public MongoDatabase  mBaseDatos;

    //METODOS
    public cConexion() {
        this.aServidor = "";
        this.aBaseDatos = "";
        this.aUsuario = "";
        this.aPassword = "";
    }

    public cConexion(String servidor, String baseDatos, String usuario, String password) {
        this.aServidor = servidor;
        this.aBaseDatos = baseDatos;
        this.aUsuario = usuario;
        this.aPassword = password;
    }

    public void conectar() throws Exception {
        try {
            mCliente = new MongoClient(aServidor, 27017);
            mBaseDatos = mCliente.getDatabase(aBaseDatos);
        } catch (Exception e) {
            throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }

    public void desconectar() throws Exception {
        try {
            mCliente.close();
        } catch (Exception e) {
            throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }

    public String getServidor() {
        return aServidor;
    }

    public void setServidor(String servidor) {
        this.aServidor = servidor;
    }

    public String getBaseDatos() {
        return aBaseDatos;
    }

    public void setBaseDatos(String baseDatos) {
        this.aBaseDatos = baseDatos;
    }

    public String getUsuario() {
        return aUsuario;
    }

    public void setUsuario(String usuario) {
        this.aUsuario = usuario;
    }

    public String getPassword() {
        return aPassword;
    }

    public void setPassword(String password) {
        this.aPassword = password;
    }
    
}
