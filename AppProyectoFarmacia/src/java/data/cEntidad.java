package data;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import org.bson.Document;

public class cEntidad extends cConexion {

    //ATRIBUTOS
    private String nomColeccion;
    MongoCollection<Document> aColeccion;
    //METODOS
    public cEntidad() {
    }
    public cEntidad(String coleccion) throws Exception {
        super("localhost", "prueba", "", "");
        try {            
            super.conectar();
            this.nomColeccion = coleccion;
        } catch (Exception e) {
             throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }
    public String getNomColeccion() {
        return nomColeccion;
    }
    public void setNomColeccion(String nomColeccion) {
        this.nomColeccion = nomColeccion;
    }
    //lista todo los datos 
    public MongoCursor<Document> listarTodo() {
        aColeccion = mBaseDatos.getCollection(this.nomColeccion);
        return aColeccion.find().iterator();
    }
    //lista con criterio de busqueda
    public MongoCursor<Document> listarCriterio(String clave, String valor)
    {
        aColeccion=mBaseDatos.getCollection(this.nomColeccion);
        return aColeccion.find(new Document(clave,valor)).iterator();
    }
    //inserta en la coleccion
    public void insertar(String[] clave, String[] valor) {
        Document documento = new Document();
        for (int i = 0; i < clave.length; i++) {
            documento.put(clave[i], valor[i]);
        }
        aColeccion.insertOne(documento);
    }
    //modificar datos
    public void modificar(String clave, String valor, String clavemod,String valormod)
    {
        aColeccion.updateOne(new Document(clave,valor), new Document("$set",new Document(clavemod,valormod)));
    }
    //saber cuantos hay 
    public long contar()
    {
        return aColeccion.count();
    }
}
