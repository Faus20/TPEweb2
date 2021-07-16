<?php
require_once('model.php');

//Las clases siempre empiezan con mayusculas
class DestinosModel extends Model
{

    /**
     * @return array
     * Retorna todos los destinos almacenados en la tabla destinos
     */
    public function obtenerTodos()
    {
        $query = $this->getDb()->prepare('SELECT * FROM destinos ORDER BY id DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $id
     * @return array
     * Retorna toda la info de un destino que coincida con el id.
     */
    public function obtener($id)
    {
        $query = $this->getDb()->prepare('SELECT * FROM destinos WHERE id = ?');
        $query->execute(array($id));

        return $query->fetch(PDO::FETCH_OBJ);
    }

    /**
     * @param $id
     * @return array
     * Retorna todos los destinos que compartan el id_pais($id).
     */
    public function obtenerTodosId($id)
    {
        $query = $this->getDb()->prepare('SELECT * FROM destinos WHERE id_pais = ? ORDER BY nombre ASC');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $nombre
     * @return array
     * Retorna todos los destinos que coincidad con el parametro
     */
    public function obtenerPorNombre($nombre)
    {
        $nombre =  $nombre . '%';

        $query = $this->getDb()->prepare('SELECT * FROM destinos WHERE nombre  LIKE :nombre');
        $query->execute(array(':nombre' => $nombre));
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @return array
     * Retorna todos los destinos ordenados de menor a mayor.
     */
    public function obtenerPorPrecioMenor()
    {
        $query = $this->getDb()->prepare('SELECT * FROM destinos ORDER BY precio ASC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @return array
     * Retorna todos los destinos ordenados de mayor a menor.
     */
    public function obtenerPorPrecioMayor()
    {
        $query = $this->getDb()->prepare('SELECT * FROM destinos ORDER BY precio DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $nombre, $detail, $precio, $dias
     * Edito un destino en base al nombre, detail, precio y dias pasados por parámetro
     */
    public function editar($id, $nombre, $detail, $precio, $dias, $imagen = NULL)
    {
        if ($imagen) {
            $pathImg = $this->copiarImagen();
        }

        $query = $this->getDb()->prepare('UPDATE destinos SET nombre = ?, precio = ?, dias = ?,
            imagen = ?, detalle = ?  WHERE id = ?');
        $query->execute([$nombre, $precio, $dias, $pathImg, $detail, $id]);
    }

    /**
     * @param $nombre, $detail, $precio, $dias
     * Edito un destino en base al nombre, detail, precio y dias pasados por parámetro
     */
    public function editarSinImagen($id, $nombre, $detail, $precio, $dias)
    {
        $query = $this->getDb()->prepare('UPDATE destinos SET nombre = ?, precio = ?, dias = ?,
            detalle = ?  WHERE id = ?');
        $query->execute([$nombre, $precio, $dias, $detail, $id]);
    }


    /**
     * @param $nombre, $pais, $detail, $precio, $dias
     * Agrega un destino en base al nombre, pais, detail, precio y dias pasados por parámetro
     */
    public function agregar($pais, $nombre, $detail, $precio, $dias, $imagen = NULL)
    {

        $pathImg = "imgs/imagendefault.jpg";

        if ($imagen) {
            $pathImg = $this->copiarImagen();
        }


        $query = $this->getDb()->prepare("INSERT INTO destinos (nombre, precio, dias, detalle, imagen, id_pais) 
         VALUES (?, ?, ?, ?, ?, ?)");
        $query->execute([$nombre, $precio, $dias, $detail, $pathImg, $pais]);
    }

    function copiarImagen()
    {

        // Nombre archivo original
        $nombreOriginal = $_FILES['imagen']['name'];
        // Nombre en el file system:
        $nombreFisico = $_FILES['imagen']['tmp_name'];

        $nombreFinal = "imgs/" . uniqid("", true) . "."
            . strtolower(pathinfo($nombreOriginal, PATHINFO_EXTENSION));


        move_uploaded_file($nombreFisico, $nombreFinal);

        return $nombreFinal;
    }

    /**
     * @param $id
     * Elimina un destino en base al id pasado por parámetro
     */
    public function eliminar($id)
    {
        $query = $this->getDb()->prepare('DELETE FROM destinos WHERE id = ?');
        $query->execute([$id]);
    }

    /**
     * @param $id
     * Elimina una portada de un destino en base al id pasado por parámetro
     */
    public function eliminarPortada($id)
    {
        $pathImg = "imgs/imagendefault.jpg";

        $query = $this->getDb()->prepare('UPDATE destinos SET imagen = ? WHERE id = ?');
        $query->execute([$pathImg, $id]);
    }
}
