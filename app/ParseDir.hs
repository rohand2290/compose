module ParseDir
(Post (..),
 BlogDir (..),
 parsePost,
 readDir)
where

import System.Directory (listDirectory, makeAbsolute)
import System.FilePath 

import CMark
import qualified Data.Text.IO
import Data.Text




data Post = Post {
 isIndex :: Bool,
 date :: String,
 title :: String,
 content :: Node,
 tag :: String
} deriving Show

data BlogDir = BlogDir {
 index :: Post,
 posts :: [Post]
} deriving Show





parsePost :: Text -> Post
parsePost postText = case commonmarkToNode [optSmart] postText of
  (Node _ DOCUMENT (x:xs)) -> case x of
   (Node _ (HEADING 1) [Node _ (TEXT t) _]) -> if t == (pack "index")
    then Post True "today" "index" (commonmarkToNode [optSmart] postText) "na"
    else Post False "today" (unpack t) (commonmarkToNode [optSmart] postText) "na"
   _ -> Post False "today" "First Post" (commonmarkToNode [optSmart] postText) "na"
  _ -> Post False "today" "First Post" (commonmarkToNode [optSmart] postText) "na" 






readDir :: FilePath -> IO [Post]
readDir filepath = do
                    filepaths <- listDirectory filepath
		    absFilepaths <- traverse (makeAbsolute . (filepath </>)) filepaths
		    textList <- traverse Data.Text.IO.readFile absFilepaths
		    return (fmap parsePost textList)
		    
		    





