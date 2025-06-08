import CMark
import qualified Data.Text.IO
import ParseDir 


main :: IO ()
main = do
 text <- Data.Text.IO.readFile "README.md"
 filepaths <- readDir "./blogtest"
 putStrLn (show filepaths) 







