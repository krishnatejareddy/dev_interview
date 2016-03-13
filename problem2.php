
<h4>function to generate a JSON formatted output with the names ordered alphabetically</h4>
<pre>
    function arrayToJson($array) {
        // arranging array by Key
        ksort($array);
        foreach($array as $key => $value) {
            $tempArray[] = array('name' => addslashes($key), 'age' => addslashes($value));
        }
        return json_encode($tempArray);
    }

</pre>



<?php

// Given input
$employees = array('Travis' => 29, 'John' => 30, 'Manny' => 24, 'Gabriel' => 20, 'Yogi' => 22);

echo "<pre>";print_r(arrayToJson($employees));

function arrayToJson($array) {
    // arranging array by Key
    ksort($array);
    foreach($array as $key => $value) {
        $tempArray[] = array('name' => addslashes($key), 'age' => addslashes($value));
    }
    return json_encode($tempArray);
}

?>

