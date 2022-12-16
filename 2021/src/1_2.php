<?php

declare(strict_types=1);

use Symfony\Component\ErrorHandler\Debug;

require_once __DIR__.'/../../vendor/autoload.php';

Debug::enable();

$numbers = file_get_contents(__DIR__ . '/../data/2021/1.txt');
$numbers = explode("\n", $numbers);
$previousSum = null;
$numberOfIncrements = 0;

for ($i = 0; $i < count($numbers); $i++) {
    if (!array_key_exists(($i + 2), $numbers)) {
        continue;
    }

    $currentSum = $numbers[$i] + $numbers[$i + 1] + $numbers[$i + 2];

    if (null === $previousSum || $previousSum >= $currentSum) {
        $previousSum = $currentSum;

        continue;
    }

    $previousSum = $currentSum;
    ++$numberOfIncrements;
}

echo $numberOfIncrements."\n";
