<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-mail form</title>
    
    <link rel="stylesheet" href="style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

</head>
<body>

    <?php
        require_once 'connection.php';
    ?>

    <div class="circle"></div>

    <form action="send_email.php" method="post">
        <fieldset>
            <legend>Send message to the selected group</legend>
    
            <label for="selectCategory">Select group: </label>

            <?php
                $sqlGroupNames = "SELECT groupName FROM groups";
                $resultGroupNames = mysqli_query($conn, $sqlGroupNames);

                if (mysqli_num_rows($resultGroupNames) > 0) { 
                    echo "<select id='selectCategory' name='group_category' required>";
                    echo "<option></option>";
                    
                    while($row = mysqli_fetch_assoc($resultGroupNames)) { 
                        echo "<option value='" . $row['groupName'] . "'>" . $row['groupName'] . "</option>"; 
                    }                    
                    echo "</select>";
                } else {
                    echo "No groups";
                }
            ?>  

            <br>

            <p>Add a field to the message with the user's first name, last name or insert an email template:</p>
            <button type="button" onclick="insertTextToTextarea('{name}')">{name}</button>
            <button type="button" onclick="insertTextToTextarea('{lastName}')">{lastName}</button>
            <button type="button" onclick="insertTextToTextarea('Hi {name} {lastName},\n\nnice to meet you! I hope that you like this script.\n\nGreetings')">Email template</button>

            <textarea id="message" name="message" cols="50" rows="10" maxlength="250" placeholder="Write message (max. 250 characters)" required></textarea>
            <p id="textareaCharCounter"><span id="counterChars">0</span>/<span id="maxChars"></span></p>

            <input type="submit" value="Send">
            <input type="reset" value="Reset">

        </fieldset>
    </form>

    <script src="js/script.js"></script>
    
</body>
</html>