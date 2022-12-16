<?php

declare(strict_types=1);

namespace App;

use Symfony\Component\ErrorHandler\Debug;

require_once __DIR__.'/../../vendor/autoload.php';

Debug::enable();

class GiantSquid
{
    private const SIDE_LENGTH = 5;
    private const DIRECTION_X = 0;
    private const DIRECTION_Y = 1;

    private array $grids;
    private array $winnerGrid;
    private int $winnerValue;

    public function main(): int
    {
        $input = explode("\n", file_get_contents(__DIR__ . '/../data/2021/4.txt'));
        $draws = explode(',', $input[0]);
        unset($input[0], $input[1]);

        $this->grids = $this->formatGrids(array_values($input));

        for ($drawLimit = 5; $drawLimit < count($draws); $drawLimit++) {
            if ($this->searchForBingoInDirection(array_slice($draws, 0, $drawLimit), self::DIRECTION_X)) {
                break;
            }

            if ($this->searchForBingoInDirection(array_slice($draws, 0, $drawLimit), self::DIRECTION_Y)) {
                break;
            }
        }

        $unmarkedValues = $this->getUnmarkedValues($this->winnerGrid, array_slice($draws, 0, $drawLimit));

        return array_sum($unmarkedValues) * $this->winnerValue;
    }

    private function searchForBingoInDirection(array $draws, int $direction): bool
    {
        foreach ($this->grids as $grid) {
            for ($x = 0; $x < self::SIDE_LENGTH; $x++) {
                $nbOfGoodValues = 0;
                for ($y = 0; $y < self::SIDE_LENGTH; $y++) {
                    if (!in_array($direction === self::DIRECTION_Y ? $grid[$y][$x] : $grid[$x][$y], $draws)) {
                        break;
                    }

                    ++$nbOfGoodValues;

                    if (self::SIDE_LENGTH !== $nbOfGoodValues) {
                        continue;
                    }

                    $this->winnerGrid = $grid;
                    $this->winnerValue = (int) end($draws);

                    return true;
                }
            }
        }

        return false;
    }

    private function getUnmarkedValues(array $grid, array $draws): array
    {
        $values = [];

        foreach ($grid as $row) {
            foreach ($row as $value) {
                if (in_array($value, $draws)) {
                    continue;
                }

                $values[] = $value;
            }
        }

        return $values;
    }

    private function formatGrids(array $numbers): array
    {
        $grids = [];
        $gridNumber = 0;
        for ($i = 0; $i < count($numbers); $i++) {
            if ('' === $numbers[$i]) {
                $gridNumber++;

                continue;
            }

            $numbers[$i] = str_split($numbers[$i], 3);
            $numbers[$i] = array_map(fn($element) => trim($element), $numbers[$i]);

            $grids[$gridNumber][] = $numbers[$i];
        }

        return $grids;
    }
}

echo (new GiantSquid())->main()."\n";