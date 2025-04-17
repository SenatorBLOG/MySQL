<!doctype html>
<!-- Mikhail Senatorov 300407626-->
<html>

<head>
    <title>Display Records of a table</title>
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

    // Check if the form was submitted and $_POST['pf'] exists
    if (isset($_POST['pf'])) {
        try {
            // Prepare the SQL query with LIKE clause
            $sql = "SELECT ProjectID, TotalBudget, BudgetPortion, ProjectFunction FROM FundedProjects WHERE ProjectFunction LIKE :pf";

            // Prepare the statement
            $stmnt = $conn->prepare($sql);

            // Add wildcard characters for partial matching in the LIKE clause
            $search = "%" . $_POST['pf'] . "%"; // Use % to allow partial matches

            // Bind the search parameter to the prepared statement
            $stmnt->bindParam(':pf', $search);

            $stmnt->execute();

            $row = $stmnt->fetch();  

            if ($row) {
                // Display results in a table
                echo '<table>';
                echo '<tr> <th>Project ID</th> <th>Total Budget ($)</th> <th>Budget Portion (%)</th> <th>Project Function</th> </tr>';
                
                // Fetch all the rows and display them
                do {
                    echo "<tr><td>{$row['ProjectID']}</td>
                            <td>{$row['TotalBudget']}</td>
                            <td>{$row['BudgetPortion']}%</td>
                            <td>{$row['ProjectFunction']}</td></tr>";
                } while ($row = $stmnt->fetch());
                echo '</table>';
            } else {
                echo "<p> No Record Found!</p>";
            }
        } catch (PDOException $err) {
            echo "<p style='color:red'>Record Retrieval Failed: " . $err->getMessage() . "</p>\r\n";
        }
    } else {
        echo "<p>Please enter a Project Function to search for.</p>";
    }

    // Close the connection
    unset($conn);

    // Provide a link back to the homepage
    echo "<a href='../index.html'>Back to the Homepage</a>";

    ?>
</body>

</html>
