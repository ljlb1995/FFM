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
Load::models('inventario/entrada');

class EntradaController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Entrada';
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
    public function listar($order='order.id.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $entrada = new Entrada
();
        $this->entradas = $entrada->getListadoEntradas('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de Entradas ';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('entrada')) {
            if(Entrada::setEntrada('create', Input::post('entrada'))) {
                DwMessage::valid('La Entrada se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar Entrada';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_entrada', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $entrada = new Entrada();
        if(!$entrada->getInformacionEntrada($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('entrada') && DwSecurity::isValidKey(Input::post('entrada_id_key'), 'form_key')) {
            if(Entrada::setEntrada
('update', Input::post('entrada'))){
                DwMessage::valid('La Entrada se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->entrada = $entrada;
        $this->page_title = 'Actualizar Entrada';        
    }
    
    /**
     * Método para inactivar/reactivar
     */
        public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_entrada', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $entrada = new Entrada();
        if(!$entrada->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $entrada->estado == Entrada::INACTIVO) {
                DwMessage::info('La entrada ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $entrada->estado == Entrada::ACTIVO) {
                DwMessage::info('La entrada ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Entrada::INACTIVO : Entrada::ACTIVO;
                if(Entrada::setEntrada('update', $entrada->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Entrada::ACTIVO) ? DwMessage::valid('La Entrada se ha reactivado correctamente!') : DwMessage::valid('La Entrada se ha inactivado correctamente!');
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
        $entrada = new Entrada();
        $entradas = $entrada->getAjaxEntradaes($field, $value, $order, $page);
        if(empty($entradas->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->entradas = $entradas;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda de entradas del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Entradaes', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Entradaes = new Entradaes();
        if(!$Apostolados->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Entradaes->delete()) {
                DwMessage::valid('La Entrada se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero esta Entrada no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Esta Entrada no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}