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

class Ciudad extends ActiveRecord {
    
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
    
    public function getInformacionCiudad($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'ciudad.*';
        $join = '';
        $condicion ="ciudad.id_ciudad = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 

    /**
     * Método para obtener el listado de los Sacramentoss del sistema
     * @param type $estado
     * @param type $order
     * @param type $page
     * @return type
     */
    public function getListadoCiudad($estado='todos', $order='order.ciudad.asc', $page=0) {                           
        $order = $this->get_order($order, 'ciudad');
        if($page) {
            return $this->paginated("order: $order", "page: $page");
        } else {
            return $this->find("order: $order");
        }      
    }
    
      /**
     * Método para obtener las parroquias como json
     * @return type
     */
    public function getCiudadToJson() {
        $rs =  $this->find("columns: ciudad", 'group: ciudad', 'order: ciudad ASC');
        $ciudades = array();
        foreach($rs as $ciudad) {            
            $ciudades[] = $ciudad->ciudad; 
        }
        return json_encode($ciudades);
    }

    public function buscar($municipio_id){
        return $this->find("municipio_id = $municipio_id", 'order: nombre');
    }
 
    
}
?>