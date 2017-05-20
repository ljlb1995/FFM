<?php
/**
 * Dailyscript - Web | App | Media
 *

* @category
 * @package     Models
 * @subpackage
 * @author      Iván D. Meléndez (ivan.melendez@dailyscript.com.co)
 * @copyright   Copyright (c) 2013 Dailyscript Team (http://www.dailyscript.com.co) 
 */

class Producto extends ActiveRecord {
    
    //Se desabilita el logger para no llenar el archivo de "basura"
    public $logger = FALSE;

    /**
     * Constante para definir  como activo
     */
    const ACTIVO = 1;
    
    /**
     * Constante para definir como inactivo
     */
    const INACTIVO = 2;
    
    /**
     * Constante para identificar el comodín *
     */
    const COMODIN = 1;
    
    /**
     * Constante para definir el  principal
     */
    const DASHBOARD = 2;
    
    /**
     * Constante para definir  "Mi Cuenta"
     */
    const MI_CUENTA = 2;
       
    
    /**
     * Método para definir las relaciones y validaciones
     */
    protected function initialize() {        

        $this->validates_presence_of('idproducto', 'message: Ingresa el codigo del producto.');
      
        $this->validates_presence_of('nombreproducto', 'message: Ingresa el nombre del producto.');
          $min_nombre = 4;
         $this->validates_length_of('nombreproducto', 60, $min_nombre, "too_short: el nombre debe tener <b>Minimo {$min_nombre} caracteres</b>");
      
    }
    


    public function getInformacionProducto($id, $isSlug=false) {
        $idproducto = ($isSlug) ? Filter::get($idproducto, 'string') : Filter::get($idproducto, 'string');
        $columnas = 'producto.*';
        $join = '';
        $condicion ="producto.idproducto = '$idproducto'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 

    /**
     * Método para obtener el listado  del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */
    public function getListadoProducto($estado='todos', $order='order.idproducto.asc', $page=0) {                           
        $columns = 'producto.idproducto, producto.nombreproducto, grupo.nombre as grupoo, subgrupo.nombre as subgrupoo';
        $join = 'INNER JOIN grupo on grupo.id=producto.grupo INNER JOIN subgrupo on subgrupo.id = producto.subgrupo';
        $order = $this->get_order($order, 'idproducto', array('producto'=>array('ASC'=>'producto.idproducto ASC, producto.nombreproducto ASC, grupo.nombre ASC, subgrupo.nombre ASC',
      'DESC'=>'producto.idproducto DESC, producto.nombreproducto ASC, grupo.nombre DESC, subgrupo.nombre DESC'), 'descripcion'));
       if($page) {
          return $this->paginated("columns: $columns",  "join: $join", "order: $order", "page: $page");
        }
        return $this->find("columns: $columns","join: $join", "order: $order");
    }
    
    //   usa el  listadoselect para los listados desde la base de datos

         public function getListadoSelect($estado='todos', $order='order.id.asc', $page=0) {                           
        $columns = 'producto.*';
        $order = $this->get_order($order, 'idproducto', array('producto'=>array('ASC'=>'producto.idproducto ASC, producto.nombreproducto ASC', 'DESC'=>'producto.idproducto DESC, producto.nombreproducto DESC'),));
      if($page) {
             return $this->paginated("columns: $columns",  "order: $order", "page: $page");
        }
        return $this->find("columns: $columns", "order: $order");
    }

    /**
     * Método para crear/modificar un objeto de base de datos
     * 
     * @param string $medthod: create, update
     * @param array $data: Data para autocargar el modelo
     * @param array $optData: Data adicional para autocargar
     * 
     * return object ActiveRecord
     */
    public static function setProducto($method, $data, $optData=null) {        
        $obj = new Producto($data); //Se carga los datos con los de las tablas        
        //Se vecedulaica si contiene una data adicional para autocargar
        if ($optData) {
            $obj->dump_result_self($optData);
        }   
        if($method!='delete') {
                   
        }
        $check = false;
        
        if($check) { //Si existe
            if(empty($obj->idproducto)) {
                $obj->idproducto = $old->idproducto; //Asigno el id del encontrado al nuevo
            } else { //Si se actualiza y existe otro con la misma información
                if($obj->idproducto != $old->idproducto) {
                    DwMessage::info('Lo sentimos, pero ya existe una persona registrada con el mismo número de identificación');
                    return FALSE;
                }
            }
            if($method=='create') { //Si se crea la persona, pero ya está registrada la actualizo
                $method = 'update';
            }
        }
        $rs = $obj->$method();
        
        return ($rs) ? $obj : FALSE;
    }
    
    /**
     * Callback que se ejecuta antes de guardar/modificar
     */
    public function before_save() {
        $this->idproducto = Filter::get($this->idproducto, 'numeric');
        $this->nombreproducto = Filter::get($this->nombreproducto, 'string');
        $this->grupo = Filter::get($this->grupo, 'numeric');
        $this->subgrupo = Filter::get($this->subgrupo, 'numeric');
        
           
            $conditions = "idproducto = '$this->idproducto'";
            $conditions.= (isset($this->idproducto)) ? " AND idproducto != $this->idproducto" : "idproducto";
            if($this->count("conditions: $conditions")) {
                DwMessage::error('lo sentimos, ya existe un producto con ese codigo, intente con otro codigo');
               
            }
        
    }
    
    /**
     * Callback que se ejecuta antes de eliminar
     */
    public function before_delete() {
        if($this->idproducto <= 16) {
            return 'cancel';
        }
        if($this->modulo=='sistema' OR ($this->Producto == '*' && empty($this->controlador)) OR ($this->Producto=='principal/*') ) {
            return 'cancel';
        }
    }
    
     public function getAjaxProducto($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'producto.* ';
        $order = $this->get_order($order, 'nombreproducto', array(                        
             'idproducto' => array(
                'ASC'=>'producto.idproducto ASC, producto.idproducto ASC', 
                'DESC'=>'producto.idproducto DESC, producto.idproducto DESC'
            ),
             'nombre' => array(
                'ASC'=>'producto.nombreproducto ASC, producto.nombreproducto ASC', 
                'DESC'=>'producto.nombreproducto DESC, producto.nombreproducto DESC'
                ), 
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombreproducto','idproducto');
        if(!in_array($field, $fields)) {
            $field = 'nombreproducto';
        }        
        //if(! ($field=='parroquia' && $value=='todas') ) {
          $conditions= " $field LIKE '%$value%'";
        //} 

        if($page) {
            return $this->paginated("columns: $columns", "conditions: $conditions",  "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columns", "conditions: $conditions", "order: $order");
        }  
        //"conditions: $conditions",
    } 
}
?>