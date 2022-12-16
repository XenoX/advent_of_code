<?php

declare(strict_types=1);

use Symfony\Component\ErrorHandler\Debug;

require_once __DIR__.'/../../vendor/autoload.php';

Debug::enable();

$input = explode("\n", file_get_contents(__DIR__ . '/../data/2021/2.txt'));
$forward = 0;
$depth = 0;
$aim = 0;

for ($i = 0; $i < count($input); $i++) {
    $exploded = explode(' ', $input[$i]);
    $value = $exploded[1];

    switch ($exploded[0]) {
        case 'forward':
            $forward = $forward + $value;
            $depth = $depth + ($aim * $value);
            break;
        case 'up':
            $aim = $aim - $value;
            break;
        case 'down':
            $aim = $aim + $value;
            break;
        default:
            break;
    }
}

echo $forward * $depth."\n";
