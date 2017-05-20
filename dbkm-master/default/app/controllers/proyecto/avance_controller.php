<?php
/**
 * Dailyscript - Web | App | Media
 *
 * Descripcion: Controlador que se encarga de la gestión de los Apostoladoss del sistema
 *
 * @category    
 * @package     Controllers 
 * @author      Iván D. Meléndez (ivan.melendez@dailycript.com.co)
 * @copyright   Copyright (c) 2013 Dailyscript Team (http://www.dailyscript.com.co)
 */
Load::models('proyecto/avance');

class AvanceController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Avance';
    }
    
    /**
     * Método principal
     */
    public function index() {
        DwRedirect::toAction('listar');
    }
    
    /**
     * Método para listar
     */
    public function listar($order='order.idproyecto.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $avance = new Avance
();
        $this->avances = $avance->getListadoAvance('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de avances del proyecto ';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('avance')) {
            if(Avance::setAvance('create', Input::post('avance'))) {
                DwMessage::valid('El avance se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar avance';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_avance', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $avance = new Avance();
        if(!$avance->getInformacionAvance($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('avance') && DwSecurity::isValidKey(Input::post('avance_id_key'), 'form_key')) {
            if(Avance::setAvance('update', Input::post('avance'))){
                DwMessage::valid('El avance se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->avance = $avance;
        $this->page_title = 'Actualizar avance';        
    }
    
    /**
     * Método para inactivar/reactivar
     */
        public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_avance', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $avance = new Avance();
        if(!$avance->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $avance->estado == Avance::INACTIVO) {
                DwMessage::info('El avance ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $avance->estado == Avance::ACTIVO) {
                DwMessage::info('El avance ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Avance::INACTIVO : Avance::ACTIVO;
                if(Avance::setAvance('update', $avance->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Avance::ACTIVO) ? DwMessage::valid('El avance se ha reactivado correctamente!') : DwMessage::valid('El avance se ha inactivado correctamente!');
                }
            }                
        }
        
        return DwRedirect::toAction('listar');
    }
    public function buscar($field='sucursal', $value='none', $order='order.id.asc', $page=1) {        
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $field = (Input::hasPost('field')) ? Input::post('field') : $field;
        $value = (Input::hasPost('field')) ? Input::post('value') : $value;
        $value = strtoupper($value);
        $avance = new Avance();
        $avance = $avance->getAjaxAvance($field, $value, $order, $page);
        if(empty($avances->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->avances = $avances;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda del avance del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Avance', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Avances = new Avances();
        if(!$Avance->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Avance->delete()) {
                DwMessage::valid('El avance se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero este avance no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Este avance no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}