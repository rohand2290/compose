import CMark
import Parse
import qualified Data.Text
import qualified Data.Text.IO



main :: IO ()
main = do
 text <- Data.Text.IO.readFile "README.md"
 putStrLn (show (commonmarkToHtml [CMark.optSmart] text))







