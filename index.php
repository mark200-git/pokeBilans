<?php
    require('connection.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form name="hunting" action="insert.php" method="POST">
        <label name="nick" for="nick">Nick w grze </label><br><input type="text" name="nick" id="nick" value="Wprowadź swój nick" /><br>
        <label for="pokemon_select" name="pokemon_select">Wybierz pokemona z listy</label><br><select class="select" id="pokemon_select" name="pokemon_select">
        <?php
            $select_shiny = 'SELECT s.id_pokemon AS IDPokemon, p.name_pokemon AS Pokemon FROM shiny_wildernesses AS s
                            INNER JOIN pokemons p ON s.id_pokemon = p.id_pokemon';
            $result = mysqli_query($connect, $select_shiny);
            if($result -> num_rows > 0){
                //echo "<select class='select' name='products'>";
                while($row = mysqli_fetch_assoc($result)){
                    echo "<option value='".$row['IDPokemon']."'>".$row['Pokemon']."</option>";
                }
            }
            //echo "</select>";
            mysqli_close($connect);
        ?>
        </select><br>
        <label for="data_zlapania" name="label_data">
            Wprowadź datę złapania
        </label> <br>
        <input type="date" name="data_zlapania" id="data_zlapania"><br>
        <button type="submit" name="button" id="button">Zapisz</button>
    </form>
</body>
</html>