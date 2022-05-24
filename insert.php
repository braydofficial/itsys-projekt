<?php
    # Establish DB connection
    $pdo = new PDO('mysql:host=localhost;dbname=mydb', 'root2', 'server');

    # Set variables
    $agbezeichnung = $_POST['agbezeichnung'];
    $raumnr = $_POST['raumnr'];
    $day = $_POST['day'];
    $time = $_POST['time'];

    # Prepare Statement
    $stmt = $pdo->prepare("INSERT INTO ags VALUES ('NULL', :agbezeichnung, :raumnr, :day, :time)");

    # Query
    $query = $pdo->prepare("SELECT COUNT(*) FROM ags WHERE raumnr = :raumnr AND startzeit = :time AND wochentag = :day");
    # Bind parameters
    $stmt->bindParam(':agbezeichnung', $agbezeichnung);
    $stmt->bindParam(':raumnr', $raumnr);
    $stmt->bindParam(':day', $day);
    $stmt->bindParam(':time', $time);

    $query->bindParam(':raumnr', $raumnr);
    $query->bindParam(':time', $time);
    $query->bindParam(':day', $day);

    $query->execute();
    $num_row = $query->fetchColumn();
    if($num_row != 0) { 
        echo "Raum belegt.";
        return;
    }

    # Execute the SQL INSERT
    $update = $stmt->execute();
    echo "Daten wurden in die DB eingetragen! <br>AG-Bezeichnung: $preagbezeichnung<br>Raum-Nr.: $raumnr<br>Tag: $day<br>Zeit: $time<br>";
?>