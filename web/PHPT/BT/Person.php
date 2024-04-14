<?php
class Employee
{
    private $first_name;
    private $last_name;
    private $age;

    public function __construct($first_name,$last_name,$age)
    {
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->age = $age;
    }

    public function set_first_name($first_name){
        $this->first_name = $first_name;
    }

    public function get_first_name(){
        return $this->first_name;
    }

    
    public function set_last_name($last_name){
        $this->last_name = $last_name;
    }

    public function get_last_name(){
        return $this->last_name;
    }

    
    public function set_age($age){
        $this->age = $age;
    }

    public function get_age(){
        return $this->age;
    }

    public function __toString()
    {
        return "$this->first_name $this->last_name $this->age";
    }
}

$Name = new Employee("Lam Quoc", "Dai",20);

echo $Name;