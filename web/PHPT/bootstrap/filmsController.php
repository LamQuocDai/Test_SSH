<?php
require_once __DIR__ . '/../bootstrap/FilmsDAL.php';
class filmsController
{
    private $filmsDAL;
    public function __construct()
    {
        $this->filmsDAL = new FilmsDAL();
    }

    public function getData($index, $category)
    {
        $result = $this->filmsDAL->getFilms($index, $category);
        array_walk_recursive($result, function (&$value) {
            $value = mb_convert_encoding($value, 'UTF-8', 'UTF-8');
        });
        echo json_encode($result);
    }

    public function getNumberPage($category)
    {
        $result = $this->filmsDAL->getNumberPage($category);
        echo json_encode($result);
    }
}

$filmsController = new filmsController();
$action = $_POST['action'];

switch ($action) {
    case 'get_films':
        $index = $_POST['index'];
        $category = $_POST['category'];
        $filmsController->getData($index, $category);
        break;
    case 'get_number_page':
        $category = $_POST['category'];
        $filmsController->getNumberPage($category);
        break;
    case 'get_films_by_keyword':
        $keySearch = $_POST['keySearch'];
    default:
        echo 'Action not found';
        break;
}
