<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zadanie testowe - Comarch</title>

    <link rel="stylesheet" href="style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

</head>
<body>    
    
    <div class="circle"></div>

    <div class="sendEmailContainer">
        
        <?php 

            if(isset($_POST['group_category'])) 
            {
                require_once 'connection.php';

                mysqli_set_charset($conn, "utf8");

                $groupCategory=$_POST['group_category']; ;
                $message=$_POST['message']; 
                $sendDate = date("Y-m-d H:i:s");            

                $sqlGroupID = "SELECT ID FROM groups WHERE groupName = '$groupCategory'";
                $resultGroupID = mysqli_query($conn, $sqlGroupID);
                $row = mysqli_fetch_assoc($resultGroupID);
                $groupID = $row['ID'];

                $sqlRecipients = "SELECT name, lastName, email FROM recipients
                        JOIN assignments ON recipients.ID = assignments.ID_recipient
                        WHERE assignments.ID_group = $groupID";
                $resultRecipients = mysqli_query($conn, $sqlRecipients);

                echo "<h2>Your message:</h2>";

                echo "<p><b>Selected Email Group: </b></p>";
                echo $groupCategory."<br>"; 

                $result = '';

                while($row = mysqli_fetch_assoc($resultRecipients)) {
                    $recipientName = $row['name'];
                    $recipientLastName = $row['lastName'];
                    $recipientEmail = $row['email'];

                    $fullMessage = str_replace("{name}", $recipientName, $message);
                    $fullMessage = str_replace("{lastName}", $recipientLastName, $fullMessage);
                    $fullMessageWithBrTag = nl2br($fullMessage);
                    
                    // Simulation of sending e-mails - save data to table
                    $sqlSendEmail = "INSERT INTO sentemails (ID, recipientName, recipientLastName, recipientEmail, message, toGroup, sendDate) 
                    VALUES ('', '$recipientName', '$recipientLastName', '$recipientEmail', '$fullMessage', '$groupCategory', '$sendDate')" or die ("Error in the query".mysqli_error($conn)); 

                    $result = mysqli_query($conn, $sqlSendEmail);

                    echo "<p><b>Message: </b></p>";
                    echo $fullMessageWithBrTag."<br>";                    
                } 

                echo "<p><b>Sending date: </b></p>";
                echo $sendDate."<br>";                
                            
                if($result)		
                {
                    echo "<br><h2>Thank you for sending your message!</h2>";                
                }
                else{
                    echo '<br><p>Error with sending message</p>';
                }
                    
                mysqli_close($conn);
            }            
        ?>    

        <a href="index.php"><input type="button" value="Back to form"/></a>

    </div>

</body>
</html>