<?php

declare(strict_types=1);

use Symfony\Component\ErrorHandler\Debug;

require_once __DIR__.'/../../vendor/autoload.php';

Debug::enable();

$input = explode("\n", file_get_contents(__DIR__ . '/../data/2021/3.txt'));
$totalEntries = count($input);
$totalByColumn = [];

for ($x = 0; $x < 12; $x++) {
    $totalByColumn[$x] = 0;

    for ($y = 0; $y < $totalEntries; $y++) {
        $totalByColumn[$x] = $totalByColumn[$x] + (int) str_split($input[$y])[$x];
    }
}

foreach ($totalByColumn as $column => $total) {
    $totalByColumn[$column] = $total > ($totalEntries / 2) ? '1' : '0';
}

$gamma = bindec(implode('', $totalByColumn));
$epsilon = bindec('111111111111') - $gamma;

echo $gamma * $epsilon."\n";

