<?php

declare(strict_types=1);

namespace App;

use Symfony\Component\ErrorHandler\Debug;

require_once __DIR__.'/../../vendor/autoload.php';

Debug::enable();

class LifeSupportRating
{
    private const BIT_CRITERIA_OXYGEN = 1;
    private const BIT_CRITERIA_CO2 = 0;

    public function main(): int
    {
        $numbers = explode("\n", file_get_contents(__DIR__ . '/../../data/2021/3.txt'));

        $oxygenNumber = $this->getNumbersForBitCriteria($numbers, 0, self::BIT_CRITERIA_OXYGEN)[0];
        $co2Number = $this->getNumbersForBitCriteria($numbers, 0, self::BIT_CRITERIA_CO2)[0];

        return bindec($oxygenNumber) * bindec($co2Number);
    }

    private function getNumbersForBitCriteria(array $numbers, int $bitPosition, int $bitCriteria): array
    {
        $zeroNumbers = $oneNumbers = [];

        for ($y = 0; $y < count($numbers); $y++) {
            $numberSplitted = str_split($numbers[$y]);
            '1' === $numberSplitted[$bitPosition] ? $oneNumbers[] = $numbers[$y] : $zeroNumbers[] = $numbers[$y];
        }

        $numbers = match ($bitCriteria) {
            self::BIT_CRITERIA_OXYGEN => count($oneNumbers) >= count($zeroNumbers) ? $oneNumbers : $zeroNumbers,
            default => count($zeroNumbers) <= count($oneNumbers) ? $zeroNumbers : $oneNumbers
        };

        return count($numbers) !== 1 ? $this->getNumbersForBitCriteria($numbers, ++$bitPosition, $bitCriteria) : $numbers;
    }
}

echo (new LifeSupportRating())->main()."\n";