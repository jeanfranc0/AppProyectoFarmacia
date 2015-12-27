
package data;

import com.mongodb.client.MongoCursor;
import org.bson.Document;

public class cClienteJuridico {
    private cEntidad cliente;
    public cClienteJuridico() throws Exception
    {
        try{
            cliente=new cEntidad("ClienteJuridico");            
        }
        catch (Exception e) {
             throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }
    public void conectarse() throws Exception
    {
        cliente.conectar();
    }
    public void desconectarse() throws Exception
    {
        cliente.desconectar();
    }
    //lista todo los documentos
    public MongoCursor<Document> listar()
    {
        return cliente.listarTodo();
    }
    public MongoCursor<Document> listarAptos()
    {
        return cliente.listarCriterio("Estado", "1");
    }
    public MongoCursor<Document> listarDesactivados()
    {
        return cliente.listarCriterio("Estado", "0");
    }
    //Inserta datos a la base el estado siempre estara en uno
    public void insertar(String IdCliente, String Direccion,String Telefono, String RUC, String Razon)
    {
        String[] clave={"Id_Cliente","Direccion","Telefono","Estado","RUC","Razon_Social"};
        String[] valor={IdCliente,Direccion,Telefono,"1",RUC,Razon};
        cliente.insertar(clave, valor);
    }
    //busca por identificador
    public MongoCursor<Document> buscarxId(String Id)
    {
        return cliente.listarCriterio("Id_Cliente", Id);
    }
    //buscar por cualquier criterio
    public MongoCursor<Document> buscar(String clave,String valor)
    {
        return cliente.listarCriterio(clave,valor);
    }
    //modificar los valores
    public void modificar(String IdCliente, String Direccion,String Telefono, String RUC, String Razon)
    {
        cliente.modificar("Id_Cliente", IdCliente,"Direccion",Direccion);
        cliente.modificar("Id_Cliente", IdCliente,"Telefono",Telefono);
        cliente.modificar("Id_Cliente", IdCliente,"RUC",RUC);
        cliente.modificar("Id_Cliente", IdCliente,"Razon_Social",Razon);
    }
    //desactivar un proveedor
    public void desactivar(String Id)
    {
        cliente.modificar("Id_Cliente", Id,"Estado","0");
    }
    //activar proveedor 
    public void activar(String Id)
    {
        cliente.modificar("Id_Cliente", Id,"Estado","1");
    }
    //metodo que proporciona el un identificador
    public String Identificador()
    {
        String ceros="";
        for(int i=0; i<4- ((cliente.contar()+1)/10);i++)
        {
            ceros = ceros+ "0";
        }
            return "CJ"+ceros+Long.toString(cliente.contar()+1);
    }
}
