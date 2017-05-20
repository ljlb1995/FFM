<?php
/**
 * Dailyscript - Web | App | Media
 *
 * Descripcion: Controlador que se encarga de la gestión de los Sacramentoss del sistema
 *
 * @category    
 * @package     Controllers 
 * @author      Iván D. Meléndez (ivan.melendez@dailycript.com.co)
 * @copyright   Copyright (c) 2013 Dailyscript Team (http://www.dailyscript.com.co)
 */
Load::models('config/unidad');

class UnidadController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Unidades';
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
    public function listar($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $unidad = new Unidad();
        $this->unidades = $unidad->getListadoUnidades('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de Unidades';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('unidad')) {
            if(Unidad::setUnidad('create', Input::post('unidad'))) {
                DwMessage::valid('La unidad se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar Unidad';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_unidad', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $unidad = new Unidad();
        if(!$unidad->getInformacionUnidad($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('unidad') && DwSecurity::isValidKey(Input::post('unidad_id_key'), 'form_key')) {
            if(Unidad::setUnidad('update', Input::post('unidad'))){
                DwMessage::valid('La unidad se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->unidad = $unidad;
        $this->page_title = 'Actualizar unidad';        
    }
    
    
    /**
     * Método para inactivar/reactivar
     */
    public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_unidad', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $unidad = new Unidad();
        if(!$unidad->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $unidad->estado == Unidad::INACTIVO) {
                DwMessage::info('La unidad ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $unidad->estado == Unidad::ACTIVO) {
                DwMessage::info('La unidad ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Unidad::INACTIVO : Unidad::ACTIVO;
                if(Unidad::setUnidad('update', $unidad->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Unidad::ACTIVO) ? DwMessage::valid('La unidad se ha reactivado correctamente!') : DwMessage::valid('La unidad se ha inactivado correctamente!');
                }
            }                
        }
        
        return DwRedirect::toAction('listar');
    }
      /**
     * Método para buscar
     */
    public function buscar($field='sucursal', $value='none', $order='order.id.asc', $page=1) {        
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $field = (Input::hasPost('field')) ? Input::post('field') : $field;
        $value = (Input::hasPost('field')) ? Input::post('value') : $value;
        $value = strtoupper($value);
        $unidad = new Unidad();
        $unidades = $unidad->getAjaxUnidades($field, $value, $order, $page);
        if(empty($unidades->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->unidades = $unidades;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda de sacramentos del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Unidades', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Unidades = new Unidades();
        if(!$Unidades->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Unidades->delete()) {
                DwMessage::valid('La unidad se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero esta unidad no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Esta unidad no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}