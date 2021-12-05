module Main where

convToInt :: [String] -> [Int]
convToInt strArr = [read x :: Int | x <- strArr]

compareLists :: [Int] -> [Int] -> Int
compareLists [] _ = 0
compareLists arr1 arr2 =
  if head arr1 < head arr2 then
    1 + compareLists (tail arr1) (tail arr2)
  else
    0 + compareLists (tail arr1) (tail arr2)

main :: IO ()
main = do
  vhod <- getContents
  let intArr = convToInt (lines vhod)
  let arr1 = init intArr
  let arr2 = tail intArr

  print (compareLists arr1 arr2)