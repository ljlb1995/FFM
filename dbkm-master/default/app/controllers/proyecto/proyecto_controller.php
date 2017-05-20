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
Load::models('proyecto/proyecto');
Load::models('params/estado', 'params/municipio');


class ProyectoController extends BackendController {
    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Proyecto';
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
        $proyecto = new Proyecto ();
        $this->proyectos = $proyecto->getListadoProyecto('todos', $order, $page);                
        $this->order = $order;        
        $this->page_title = 'Listado de proyectos ';
    }
    
    /**
     * Método para agregar
     */
    public function agregar() {
         if(Input::hasPost('proyecto')) {
            if(Proyecto::setProyecto('create', Input::post('proyecto'))) {
                DwMessage::valid('El proyecto se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        $this->page_title = 'Agregar proyecto';
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
           if(!$idproyecto = DwSecurity::isValidKey($key, 'upd_proyecto', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $proyecto = new Proyecto();
        if(!$proyecto->getInformacionProyecto($idproyecto)) {            
            DwMessage::get('idproyecto_no_found');
            return DwRedirect::toAction('listar');
        }
        
        if(Input::hasPost('proyecto') && DwSecurity::isValidKey(Input::post('proyecto_idproyecto_key'), 'form_key')) {
            if(Proyecto::setProyecto('update', Input::post('proyecto'))){
                DwMessage::valid('El proyecto se ha actualizado correctamente!');
                return DwRedirect::toAction('listar');
            }
        } 
        
        $this->proyecto = $proyecto;
        $this->page_title = 'Actualizar proyecto';        
    }
    
    /**
     * Método para inactivar/reactivar
     */
        public function estado($tipo, $key) {
        if(!$idproyecto = DwSecurity::isValidKey($key, $tipo.'proyecto', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $proyecto = new Proyecto();
        if(!$proyecto->find_first($idproyecto)) {
            DwMessage::get('idproyecto_no_found');            
        } else {
            if($tipo=='inactivar' && $proyecto->estado == Proyecto::INACTIVO) {
                DwMessage::info('El proyecto ya se encuentra inactivo');
            } else if($tipo=='reactivar' && $proyecto->estado == Proyecto::ACTIVO) {
                DwMessage::info('El proyecto ya se encuentra activo');
            } else {
                $estado = ($tipo=='inactivar') ? Proyecto::INACTIVO : Proyecto::ACTIVO;
                if(Proyecto::setProyecto('update', $proyecto->to_array(), array('idproyecto'=>$idproyecto, 'estado'=>$estado))){
                    ($estado==Proyecto::ACTIVO) ? DwMessage::valid('El proyecto se ha reactivado correctamente!') : DwMessage::valid('El proyecto se ha inactivado correctamente!');
                }
            }                
        }
        
        return DwRedirect::toAction('listar');
    }
    public function buscar($field='proyecto', $value='none', $order='order.idproyecto.asc', $page=1) {        
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $field = (Input::hasPost('proyecto')) ? Input::post('proyecto') : $field;
        $value = (Input::hasPost('proyecto')) ? Input::post('value') : $value;
        $value = strtoupper($value);
        $proyecto = new Proyecto();
        $proyectos = $proyecto->getAjaxProyecto($field, $value, $order, $page);
        if(empty($proyecto->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->proyecto = $proyecto;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda del proyecto del sistema';        
    }


    /**
     * Método para formar el reporte en pdf 
     */
    public function reporteproyecto($key) { 
        View::template(NULL);       
        if(!$id = DwSecurity::isValidKey($key, 'shw_Proyecto', 'int')) {
            return DwRedirect::toAction('listar');
        }
        $proyecto=new Proyecto();
        $this->nombre = strtoupper($proyecto->nombreproyecto);
                $this->nombreproyecto = strtoupper($proyecto->nombreproyecto);

       /** $proyecto=new Proyecto();
        if(!$proyecto->getInformacionProyecto($id)) {
            DwMessage::get('id_no_found');
        }
        $this->nombreproyecto = strtoupper($proyecto->nombre1." ".$titular->nombre2);
        $this->apellidos = strtoupper($titular->apellido1." ".$titular->apellido2);
        if($titular->nacionalidad=="V"){ $this->nacionalidad = "VENEZOLANO"; } else { $this->nacionalidad ="EXTRANJERO"; }
        $this->cedula = $titular->cedula;
        $this->sexo = $titular->sexo;        $this->fecha_nac = $titular->fecha_nacimiento;
        $this->estado = strtoupper($titular->esta2);
        $this->municipio = strtoupper($titular->municipio);
        $this->estado_civil = strtoupper($titular->estado_civil);
        switch ($this->estado_civil) {
            case 'S':
                $this->estado_civil="SOLTERO(A)";
                break;
            case 'C':
                $this->estado_civil="CASADO(A)";
                break;
            case 'D':
                $this->estado_civil="DIVORCIADO(A)";
                break;
            case 'c':
                $this->estado_civil="CONCUBINATO";
                break;
            case 'V':
                $this->estado_civil="VIUDO(A)";
                break;
        }
        $this->telefono = $titular->telefono;
        $this->celular = $titular->celular;
        $this->direccion = strtoupper($titular->direccion_habitacion);
        $this->observacion = strtoupper($titular->observacion);
        $this->correo_electronico = strtoupper($titular->correo_electronico);
        if (strlen($this->fecha_nac)==10)
        {
            $elDia=substr($this->fecha_nac,8,2);
            $elMes=substr($this->fecha_nac,5,2);
            $elYear=substr($this->fecha_nac,0,4);
            $FechaNac=$elDia."/".$elMes."/".$elYear;        
        }
        $this->edadA = $this->tiempo_transcurrido($FechaNac);
        $this->edad = $this->edadA[0];

        
        //llamada a otra funcion, ya que no logre un solo query para ese reportee! :S
        $datosdireccion = $titular->getInformacionDireccionTitular($id);
        $this->hestado = strtoupper($titular->hestado);
        $this->hparroquia = strtoupper($titular->hparroquia);
        $this->hpais = strtoupper($titular->hpais);

        //llamada a otra funcion, ya que no logre un solo query para ese reportee! :S
        $datoslaborales = $titular->getInformacionLaboralTitular($id);

        $this->upsa = $titular->sucursal;
        $this->direccionlaboral = strtoupper($titular->direccion);
        $this->municipio_laboral = strtoupper($titular->municipios);
        $this->estado_laboral = strtoupper($titular->estados);
        $this->pais_laboral = strtoupper($titular->paiss);
        $this->cargo = strtoupper($titular->cargo);

        //instanciando la clase beneficiario 
        $beneficiario = new beneficiario();
        $this->beneficiarios = $beneficiario->getListadoBeneTitular($id);
    */
    }





    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$idproyecto = DwSecurity::isValidKey($key, 'eliminar_Responsable', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $proyecto = new Proyecto();
        if(!$Proyecto->find_first($idproyecto)) {
            DwMessage::get('idproyecto_no_found');
            return DwRedirect::toAction('listar');
        }              
        try {
            if($Proyecto->delete()) {
                DwMessage::validproyecto('El proyecto se ha eliminado correctamente!');
            } else {
                DwMessage::warning('Lo sentimos, pero este proyecto no se puede eliminar.');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Este proyecto no se puede eliminar porque se encuentra relacionado con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
    
}