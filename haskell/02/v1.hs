-- {-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where

convToTuple :: String -> (Int, Int)
convToTuple s =
  case head $ words s of
    "forward" -> (0, read $ last $ words s :: Int)
    "up" -> (-1, read $ last $ words s :: Int)
    "down" -> (1, read $ last $ words s :: Int)
    _ -> (0,0)

convToTupleArr :: [String] -> [(Int, Int)]
convToTupleArr arr
  | null arr = []
  | not $ null arr = convToTuple (head arr) : convToTupleArr (tail arr)
convToTupleArr _ = [(0,0)]

analyseArrHorPos :: [(Int, Int)] -> Int
analyseArrHorPos [] = 0
analyseArrHorPos ((a,b):xs) =
  case a of
    0 -> b + analyseArrHorPos xs
    1 -> analyseArrHorPos xs
    -1 -> analyseArrHorPos xs
    _ -> 0

analyseArrDepth :: [(Int, Int)] -> Int
analyseArrDepth [] = 0
analyseArrDepth ((a,b):xs) =
  case a of
    0 -> analyseArrDepth xs
    1 -> analyseArrDepth xs + b
    -1 -> analyseArrDepth xs - b
    _ -> 0


main :: IO ()
main = do
  vhod <- getContents
  let arrTuples = convToTupleArr (lines vhod)
  let horPos = analyseArrHorPos arrTuples
  let depth = analyseArrDepth arrTuples
  print $ horPos * depth
