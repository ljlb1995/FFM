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

class Proyecto extends ActiveRecord {
    
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

        $this->validates_presence_of('idproyecto', 'message: Ingresa el codigo del proyecto.');
      
        $this->validates_presence_of('nombreproyecto', 'message: Ingresa el nombre del Proyecto.');
          $min_nombre = 4;
         $this->validates_length_of('nombreproyecto', 120, $min_nombre, "too_short: el nombre debe tener <b>Minimo {$min_nombre} caracteres</b>");
      
    }
    


    public function getInformacionProyecto($id, $isSlug=false) {
        $idproyecto = ($isSlug) ? Filter::get($idproyecto, 'string') : Filter::get($idproyecto, 'string');
        $columnas = 'proyecto.*';
        $join = '';
        $condicion ="proyecto.responsableuno = '$cedula'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 

    /**
     * Método para obtener el listado  del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */


    public function getListadoProyecto($estado='todos', $order='order.idproyecto.asc', $page=0) {                           
        $columns = 'proyecto.idproyecto, proyecto.nombreproyecto, proyecto.canttotal, proyecto.direccion, proyecto.fechai, concat( responsable.nombre, responsable.apellido ) AS ingeniero, proyecto.estado';
        $join = 'INNER JOIN responsable on responsable.id=proyecto.responsableuno';
        $order = $this->get_order($order, 'idproyecto', array('proyecto'=>array('ASC'=>'proyecto.idproyecto ASC, proyecto.nombreproyecto ASC, proyecto.cantfamiliar ASC, proyecto.cantbifamiliar ASC, proyecto.canttetra ASC, proyecto.canttotal ASC, proyecto.idciudad ASC,ingeniero ASC',
      'DESC'=>'proyecto.idproyecto DESC, proyecto.nombreproyecto ASC, proyecto.cantfamiliar DESC, proyecto.cantbifamiliar DESC, proyecto.canttetra DESC, proyecto.canttotal DESC, proyecto.idciudad DESC, ingeniero DESC'), 'descripcion'));
       if($page) {
          return $this->paginated("columns: $columns",  "join: $join", "order: $order", "page: $page");
        }
        return $this->find("columns: $columns","join: $join", "order: $order");
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
    public static function setProyecto($method, $data, $optData=null) {        
        $obj = new Proyecto($data); //Se carga los datos con los de las tablas        
        //Se vecedulaica si contiene una data adicional para autocargar
        if ($optData) {
            $obj->dump_result_self($optData);
        }   
        if($method!='delete') {
                   
        }
        $check = false;
        
        if($check) { //Si existe
            if(empty($obj->idproyecto)) {
                $obj->idproyecto = $old->idproyecto; //Asigno el id del encontrado al nuevo
            } else { //Si se actualiza y existe otro con la misma información
                if($obj->idproyecto != $old->idproyecto) {
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
        $this->idproyecto = Filter::get($this->idproyecto, 'numeric');
        $this->nombreproyecto = Filter::get($this->nombreproyecto, 'string');
        $this->cantfamiliar = Filter::get($this->cantfamiliar, 'numeric');
        $this->cantbifamiliar = Filter::get($this->cantbifamiliar, 'numeric');
        $this->canttetra = Filter::get($this->canttetra, 'numeric');
        $this->canttotal = Filter::get($this->canttotal, 'numeric');
        $this->fechai = Filter::get($this->fechai, 'numeric');
        $this->idciudad = Filter::get($this->idciudad, 'numeric');
        $this->direccion = Filter::get($this->direccion, 'string');
        $this->responsableuno = Filter::get($this->responsableuno, 'numeric');
        $this->responsabledos = Filter::get($this->responsabledos, 'numeric');
        $this->responsabletres = Filter::get($this->responsabletres, 'numeric');
           
            $conditions = "idproyecto = '$this->idproyecto'";
            $conditions.= (isset($this->idproyecto)) ? " AND idproyecto != $this->idproyecto" : "idproyecto";
            if($this->count("conditions: $conditions")) {
                DwMessage::error('lo sentimos, ya existe un proyecto con ese codigo, intente con otro codigo');
               
            }
        
    }
    
    /**
     * Callback que se ejecuta antes de eliminar
     */
    public function before_delete() {
        if($this->idproyecto <= 16) {
            return 'cancel';
        }
        if($this->modulo=='sistema' OR ($this->Proyecto == '*' && empty($this->controlador)) OR ($this->Proyecto=='principal/*') ) {
            return 'cancel';
        }
    }
    
     public function getAjaxProyecto($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'proyecto.* ';
        $order = $this->get_order($order, 'nombreproyecto', array(                        
             'idproyecto' => array(
                'ASC'=>'proyecto.idproyecto ASC, proyecto.idproyecto ASC', 
                'DESC'=>'proyecto.idproyecto DESC, proyecto.idproyecto DESC'
            ),
             'nombre' => array(
                'ASC'=>'proyecto.nombreproyecto ASC, proyecto.nombreproyecto ASC', 
                'DESC'=>'proyecto.nombreproyecto DESC, proyecto.nombreproyecto DESC'
                ), 
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombreproyecto','idproyecto');
        if(!in_array($field, $fields)) {
            $field = 'nombreproyecto';
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