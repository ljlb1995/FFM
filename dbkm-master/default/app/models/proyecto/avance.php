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

class Avance extends ActiveRecord {
    
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

        $this->validates_presence_of('idproyecto', 'message: Ingresa el idproyecto del proyecto.');
         $min_idproyecto= 6;
         
        $this->validates_presence_of('nombre', 'message: Ingresa el nombre del avance.');
          $min_nombre = 4;
         $this->validates_length_of('nombre', 20, $min_nombre, "too_short: el nombre debe tener <b>Minimo {$min_nombre} caracteres</b>");
        $this->validates_presence_of('apellido', 'message: Ingresa el apellido del avance.');
          $min_apellido = 2;
         $this->validates_length_of('apellido', 20, $min_apellido, "too_short: el apellido debe tener <b>Minimo {$min_apellido} caracteres</b>");
        $this->validates_presence_of('telefono', 'message: Ingresa el telefono del avance.');
          $min_telefono = 11;
         $this->validates_length_of('telefono', 11, $min_telefono, "too_short: el telefono debe tener <b>Minimo {$min_telefono} caracteres, verifique el numero!</b>");
        $this->validates_presence_of('email', 'message: Ingresa el correo del avance.');
        $this->validates_email_in('email', 'message: Debe escribir un <b>correo electronico</b> válido');
        $this->validates_presence_of('direccion', 'message: Ingresa la direccion del avance.');
         $min_direccion = 4;
         $this->validates_length_of('direccion', 20, $min_direccion, "too_short: La direccion tener <b>Minimo {$min_direccion} caracteres, verifique la direccion</b>");          
    }
    


    public function getInformacionAvance($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'avance.*';
        $join = '';
        $condicion ="avance.id = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 



    /**
     * Método para obtener el listado de los Apostolados del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */
    public function getListadoAvance($estado='todos', $order='order.idproyecto.asc', $page=0) {                           
        $columns = 'avance.*';

     
          $order = $this->get_order($order, 'idproyecto', array('avance'=>array('ASC'=>'avance.idproyecto ASC, avance.nombre ASC, avance.razon ASC, avance.telefono ASC, avance.email ASC, avance.direccion ASC, avance.observacion ASC',
                                                                        'DESC'=>'avance.idproyecto DESC, avance.nombre ASC, avance.razon DESC, avance.telefono DESC, avance.email DESC, avance.direccion DESC, avance.observacion DESC'),
                                                            'descripcion'));
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
    public static function setAvance($method, $data, $optData=null) {        
        $obj = new Avance($data); //Se carga los datos con los de las tablas        
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
       $this->idproyecto = Filter::get($this->idproyecto, 'string');
        $this->nombre = Filter::get($this->nombre, 'string');
         $this->razon = Filter::get($this->razon, 'string');
         $this->telefono = Filter::get($this->telefono, 'string');
         $this->email = Filter::get($this->email, 'string');
         $this->direccion = Filter::get($this->direccion, 'string');
         $this->observacion = Filter::get($this->observacion, 'string');
           
        $conditions = "idproyecto = '$this->idproyecto'";
        $conditions.= (isset($this->id)) ? " AND id != $this->id" : '';
        if($this->count("conditions: $conditions")) {
            DwMessage::error('Lo sentimos, pero ya existe un avance registrado con el mismo nombre.');
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
        if($this->modulo=='sistema' OR ($this->Avance == '*' && empty($this->controlador)) OR ($this->Avance=='principal/*') ) {
            return 'cancel';
        }
    }
    
     public function getAjaxAvance($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'avance.* ';
        $order = $this->get_order($order, 'nombre', array(                        
             'idproyecto' => array(
                'ASC'=>'avance.idproyecto ASC, avance.idproyecto ASC', 
                'DESC'=>'avance.idproyecto DESC, avance.idproyecto DESC'
            ),
             'nombre' => array(
                'ASC'=>'avance.nombre ASC, avance.nombre ASC', 
                'DESC'=>'avance.nombre DESC, avance.nombre DESC'
                ), 
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombre','idproyecto');
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