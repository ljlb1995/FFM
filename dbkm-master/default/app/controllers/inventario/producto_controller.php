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
Load::models('inventario/producto');

class ProductoController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Producto';
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
    public function listar($order='order.idproducto.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $producto = new Producto ();
        $this->productos = $producto->getListadoProducto('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de productos ';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('producto')) {
            if(Producto::setProducto('create', Input::post('producto'))) {
                DwMessage::valid('El producto se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar producto';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$idproducto = DwSecurity::isValidKey($key, 'upd_producto', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $producto = new Producto();
        if(!$producto->getInformacionProducto($idproducto)) {            
            DwMessage::get('idproducto_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('producto') && DwSecurity::isValidKey(Input::post('producto_idproducto_key'), 'form_key')) {
            if(Producto::setProducto('update', Input::post('producto'))){
                DwMessage::valid('El producto se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        
        $this->producto = $producto;
        $this->page_title = 'Actualizar producto';        
    }
    
    /**
     * Método para inactivar/reactivar
     */
        public function estado($tipo, $key) {
        if(!$idproducto = DwSecurity::isValidKey($key, $tipo.'producto', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $producto = new Producto();
        if(!$producto->find_first($idproducto)) {
            DwMessage::get('idproducto_no_found');            
        } else {
            if($tipo=='inactivar' && $producto->estado == Producto::INACTIVO) {
                DwMessage::info('El producto ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $producto->estado == Producto::ACTIVO) {
                DwMessage::info('El producto ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Producto::INACTIVO : Producto::ACTIVO;
                if(Producto::setProducto('update', $producto->to_array(), array('idproducto'=>$idproducto, 'estado'=>$estado))){
                    ($estado==Producto::ACTIVO) ? DwMessage::valid('El producto se ha reactivado correctamente!') : DwMessage::valid('El producto se ha inactivado correctamente!');
                }
            }                
        }
        
        return DwRedirect::toAction('listar');
    }
    public function buscar($field='producto', $value='none', $order='order.idproducto.asc', $page=1) {        
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $field = (Input::hasPost('producto')) ? Input::post('producto') : $field;
        $value = (Input::hasPost('producto')) ? Input::post('value') : $value;
        $value = strtoupper($value);
        $producto = new Producto();
        $productos = $producto->getAjaxProducto($field, $value, $order, $page);
        if(empty($producto->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->producto = $producto;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda del producto del sistema';        
    }
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$idproducto = DwSecurity::isValidKey($key, 'eliminar_Responsable', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $producto = new Producto();
        if(!$Producto->find_first($idproducto)) {
            DwMessage::get('idproducto_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Producto->delete()) {
                DwMessage::validproducto('El producto se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero este producto no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Este producto no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}