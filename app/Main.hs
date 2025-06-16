import CMark
import qualified Data.Text.IO
import ParseDir (parsePost, readDir, BlogDir)
import System.Directory


main :: IO ()
main = do
 postList <- readDir "blogtest/"
 putStrLn (show postList)  
 






