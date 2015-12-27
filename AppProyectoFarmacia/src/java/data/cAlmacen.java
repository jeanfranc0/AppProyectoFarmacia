package data;

import com.mongodb.client.MongoCursor;
import org.bson.Document;

public class cAlmacen {
    private cEntidad almacen;
    public cAlmacen() throws Exception
    {
        try{
            almacen=new cEntidad("Almacen");            
        }
        catch (Exception e) {
             throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }
    public void conectarse() throws Exception
    {
        almacen.conectar();
    }
    public void desconectarse() throws Exception
    {
        almacen.desconectar();
    }
    //lista todo los documentos
    public MongoCursor<Document> listar()
    {
        return almacen.listarTodo();
    }
    public MongoCursor<Document> listarAptos()
    {
        return almacen.listarCriterio("Estado", "1");
    }
    public MongoCursor<Document> listarDesactivados()
    {
        return almacen.listarCriterio("Estado", "0");
    }
    //Inserta datos a la base el estado siempre estara en uno
    public void insertar(String Id, String Nombre,String Ubicacion)
    {
        String[] clave={"Id_Almacen","Nombre","Ubicacion","Estado"};
        String[] valor={Id,Nombre,Ubicacion,"1"};
        almacen.insertar(clave, valor);
    }
    //busca por identificador
    public MongoCursor<Document> buscarxId(String Id)
    {
        return almacen.listarCriterio("Id_Almacen", Id);
    }
    //buscar por cualquier criterio
    public MongoCursor<Document> buscar(String clave,String valor)
    {
        return almacen.listarCriterio(clave,valor);
    }
    //modificar los valores
    public void modificar(String Id, String Nombre,String Ubicacion)
    {
        almacen.modificar("Id_Almacen", Id,"Nombre",Nombre);
        almacen.modificar("Id_Almacen", Id,"Ubicacion",Ubicacion);
    }
    //desactivar un proveedor
    public void desactivar(String Id)
    {
        almacen.modificar("Id_Almacen", Id,"Estado","0");
    }
    //activar proveedor 
    public void activar(String Id)
    {
        almacen.modificar("Id_Almacen", Id,"Estado","1");
    }
    //metodo que proporciona el un identificador
    public String Identificador()
    {
        String ceros="";
        for(int i=0; i<4- ((almacen.contar()+1)/10);i++)
        {
            ceros = ceros+ "0";
        }
            return "AL"+ceros+Long.toString(almacen.contar()+1);
    }
}