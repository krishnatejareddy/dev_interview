<?php

// Connecting to server
$link = mysqli_connect("127.0.0.1", "root", "", "shredz_task");
if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

// Defaults
date_default_timezone_set('America/Los_Angeles'); // For time zone

    # Query for sales report for current date ...
    $startDate = "'".date('Y-m-d')." 00:00:00'";
    $endDate =  "'".date('Y-m-d'). " 23:59:59"."'";
    echo "<h3>Query for getting the total quantity of products ordered and the total value for all orders made on the current date.</h3>";
    echo "<p>SELECT sum(orders.order_quantity) as totalProd , sum(orders.order_quantity*orders.price_whileordering) as totalValue  FROM `orders`  WHERE `order_date`  BETWEEN $startDate AND $endDate  ORDER BY `order_date` DESC</p>";

?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Date to check sales report: <input type="date" name="date" value="<?php echo date('Y-m-d'); ?>" max="<?php echo date('Y-m-d'); ?>">
    <input type="submit" name="submit" value="Submit">
</form>




<?php
    // Submit button click
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        echo "<h3>Sales  Details for date: ". $_POST['date'] ." </h3>";
        $startDate = "'".$_POST['date']." 00:00:00'";
        $endDate =  "'".$_POST['date']. " 23:59:59"."'";

        $result = mysqli_query($link, "SELECT sum(orders.order_quantity) as totalProd , sum(orders.order_quantity*orders.price_whileordering) as totalValue  FROM `orders`  WHERE `order_date`  BETWEEN $startDate AND $endDate  ORDER BY `order_date` DESC");
        //echo "<pre>";print_r($result);
        $num_rows = mysqli_num_rows($result);
        if ($num_rows > 0) {
            # code...
            while ($row = mysqli_fetch_object($result)) {
                echo "<p>Total quantity of products ordered :  ";
                echo  (is_null($row->totalProd) ? 0 : $row->totalProd);
                echo "<p>Total Value of products ordered :  ";
                echo  (is_null($row->totalValue) ? 0 : "$".$row->totalValue);
            }
            echo "</p>";

            $result2 = mysqli_query($link, "SELECT *   FROM `orders` JOIN `products` ON orders.product_id = products.id WHERE `order_date`  BETWEEN $startDate AND $endDate  ORDER BY `order_date` DESC");
            //echo "<pre>";print_r($result2);
            $num_rows2 = mysqli_num_rows($result2);
            if ($num_rows2 > 0) {
                # code...
                echo "<table id='table' class='table' border='1'>
                <thead>
                    <tr>
                        <th>Product Name </th>
                        <th>Order Quantity </th>
                        <th>Value</th>
                    </tr>
                </thead>
                <tbody>
                ";
                while ($row = mysqli_fetch_object($result2)) {
                    // echo "<pre>";print_r($row);
                    $sum_total = $row->order_quantity * $row->price_whileordering;
                    echo "<tr>
                        <td>$row->product_name</td>
                        <td>$row->order_quantity</td>
                        <td> $$sum_total</td>
                    </tr>";
                }
                echo "</tbody></table>";
            }
        } else {
            # code...
            $status = 1;
            $message = "Sorry !!! No records found";
            echo "<div align='center' >Sorry !!! No records found</div>";
        }
    }


?>

