<?php
class home{
    public function index()
    {
        echo "Home Page";
    }

    public function detail($id='', $slug='')
    {
        echo "id :".$id."<br/>";
        echo "slug :".$slug;
    }

    function search()
    {
        $keyword = $_GET['keyword'];
        echo "Search :".$keyword;
    }
}
