import CMark
import qualified Data.Text.IO
import ParseDir (parsePost, readBlogArr, BlogDir, Post)
import System.Directory
import System.FilePath


main :: IO ()
main = do
 postList <- readDir "blogtest/"
 putStrLn (show postList)  



readDir :: FilePath -> IO BlogDir
readDir filepath = do
                    filepaths <- listDirectory filepath
		    absFilepaths <- traverse (makeAbsolute . (filepath </>)) filepaths
		    textList <- traverse Data.Text.IO.readFile absFilepaths
		    return (readBlogArr textList)

 






