<?php
    class app{
        private $__controller, $__method, $__params;
        public function __construct()
        {
            global $router;
            if(!empty($router['default_controller'])){
                $this->__controller = $router['default_controller'];
            }
            $this->__method = "index";
            $this->__params = [];
            $this->handleUrl();
        }

        function getURL()
        {
            if(isset($_SERVER['PATH_INFO']))
            {
                $url = $_SERVER['PATH_INFO'];
            }
            else{
                $url = '/';
            }
            return $url;
        }

        function handleUrl(){
            $url = $this->getURL();
            $arrUrl = array_filter(explode('/',$url));
            $arrUrl = array_values($arrUrl);

            // Handle controller
            if(!empty($arrUrl[0])){
                $this->__controller = ucfirst($arrUrl[0]);
            }
            else{
                $this->__controller = ucfirst($this->__controller);
            }
            if(file_exists("app/controllers/".($this->__controller).".php")){
                require_once "controllers/".($this->__controller).".php";
                $this->__controller = new $this->__controller();
                //$this->__controller->index();
                unset($arrUrl[0]);
            }
            else{
                $this->loadError();
            }

            // Handle method
            if(!empty($arrUrl[1])) {
                $this->__method = $arrUrl[1];
                unset($arrUrl[1]);
            }

            // Handle params
            $this->__params = array_values($arrUrl);

            call_user_func_array([$this->__controller, $this->__method], $this->__params);
        }

        function loadError($name ='404')
        {
            require_once 'errors/'.$name.'.php';
        }
    }
?>