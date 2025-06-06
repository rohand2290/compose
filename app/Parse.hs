module Parse
 (getMarkdownNode
  , processNode)
where

import CMark
import qualified Data.Text


getMarkdownNode :: Data.Text.Text -> CMark.Node
getMarkdownNode text = CMark.commonmarkToNode [CMark.optSmart] text 


processNode :: Node -> IO ()
processNode node = case node of
                   CMark.Node _ typ [] -> putStrLn (show typ)
                   CMark.Node _ typ childNodes -> do 
		                                    putStrLn (show typ)
                                                    mapM_ processNode childNodes

