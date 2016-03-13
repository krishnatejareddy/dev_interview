
<h4>Imagine you saw the following code in a project. How would you improve it?</h4>
<pre> $arr = array('foo', 'bar', 'baz');
    $i = 0;
    while($i < count($arr)) {
    echo $arr[$i];
    $i++;
    }</pre>

<p>foreach is optimized for iteration over collections.
    That's a fancy way of saying that it works best (and fastest) when you use it with arrays (and as of PHP5, objects).
    REF: http://www.metamorphosite.com/php-benchmarks-loops-arrays#Foreach
</p>

<pre>

    $arr = array('foo', 'bar', 'baz');
    foreach ($arr as &$value) {
       echo $value;
    }
</pre>
<?php
$arr = array('foo', 'bar', 'baz');
foreach ($arr as &$value) {
   echo $value;
}
?>