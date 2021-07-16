<?php

require_once('model.php');

class UserModel extends Model {

    /**
     * @param $username
     * Trae toda la info de usuarix que coincida con el nombre pasado por parametro.
     */
    public function getUserByUsername($username) {
        $query = $this->getDb()->prepare('SELECT * FROM `user` WHERE nombre = ?');
        $query->execute(array(($username)));
        return $query->fetch(PDO::FETCH_OBJ);
    }

     /**
     * @param $user $name
     * Cargo usuarix en la base de datos
     */
    public function add($user, $pass) {
        //encripto la contraseña
        $passEnc = password_hash($pass, PASSWORD_DEFAULT);
        
        $query = $this->getDb()->prepare("INSERT INTO user (nombre, password, admin) VALUES (?, ?, ?)");
        $query->execute([$user, $passEnc, 1]);

    }

    /**
     * Retorna todxs lxs usuarixs almacenadxs en la tabla paises
     */
    public function obtenerUsuarixs() {
        $query = $this->getDb()->prepare('SELECT * FROM user ORDER BY nombre ASC');
        $query->execute(array());
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

     /**
     * Obtengo el rol del usuarix, si es admin devuelve true, sino devuelve false.
     */
    public function obtenerRol($id) {
        $query = $this->getDb()->prepare('SELECT * FROM user WHERE id = ? AND admin = ?');
        $query->execute([$id, 2]);
        $admin = $query->fetchAll(PDO::FETCH_OBJ);

        if ($admin) {
           return true;
        } else {
            return false;
        }
    }

    /**
     * @param $id
     * Elimina un usuarix en base al id pasado por parámetro
     */
    public function eliminar($id){
        $query = $this->getDb()->prepare('DELETE FROM user WHERE id = ?');
        $query->execute([$id]);
    }

     /**
     * @param $id
     * Edita permiso de usuarix en base el id y el rol pasado por parámetro
     */
    public function editarPermisos($id, $rol){
        $query = $this->getDb()->prepare('UPDATE user SET admin = ? WHERE id = ?');
        $query->execute([$rol, $id]);
    }


}