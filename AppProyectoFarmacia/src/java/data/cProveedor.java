
package data;

import com.mongodb.client.MongoCursor;
import org.bson.Document;

public class cProveedor {
    private cEntidad proveedor;
    public cProveedor() throws Exception
    {
        try{
            proveedor=new cEntidad("Proveedor");            
        }
        catch (Exception e) {
             throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }
    public void conectarse() throws Exception
    {
        proveedor.conectar();
    }
    public void desconectarse() throws Exception
    {
        proveedor.desconectar();
    }
    //lista todo los documentos
    public MongoCursor<Document> listar()
    {
        return proveedor.listarTodo();
    }
    public MongoCursor<Document> listarAptos()
    {
        return proveedor.listarCriterio("Estado", "1");
    }
    public MongoCursor<Document> listarDesactivados()
    {
        return proveedor.listarCriterio("Estado", "0");
    }
    //Inserta datos a la base el estado siempre estara en uno
    public void insertar(String Id, String RUC,String Razon, String Direccion, String Telefono, String Contacto,String Correo)
    {
        String[] clave={"Id_Proveedor","RUC","Razon_Social","Direccion","Telefono","Contacto","Correo","Estado"};
        String[] valor={Id,RUC,Razon,Direccion,Telefono,Contacto,Correo,"1"};
        proveedor.insertar(clave, valor);
    }
    //busca por identificador
    public MongoCursor<Document> buscarxId(String Id)
    {
        return proveedor.listarCriterio("Id_Proveedor", Id);
    }
    //buscar por cualquier criterio
    public MongoCursor<Document> buscar(String clave,String valor)
    {
        return proveedor.listarCriterio(clave,valor);
    }
    //modificar los valores
    public void modificar(String Id, String RUC,String Razon, String Direccion, String Telefono, String Contacto,String Correo)
    {
        proveedor.modificar("Id_Proveedor", Id,"RUC",RUC);
        proveedor.modificar("Id_Proveedor", Id,"Razon_Social",Razon);
        proveedor.modificar("Id_Proveedor", Id,"Direccion",Direccion);
        proveedor.modificar("Id_Proveedor", Id,"Telefono",Telefono);
        proveedor.modificar("Id_Proveedor", Id,"Contacto",Contacto);
        proveedor.modificar("Id_Proveedor", Id,"Correo",Correo);
    }
    //desactivar un proveedor
    public void desactivar(String Id)
    {
        proveedor.modificar("Id_Proveedor", Id,"Estado","0");
    }
    //activar proveedor 
    public void activar(String Id)
    {
        proveedor.modificar("Id_Proveedor", Id,"Estado","1");
    }
    //metodo que proporciona el un identificador
    public String Identificador()
    {
       String ceros="";
        for(int i=0; i<4- ((proveedor.contar()+1)/10);i++)
        {
            ceros = ceros+ "0";
        }
            return "PV"+ceros+Long.toString(proveedor.contar()+1);
    }
}
