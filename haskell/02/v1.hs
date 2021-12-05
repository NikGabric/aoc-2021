module Main where

convToTuple :: String -> (Int, Int)
convToTuple s =
  case head $ words s of
    "forward" -> (0, read $ last $ words s :: Int)
    "up" -> (1, read $ last $ words s :: Int)
    "down" -> (-1, read $ last $ words s :: Int)  
    _ -> (0,0)

convToTupleArr :: [String] -> [(Int, Int)]
convToTupleArr arr
  | null arr = []
  | not $ null arr = convToTuple (head arr) : convToTupleArr (tail arr)

analyseArr :: [(Int, Int)] -> (Int, Int)
analyseArr arr
  | null arr = 0
  | (fst $ head arr) == 0 = (0, snd (head arr) + analyseArr (tail arr))
  | (fst $ head arr) == 1 = (0, snd (head arr) + analyseArr (tail arr))
  | (fst $ head arr) == -1 = (0, snd (head arr) + analyseArr (tail arr))

main :: IO ()
main = do
  vhod <- getContents
  let arrTuples = convToTupleArr (lines vhod)
  -- print $ snd $ head arrTuples
  print $ analyseArr arrTuples
