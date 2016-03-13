<!DOCTYPE HTML>
<html>
<body>

<?php
    // Defaults
    $nameErr = $emailErr = $twitterErr = "";
    $name = $email =  $twitter = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
//  input variables and defaults

    $input = $_POST;

    echo "Input Data <pre>";print_r($input); echo "</pre>";
    if (empty($input)) {
        echo "Oops, Please pass the values ";
    } else {

        // First name and last name validation
        if (empty($input["name"])) {
            $nameErr  = "Please Enter Name";
        } else {
            $name = test_input($input["name"]);
            if (ctype_alpha(str_replace(' ', '', $input["name"])) === false) {
                $nameErr  = "Name must contain letters and spaces only";
            } else if (!(strpos(trim($input["name"]), ' ')) !== false) {
                // Space not found found.
                $nameErr = "Hay I need your First name and last name ";
            } else {
                $nameErr  = "You got it";
            }
        }

        // Email Validation
        if (empty($input["email"])) {
            $emailErr = "Please Enter Email";
        } else {
            $email   = test_input($input["email"]);

            if (!filter_var($input["email"], FILTER_VALIDATE_EMAIL)) {
                $emailErr = "Invalid email format";
            } else {
                $emailErr =  "You got it";
            }
        }
        // Twitter Validation
        if (!empty($input["twitter"])) {

            $twitter   = test_input($input["twitter"]);

            if(!preg_match('/@([A-Za-z0-9_]{1,15})$/', $twitter)){
                $twitterErr = "Invalid twitter format Or Twitter name should start with @";
            } else {
                $twitterErr =  "You got it";
            }
        } else {

        }


    }

}

function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Name: <input type="text" name="name" value="<?php echo $name; ?>">
    <span class="error">* <?php echo $nameErr;?></span>
    <br><br>
    E-mail: <input type="text" name="email" value="<?php echo $email; ?>">
    <span class="error">* <?php echo $emailErr;?></span>
    <br><br>
    Twitter: <input type="text" name="twitter" value="<?php echo $twitter; ?>">
    <span class="error"> <?php echo $twitterErr;?></span>
    <br><br>
    <input type="submit" name="submit" value="Submit">
</form>


</body>
</html>