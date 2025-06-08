module ParseDir
(Post (..),
 BlogDir (..),
 readDir)
where

import System.Directory
import CMark
import Data.Text.IO



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


parsePost :: FilePath -> IO Post
parsePost postPath = do
                       rawPost <- readFile postPath
		       case commonmarkToNode [optSmart] rawPost of
		        (_ (HEADING 1) arrPost) ->  
		       


readDir :: FilePath -> IO [FilePath]
readDir filepath = do
                     filepaths <- listDirectory filepath
		     BlogDir  


