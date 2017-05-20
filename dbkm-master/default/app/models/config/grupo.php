<?php
/**
 * Dailyscript - Web | App | Media
 *
 * Clase que gestiona todo lo relacionado con los Sacramentoss del sistema
 *
* @category
 * @package     Models
 * @subpackage
 * @author      Iván D. Meléndez (ivan.melendez@dailyscript.com.co)
 * @copyright   Copyright (c) 2013 Dailyscript Team (http://www.dailyscript.com.co) 
 */

class Grupo extends ActiveRecord {
    
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
       /**
     *  $this->has_many('Sacramentos_sacramento');        
       * $this->has_many('menu');
       *
     */
         $min_nombre = 2;
         $this->validates_length_of('nombre', 20, $min_nombre, "too_short: el nombre debe tener <b>Minimo {$min_nombre} caracteres</b>");
        $this->validates_presence_of('nombre', 'message: Ingresa el nombre del grupo.');
        $this->validates_presence_of('descripcion', 'message: Ingresa la descripción del grupo.');
        $min_descripcion = 20;
        $this->validates_length_of('descripcion', 1000, $min_descripcion, "too_short: la descripcion debe tener <b>Minimo {$min_descripcion} caracteres</b>");
        /**$this->validates_presence_of('vision', 'message: Ingresa la descripción del Sacramento.');  
         $min_vision = 20;
        $this->validates_length_of('vision', 1000, $min_vision, "too_short: la vision debe tener <b>Minimo {$min_vision} caracteres</b>");
    */
    }
    


    public function getInformacionGrupo($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'grupo.*';
        $join = '';
        $condicion ="grupo.id = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 



    /**
     * Método para obtener el listado de los Sacramentoss del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */
    public function getListadogrupos($estado='todos', $order='order.nombre.asc', $page=0) {                           
        $columns = 'grupo.*';

     
          $order = $this->get_order($order, 'nombre', array('grupo'=>array('ASC'=>'grupo.nombre ASC, grupo.descripcion ASC','DESC'=>'grupo.nombre DESC, grupo.descripcion DESC'),'descripcion'));
        if($page) {            
            return $this->paginated("columns: $columns",  "order: $order", "page: $page");
        }
        return $this->find("columns: $columns", "order: $order");
    }
    

public function getListadoSelect($estado='todos', $order='order.nombre.asc', $page=0) {                           
        $columns = 'grupo.*';

     
          $order = $this->get_order($order, 'nombre', array('grupo'=>array('ASC'=>'grupo.id ASC, grupo.nombre ASC','DESC'=>'grupo.id DESC, grupo.nombre DESC')));
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
    public static function setGrupo($method, $data, $optData=null) {        
        $obj = new Grupo($data); //Se carga los datos con los de las tablas        
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
                    DwMessage::info('Lo sentimos, pero ya existe un grupo registrada con el mismo número de identificación');
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
       $this->nombre = Filter::get($this->nombre, 'string');
        $this->descripcion = Filter::get($this->descripcion, 'string');
         
           
        $conditions = "nombre = '$this->nombre'";
        $conditions.= (isset($this->id)) ? " AND id != $this->id" : '';
        if($this->count("conditions: $conditions")) {
            DwMessage::error('Lo sentimos, pero ya existe un grupo registrado con el mismo nombre.');
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
        if($this->modulo=='sistema' OR ($this->Grupos == '*' && empty($this->controlador)) OR ($this->Grupos=='principal/*') ) {
            return 'cancel';
        }
    }
    
     public function getAjaxGrupos($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'grupo.* ';
        $order = $this->get_order($order, 'nombre', array(                        
            'nombre' => array(
                'ASC'=>'grupo.nombre ASC, grupo.nombre ASC', 
                'DESC'=>'grupo.nombre DESC, grupo.nombre DESC'
            ),
            
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombre');
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