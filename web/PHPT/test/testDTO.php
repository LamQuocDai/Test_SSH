<?php
    class test{
        private $id;
        private $name;
        private $age;

        public function __construct($id, $name, $age)
        {
            $this->id = $id;
            $this->name = $name;
            $this->age = $age;
        }

        public function getId()
        {
            return $this->id;
        }

        public function setId($id)
        {
            $this->id = $id;
        }

        public function setName($name)
        {
            $this->name = $name;
        }

        public function getName()
        {
            return $this->name;
        }

        public function setAge($age)
        {
            $this->age = $age;
        }

        public function getAge()
        {
            return $this->age;
        }
    }
?>