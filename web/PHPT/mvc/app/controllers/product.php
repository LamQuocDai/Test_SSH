<?php
class product{
    public function index()
    {
        echo "Product Page";
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