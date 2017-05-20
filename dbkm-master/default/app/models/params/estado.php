<?php
/**
 * 
 *
 * Clase que gestiona lo relacionado con los paises
 *
 * @category    Parámetros
 * @package     Models
 * @author      Javier León (jel1284@gmail.com)
 * @copyright   Copyright (c) 2014 Arroz del Alba 
 */

class Estado extends ActiveRecord {

    /**
     * Método contructor
     */
    public function initialize() {
        $this->has_many('empresa');
        $this->has_many('persona');
                
    }

    /**
     * Método para listar los tipos de identificación
     * @return array
     */
    public function getListadoEstado() {
        return $this->find('order: nombreEstado ASC');
    }

    
public function obtener_estados($estado) {
        if ($estado != '') {
            $estado = stripcslashes($estado);
            $res = $this->find('columns: nombreEstado', "nombreEstado like '%{$estado}%'");
            if ($res) {
                foreach ($res as $estado) {
                    $estados[] = $estado->nombreEstado;
                }
                return $estados;
            }
        }
        return array('no hubo coincidencias');
    }
}
?>
