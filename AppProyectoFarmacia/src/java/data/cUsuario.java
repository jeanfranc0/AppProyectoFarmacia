
package data;
import com.mongodb.client.MongoCursor;
import org.bson.Document;
public class cUsuario {
    private cEntidad usuario;
    public cUsuario() throws Exception
    {
        try{
            usuario=new cEntidad("Usuario");            
        }
        catch (Exception e) {
             throw new Exception("Error Econtrado:\n "+e.toString());
        }
    }
    public void conectarse() throws Exception
    {
        usuario.conectar();
    }
    public void desconectarse() throws Exception
    {
        usuario.desconectar();
    }
    //lista todo los documentos
    public MongoCursor<Document> listar()
    {
        return usuario.listarTodo();
    }
    public MongoCursor<Document> listarAptos()
    {
        return usuario.listarCriterio("Estado", "1");
    }
    public MongoCursor<Document> listarDesactivados()
    {
        return usuario.listarCriterio("Estado", "0");
    }
    //Inserta datos a la base el estado siempre estara en uno
    public void insertar(String Usuario, String Contrasenia,String DNI, String Nombres, String Apellidos, String Cargo,String Id_Almacen)
    {
        String[] clave={"Usuario","Contrasenia","DNI","Nombres","Apellidos","Cargo","Id_Almacen","Estado"};
        String[] valor={Usuario,Contrasenia,DNI,Nombres,Apellidos,Cargo,Id_Almacen,"1"};
        usuario.insertar(clave, valor);
    }
    //busca por identificador
    public MongoCursor<Document> buscarxId(String Id)
    {
        return usuario.listarCriterio("Usuario", Id);
    }
    //buscar por cualquier criterio
    public MongoCursor<Document> buscar(String clave,String valor)
    {
        return usuario.listarCriterio(clave,valor);
    }
    //modificar los valores
    public void modificar(String Usuario, String DNI,String Nombres, String Apellidos, String Id_Almacen,String Cargo)
    {
        usuario.modificar("Usuario", Usuario,"DNI",DNI);
        usuario.modificar("Usuario", Usuario,"Nombres",Nombres);
        usuario.modificar("Usuario", Usuario,"Apellidos",Apellidos);
        usuario.modificar("Usuario", Usuario,"Id_Almacen",Id_Almacen);
        usuario.modificar("Usuario", Usuario, "Cargo", Cargo);
    }
    //desactivar un usuario
    public void desactivar(String Id)
    {
        usuario.modificar("Usuario", Id,"Estado","0");
    }
    //activar usuario 
    public void activar(String Id)
    {
        usuario.modificar("Usuario", Id,"Estado","1");
    }
    //metodo que cambia la contrasenia 
    public void cambiarContrasenua(String Usuario, String Contrasenia)
    {
        usuario.modificar("Usuario", Usuario,"RUC",Contrasenia);
    }
    //obtener nombre
    public int validar(String Usuario, String Contrasenia) {
        MongoCursor<Document> datos = usuario.listarCriterio("Usuario", Usuario);
        Document documento;
        documento = datos.next();
        String contraseña = documento.getString("Contrasenia");
        String cargo = documento.getString("Cargo");
        if (Contrasenia.equals(contraseña)) {
            if (cargo.equals("Administrador")) {
                return 1;
            } else {
                if (cargo.equals("Recepcionista")) {
                    return 2;
                } else {
                    return 0;
                }
            }
        } else {
            return 0;
        }
    }
}
