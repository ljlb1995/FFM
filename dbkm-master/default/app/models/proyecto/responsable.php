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

class Responsable extends ActiveRecord {
    
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
     *  $this->has_many('Sacramentos_parroco');        
       * $this->has_many('menu');
       *
     */

        $this->validates_presence_of('cedula', 'message: Ingresa la cedula del responsable.');
         $min_cedula= 7;
         $this->validates_length_of('cedula', 11, $min_cedula, "too_short: La cedula debe tener <b>Minimo {$min_cedula} caracteres, verifique la cedula</b>");      
        $this->validates_presence_of('nombre', 'message: Ingresa el nombre del responsable.');
          $min_nombre = 4;
         $this->validates_length_of('nombre', 20, $min_nombre, "too_short: el nombre debe tener <b>Minimo {$min_nombre} caracteres</b>");
        $this->validates_presence_of('apellido', 'message: Ingresa el apellido del responsable.');
          $min_apellido = 4;
         $this->validates_length_of('apellido', 20, $min_apellido, "too_short: el apellido debe tener <b>Minimo {$min_apellido} caracteres</b>");
        $this->validates_presence_of('telefono', 'message: Ingresa el telefono del responsable.');
          $min_telefono = 11;
         $this->validates_length_of('telefono', 11, $min_telefono, "too_short: el telefono debe tener <b>Minimo {$min_telefono} caracteres, verifique el numero!</b>");
        $this->validates_presence_of('email', 'message: Ingresa el correo del responsable.');
        $this->validates_email_in('email', 'message: Debe escribir un <b>correo electronico</b> válido');
        $this->validates_presence_of('direccion', 'message: Ingresa la direccion del responsable.');
         $min_direccion = 4;
         $this->validates_length_of('direccion', 20, $min_direccion, "too_short: La direccion tener <b>Minimo {$min_direccion} caracteres, verifique la direccion</b>");          
    }
    


    public function getInformacionResponsable($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'responsable.*';
        $join = '';
        $condicion ="responsable.id = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 



    /**
     * Método para obtener el listado de los Apostolados del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */
    public function getListadoResponsable($estado='todos', $order='order.cedula.asc', $page=0) {                           
        $columns = 'responsable.*';

     
          $order = $this->get_order($order, 'cedula', array('responsable'=>array('ASC'=>'responsable.cedula ASC, responsable.nombre ASC, responsable.razon ASC, responsable.telefono ASC, responsable.email ASC, responsable.direccion ASC, responsable.observacion ASC',
      'DESC'=>'responsable.cedula DESC, responsable.nombre ASC, responsable.razon DESC, responsable.telefono DESC, responsable.email DESC, responsable.direccion DESC, responsable.observacion DESC'), 'descripcion'));
       if($page) {
          return $this->paginated("columns: $columns",  "order: $order", "page: $page");
        }
        return $this->find("columns: $columns", "order: $order");
    }
    
//   usa el  listadoselect para los listados desde la base de datos

         public function getListadoSelect($estado='todos', $order='order.id.asc', $page=0) {                           
        $columns = 'responsable.*';
        $order = $this->get_order($order, 'cedula', array('responsable'=>array('ASC'=>'responsable.cedula ASC, responsable.nombre ASC, responsable.apellido ASC', 'DESC'=>'responsable.cedula DESC, responsable.nombre DESC, responsable.apellido DES'),));
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
    public static function setResponsable($method, $data, $optData=null) {        
        $obj = new Responsable($data); //Se carga los datos con los de las tablas        
        //Se vecedulaica si contiene una data adicional para autocargar
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
        $this->cedula = Filter::get($this->cedula, 'string');
        $this->nombre = Filter::get($this->nombre, 'string');
        $this->apellido = Filter::get($this->apellido, 'string');
        $this->telefono = Filter::get($this->telefono, 'string');
        $this->email = Filter::get($this->email, 'string');
        $this->direccion = Filter::get($this->direccion, 'string');
        $this->observacion = Filter::get($this->observacion, 'string');
           
        $conditions = "cedula = '$this->cedula'";
        $conditions.= (isset($this->id)) ? " AND id != $this->id" : '';
        if($this->count("conditions: $conditions")) {
            DwMessage::error('Lo sentimos, pero ya existe un responsable registrado con el mismo nombre.');
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
        if($this->modulo=='sistema' OR ($this->Responsable == '*' && empty($this->controlador)) OR ($this->Responsable=='principal/*') ) {
            return 'cancel';
        }
    }
    
     public function getAjaxResponsable($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'responsable.* ';
        $order = $this->get_order($order, 'nombre', array(                        
             'cedula' => array(
                'ASC'=>'responsable.cedula ASC, responsable.cedula ASC', 
                'DESC'=>'responsable.cedula DESC, responsable.cedula DESC'
            ),
             'nombre' => array(
                'ASC'=>'responsable.nombre ASC, responsable.nombre ASC', 
                'DESC'=>'responsable.nombre DESC, responsable.nombre DESC'
                ), 
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombre','cedula');
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