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
Load::models('proyecto/responsable');

class ResponsableController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Responsable';
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
    public function listar($order='order.cedula.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $responsable = new Responsable
();
        $this->responsables = $responsable->getListadoResponsable('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de responsables del proyecto ';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('responsable')) {
            if(Responsable::setResponsable('create', Input::post('responsable'))) {
                DwMessage::valid('El responsable se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar responsable';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_responsable', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $responsable = new Responsable();
        if(!$responsable->getInformacionResponsable($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('responsable') && DwSecurity::isValidKey(Input::post('responsable_id_key'), 'form_key')) {
            if(Responsable::setResponsable
('update', Input::post('responsable'))){
                DwMessage::valid('El responsable se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->responsable = $responsable;
        $this->page_title = 'Actualizar responsable';        
    }
    
    /**
     * Método para inactivar/reactivar
     */
        public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_responsable', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $responsable = new Responsable();
        if(!$responsable->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $responsable->estado == Responsable::INACTIVO) {
                DwMessage::info('El responsable ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $responsable->estado == Responsable::ACTIVO) {
                DwMessage::info('El responsable ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Responsable::INACTIVO : Responsable::ACTIVO;
                if(Responsable::setResponsable('update', $responsable->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Responsable::ACTIVO) ? DwMessage::valid('El responsable se ha reactivado correctamente!') : DwMessage::valid('El responsable se ha inactivado correctamente!');
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
        $responsable = new Responsable();
        $responsables = $responsable->getAjaxResponsable($field, $value, $order, $page);
        if(empty($responsables->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->responsables = $responsables;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda del responsable del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Responsable', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Responsables = new Responsables();
        if(!$Responsable->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Responsable->delete()) {
                DwMessage::valid('El responsable se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero este responsable no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Este responsable no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}