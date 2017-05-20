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
Load::models('config/subgrupo', 'config/grupo');

class SubgrupoController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Subgrupos';
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
        $subgrupo = new Subgrupo();
        $this->subgrupos = $subgrupo->getListadoSubgrupos('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de Subgrupos';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('subgrupo')) {
            if(Subgrupo::setSubgrupo('create', Input::post('subgrupo'))) {
                DwMessage::valid('El subgrupo se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar Subgrupo';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_subgrupo', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $subgrupo = new Subgrupo();
        if(!$subgrupo->getInformacionSubgrupo($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('subgrupo') && DwSecurity::isValidKey(Input::post('subgrupo_id_key'), 'form_key')) {
            if(Subgrupo::setSubgrupo('update', Input::post('subgrupo'))){
                DwMessage::valid('El subgrupo se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->subgrupo = $subgrupo;
        $this->page_title = 'Actualizar subgrupo';        
    }
    
    
    /**
     * Método para inactivar/reactivar
     */
    public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_subgrupo', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $subgrupo = new Subgrupo();
        if(!$subgrupo->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $subgrupo->estado == Subgrupo::INACTIVO) {
                DwMessage::info('El subgrupo ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $subgrupo->estado == Subgrupo::ACTIVO) {
                DwMessage::info('El subgrupo ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Subgrupo::INACTIVO : Subgrupo::ACTIVO;
                if(Subgrupo::setSubgrupo('update', $subgrupo->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Subgrupo::ACTIVO) ? DwMessage::valid('El subgrupo se ha reactivado correctamente!') : DwMessage::valid('El subgrupo se ha inactivado correctamente!');
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
        $subgrupo = new Subgrupo();
        $subgrupos = $subgrupo->getAjaxSubgrupos($field, $value, $order, $page);
        if(empty($subgrupos->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->subgrupos = $subgrupos;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda del subgrupo del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Subgrupo', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Subgrupos = new Subgrupos();
        if(!$Subgrupos->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Subgrupos->delete()) {
                DwMessage::valid('El subgrupo se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero este subgrupo no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Este subgrupo no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}