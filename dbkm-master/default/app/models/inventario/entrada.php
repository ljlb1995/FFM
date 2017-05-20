<?php
/**
 * Dailyscript - Web | App | Media
 *
 * Clase que gestiona todo lo relacionado con los Apostolados del sistema
 *
* @category
 * @package     Models
 * @subpackage
 * @author      Iván D. Meléndez (ivan.melendez@dailyscript.com.co)
 * @copyright   Copyright (c) 2013 Dailyscript Team (http://www.dailyscript.com.co) 
 */

class Entrada extends ActiveRecord {
    
    //Se desabilita el logger para no llenar el archivo de "basura"
    public $logger = FALSE;

    /**
     * Constante para definir un Sacramentos como activo
     */
    const ACTIVO = 1;
    
    /**
     * Constante para definir un Sacramentos como inactivo
     */
    const INACTIVO = 2;
    
    /**
     * Constante para identificar el comodín *
     */
    const COMODIN = 1;
    
    /**
     * Constante para definir el Sacramentos principal
     */
    const DASHBOARD = 2;
    
    /**
     * Constante para definir el Sacramentos "Mi Cuenta"
     */
    const MI_CUENTA = 2;
       
    
    /**
     * Método para definir las relaciones y validaciones
     */
    protected function initialize() {        

          
    }
    


    public function getInformacionEntrada($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'entrada.*';
        $join = '';
        $condicion ="entrada.id = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 



    /**
     * Método para obtener el listado de los Apostolados del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */
    public function getListadoEntradas($estado='todos', $order='order.id.asc', $page=0) {                           
        $columns = 'entrada.id, entrada.numerocontrol, entrada.nombrechofer, producto.nombreproducto as producto, entrada.cantidadproducto';
        $join = 'INNER JOIN producto on producto.id=entrada.idproducto';
        $order = $this->get_order($order, 'id', array('entrada'=>array('ASC'=>'entrada.id, entrada.numerocontrol ASC, entrada.nombrechofer ASC, producto ASC, entrada.cantidadproducto ASC','DESC'=>'entrada.id DESC, entrada.nombrechofer ASC, entrada.nombreproducto DESC, entrada.cantidadproducto DESC,'),'descripcion'));
        if($page) {
         return $this->paginated("columns: $columns", "join: $join",  "order: $order", "page: $page");
        }
        return $this->find("columns: $columns", "join: $join", "order: $order");
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
    public static function setEntrada($method, $data, $optData=null) {        
        $obj = new Entrada($data); //Se carga los datos con los de las tablas        
        //Se verifica si contiene una data adicional para autocargar
        if ($optData) {
            $obj->dump_result_self($optData);
        }   
        if($method!='delete') {
            //$obj->ciudad_id = Ciudad::setCiudad($obj->ciudad)->id;        
        }
        $check = false;
        
        if($check) { //Si existe
            if(empty($obj->id)) {
                $obj->id = $old->id; //Asigno el id del encontrado al nuevo
            } else { //Si se actualiza y existe otro con la misma información
                if($obj->id != $old->id) {
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
       $this->id = Filter::get($this->id, 'string');
       $this->numerocontrol = Filter::get($this->numerocontrol, 'string');
        $this->fecha = Filter::get($this->fecha, 'string');
         $this->cedulachofer = Filter::get($this->cedulachofer, 'string');
         $this->nombrechofer = Filter::get($this->nombrechofer, 'string');
         $this->placavehiculo = Filter::get($this->placavehiculo, 'string');
         $this->tipovehiculo = Filter::get($this->tipovehiculo, 'string');
         $this->idproducto = Filter::get($this->idproducto, 'string');
         $this->cantidadproducto = Filter::get($this->cantidadproducto, 'string');
             
        $conditions = "id = '$this->id'";
        $conditions.= (isset($this->id)) ? " AND id != $this->id" : '';
        if($this->count("conditions: $conditions")) {
            DwMessage::error('Lo sentimos, pero ya existe una entrada registrado con el mismo nombre.');
            return 'cancel';
        }
        
    }
    
    /**
     * Callback que se ejecuta antes de eliminar
     */
    public function before_delete() {
        if($this->id <= 16) {
            return 'cancel';
        }
        if($this->modulo=='sistema' OR ($this->Entrada == '*' && empty($this->controlador)) OR ($this->Entrada=='principal/*') ) {
            return 'cancel';
        }
    }
    
     public function getAjaxEntradas($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'entrada.* ';
        $order = $this->get_order($order, 'nombre', array(                        
             'id' => array(
                'ASC'=>'entrada.id ASC, entrada.id ASC', 
                'DESC'=>'entrada.id DESC, entrada.id DESC'
            ),
             'nombre' => array(
                'ASC'=>'entrada.nombre ASC, entrada.nombre ASC', 
                'DESC'=>'entrada.nombre DESC, entrada.nombre DESC'
                ), 
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombre','id');
        if(!in_array($field, $fields)) {
            $field = 'nombre';
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