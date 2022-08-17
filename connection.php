<?php
    $username = 'pokebilans';
    $password = 'password';
    $database =  'pokemonBilans';
    $host = 'localhost';
    $connect =  mysqli_connect($host,$username,$password,$database);
    if($connect -> connect_errno){
        echo $mysqli -> connect_errno;
        die();
    }
    //else{
    //    echo 'Connect success';
    //}
    
    ?>