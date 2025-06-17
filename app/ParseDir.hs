module ParseDir
(Post (..),
 BlogDir (..),
 parsePost,
 readBlogArr)
where

import System.Directory (listDirectory, makeAbsolute)
import System.FilePath 

import CMark
import qualified Data.Text.IO
import qualified Data.Text




data Post = Post {
 isIndex :: Bool,
 date :: String,
 title :: String,
 content :: Node,
 tag :: Maybe String
} deriving Show

data BlogDir = BlogDir {
 index :: Post,
 posts :: [Post]
} deriving Show





parsePost :: Data.Text.Text -> Post
parsePost postText = case commonmarkToNode [optSmart] postText of
  (Node _ DOCUMENT (x:xs)) -> case x of
   (Node _ (HEADING 1) [Node _ (TEXT t) _]) -> if t == (Data.Text.pack "index")
    then Post True "today" "index" (commonmarkToNode [optSmart] postText) Nothing
    else Post False "today" (Data.Text.unpack t) (commonmarkToNode [optSmart] postText) Nothing
   _ -> Post False "today" "First Post" (commonmarkToNode [optSmart] postText) Nothing
  _ -> Post False "today" "First Post" (commonmarkToNode [optSmart] postText) Nothing







readBlogArr :: [Data.Text.Text] -> BlogDir
readBlogArr arr = BlogDir {
 index = head (filter (\post -> isIndex post == True) (fmap parsePost arr)), 
 posts = (filter (\post -> isIndex post == True) (fmap parsePost arr))
}
		    
		    





