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
Load::models('config/grupo');

class GrupoController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Grupos';
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
        $grupo = new Grupo();
        $this->grupos = $grupo->getListadoGrupos('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de Grupos';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('grupo')) {
            if(Grupo::setGrupo('create', Input::post('grupo'))) {
                DwMessage::valid('El grupo se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar Grupo';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_grupo', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $grupo = new Grupo();
        if(!$grupo->getInformacionGrupo($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('grupo') && DwSecurity::isValidKey(Input::post('grupo_id_key'), 'form_key')) {
            if(Grupo::setGrupo('update', Input::post('grupo'))){
                DwMessage::valid('El grupo se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->grupo = $grupo;
        $this->page_title = 'Actualizar grupo';        
    }
    
    
    /**
     * Método para inactivar/reactivar
     */
    public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_grupo', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $grupo = new Grupo();
        if(!$grupo->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $grupo->estado == Grupo::INACTIVO) {
                DwMessage::info('El grupo ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $grupo->estado == Grupo::ACTIVO) {
                DwMessage::info('El grupo ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Grupo::INACTIVO : Grupo::ACTIVO;
                if(Grupo::setGrupo('update', $grupo->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Grupo::ACTIVO) ? DwMessage::valid('El grupo se ha reactivado correctamente!') : DwMessage::valid('El grupo se ha inactivado correctamente!');
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
        $grupo = new Grupo();
        $grupos = $grupo->getAjaxGrupos($field, $value, $order, $page);
        if(empty($grupos->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->grupos = $grupos;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda del grupo del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Grupo', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Grupos = new Grupos();
        if(!$Grupos->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Grupos->delete()) {
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