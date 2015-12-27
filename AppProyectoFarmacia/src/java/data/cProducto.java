
package data;
import com.mongodb.client.MongoCursor;
import org.bson.Document;

public class cProducto {
    private cEntidad producto;
    public cProducto() throws Exception
    {
        try{
            producto=new cEntidad("Producto");            
        }
        catch (Exception e) {
             throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }
    public void conectarse() throws Exception
    {
        producto.conectar();
    }
    public void desconectarse() throws Exception
    {
        producto.desconectar();
    }
    //lista todo los documentos
    public MongoCursor<Document> listar()
    {
        return producto.listarTodo();
    }
    public MongoCursor<Document> listarAptos()
    {
        return producto.listarCriterio("Estado", "1");
    }
    public MongoCursor<Document> listarDesactivados()
    {
        return producto.listarCriterio("Estado", "0");
    }
    //Inserta datos a la base el estado siempre estara en uno
    public void insertar(String Id, String Descripcion,String Marca)
    {
        String[] clave={"Id_Producto","Descripcion","Marca","Estado"};
        String[] valor={Id,Descripcion,Marca,"1"};
        producto.insertar(clave, valor);
    }
    //busca por identificador
    public MongoCursor<Document> buscarxId(String Id)
    {
        return producto.listarCriterio("Id_Producto", Id);
    }
    //buscar por cualquier criterio
    public MongoCursor<Document> buscar(String clave,String valor)
    {
        return producto.listarCriterio(clave,valor);
    }
    //modificar los valores
    public void modificar(String Id, String Descripcion, String Marca)
    {
        producto.modificar("Id_Producto", Id,"Descripcion",Descripcion);
        producto.modificar("Id_Producto", Id,"Marca",Marca);
    }
    //desactivar un proveedor
    public void desactivar(String Id)
    {
        producto.modificar("Id_Producto", Id,"Estado","0");
    }
    //activar proveedor 
    public void activar(String Id)
    {
        producto.modificar("Id_Producto", Id,"Estado","1");
    }
    //metodo que proporciona el un identificador
    public String Identificador()
    {
        String ceros="";
        for(int i=0; i<4- ((producto.contar()+1)/10);i++)
        {
            ceros = ceros+ "0";
        }
            return "PR"+ceros+Long.toString(producto.contar()+1);
    }
}
