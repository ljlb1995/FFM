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
Load::models('inventario/proveedor');

class ProveedorController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Proveedor';
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
    public function listar($order='order.rif.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $proveedor = new Proveedor
();
        $this->proveedores = $proveedor->getListadoProveedores('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de Proveedores ';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('proveedor')) {
            if(Proveedor::setProveedor('create', Input::post('proveedor'))) {
                DwMessage::valid('El Proveedor se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar Proveedor';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$id = DwSecurity::isValidKey($key, 'upd_proveedor', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $proveedor = new Proveedor();
        if(!$proveedor->getInformacionProveedor($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('proveedor') && DwSecurity::isValidKey(Input::post('proveedor_id_key'), 'form_key')) {
            if(Proveedor::setProveedor
('update', Input::post('proveedor'))){
                DwMessage::valid('El Proveedor se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        //$this->ciudades = Load::model('params/ciudad')->getCiudadesToJson();
        $this->proveedor = $proveedor;
        $this->page_title = 'Actualizar Proveedor';        
    }
    
    /**
     * Método para inactivar/reactivar
     */
        public function estado($tipo, $key) {
        if(!$id = DwSecurity::isValidKey($key, $tipo.'_proveedor', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $proveedor = new Proveedor();
        if(!$proveedor->find_first($id)) {
            DwMessage::get('id_no_found');            
        } else {
            if($tipo=='inactivar' && $proveedor->estado == Proveedor::INACTIVO) {
                DwMessage::info('El proveedor ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $proveedor->estado == Proveedor::ACTIVO) {
                DwMessage::info('El proveedor ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Proveedor::INACTIVO : Proveedor::ACTIVO;
                if(Proveedor::setProveedor('update', $proveedor->to_array(), array('id'=>$id, 'estado'=>$estado))){
                    ($estado==Proveedor::ACTIVO) ? DwMessage::valid('El proveedor se ha reactivado correctamente!') : DwMessage::valid('El proveedor se ha inactivado correctamente!');
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
        $proveedor = new Proveedor();
        $proveedores = $proveedor->getAjaxProveedores($field, $value, $order, $page);
        if(empty($proveedores->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->proveedores = $proveedores;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda de proveedores del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'eliminar_Proveedores', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $Proveedores = new Proveedores();
        if(!$Apostolados->find_first($id)) {
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Proveedores->delete()) {
                DwMessage::valid('El Proveedor se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero este Proveedor no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Este Proveedor no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}