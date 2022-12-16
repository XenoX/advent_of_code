<?php

declare(strict_types=1);

use Symfony\Component\ErrorHandler\Debug;

require_once __DIR__.'/../../vendor/autoload.php';

Debug::enable();

$numbers = file_get_contents(__DIR__ . '/../data/2021/1.txt');
$numbers = explode("\n", $numbers);
$numberOfIncrements = 0;

for ($i = 0; $i < count($numbers); $i++) {
    if (!array_key_exists(($i - 1), $numbers) || $numbers[$i - 1] > $numbers[$i]) {
        continue;
    }

    ++$numberOfIncrements;
}

echo $numberOfIncrements."\n";
