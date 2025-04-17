<!doctype html>
<!-- Mikhail Senatorov 300407626-->
<html>

<head>
    <title>Display Records of a Table</title>
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
    $sql = "SELECT ProjectID, TotalBudget, BudgetPortion, ProjectFunction FROM FundedProjects";
    $stmnt = $conn->prepare($sql);
    $stmnt->execute();

    $row = $stmnt->fetch(PDO::FETCH_ASSOC); // fetch as associative array
    if ($row) {
        echo '<table border="1" cellpadding="8" cellspacing="0">';
        echo '<tr> 
                <th>Project ID</th> 
                <th>Total Budget ($)</th> 
                <th>Budget Portion (%)</th> 
                <th>Project Function</th> 
              </tr>';
        do {
            echo "<tr>
                    <td>{$row['ProjectID']}</td>
                    <td>{$row['TotalBudget']}</td>
                    <td>{$row['BudgetPortion']}%</td>
                    <td>{$row['ProjectFunction']}</td>
                  </tr>";
        } while ($row = $stmnt->fetch(PDO::FETCH_ASSOC));
        echo '</table>';
    } else {
        echo "<p>No Record Found!</p>";
    }
} catch (PDOException $err) {
    echo "<p style='color:red'>Record Retrieval Failed: " . $err->getMessage() . "</p>\r\n";
}

// Close the connection
unset($conn);

echo "<br /><a href='../index.html'>Back to the Homepage</a>";
?>

</body>
</html>
