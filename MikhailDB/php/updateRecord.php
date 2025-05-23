<!doctype html>
<!-- (C) Saeed Mirjalili -->
<html>

<head>
    <title>Update a record of a table</title>
    <link rel="stylesheet" href="../css/style.css" />
</head>

<body>

    <?php
    require 'config.php';

    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "<p style='color:green'>Connection Was Successful</p>";
    } catch (PDOException $err) {
        echo "<p style='color:red'> Connection Failed: " . $err->getMessage() . "</p>\r\n";
    }

    try {
        // first, check if the record exists for updating. if does not exists, display a message, else update it.
        $sql = "SELECT StdID FROM $dbname.Student WHERE StdID = :stid";
        $stmnt = $conn->prepare($sql);     // read about prepared statements here: https://www.w3schools.com/php/php_mysql_prepared_statements.asp
        $stmnt->bindParam(':stid', $_POST['stdId']);   // :stdId is the variable that we used in $sql, there must be a colon (:) in front of it.
        //  stdId in $_POST['stdId'] is the name of the element in HTML Form. Make sure it matches exactly the name of the form element in HTML 

        $stmnt->execute();

        if ($stmnt->rowCount() === 0) {
            echo "<p style='color:red'>Record not found. Cannot Update.</p>\r\n";
        } else {
            $sql = "UPDATE $dbname.Student SET SName = :sn WHERE StdID = :stid";
            $stmnt = $conn->prepare($sql);         // read about prepared statement here: https://www.w3schools.com/php/php_mysql_prepared_statements.asp
            $stmnt->bindParam(':stid', $_POST['stdId']);
            $stmnt->bindParam(':sn', $_POST['sname']);

            $stmnt->execute();
            echo "<p style='color:green'>Record Updated Successfully</p>";
        }
    } catch (PDOException $err) {
        echo "<p style='color:red'>Record Update Failed: " . $err->getMessage() . "</p>\r\n";
    }
    // Close the connection
    unset($conn);

    echo "<a href='../index.html'>Back to the Homepage</a>";

    ?>
</body>

</html>