<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

// Include markdown library
use \Michelf\Markdown;

if (!$smarty->isCached('master.tpl', $smarty_cache_key)) {
	  $debug->append('No cached version available, fetching from backend', 3);
	  // Fetch active news to display
	  $aNews = $news->getAllActive();
	  if (is_array($aNews)) {
		foreach ($aNews as $key => $aData) {
		  // Transform Markdown content to HTML
		  $aNews[$key]['content'] = Markdown::defaultTransform($aData['content']);
		}
	  }
	 if ($bitcoin->can_connect() === true){
		$dDifficulty = $bitcoin->getdifficulty();
		$iBlock = $bitcoin->getblockcount();
	  } else {
		$dDifficulty = 1; 
		$iBlock = 0;
		$_SESSION['POPUP'][] = array('CONTENT' => 'Unable to connect to litecoind RPC service: ' . $bitcoin->can_connect(), 'TYPE' => 'alert alert-danger');
	  }
		  
	// Grab the last 5 blocks found as a quick overview
	  $iLimit = 10;
	  $aBlocksFoundData = $statistics->getBlocksFound($iLimit);
	  count($aBlocksFoundData) > 0 ? $aBlockData = $aBlocksFoundData[0] : $aBlockData = array();
		 
		 
	  // Estimated time to find the next block
	  $iCurrentPoolHashrate =  $statistics->getCurrentHashrate();

	  // Time in seconds, not hours, using modifier in smarty to translate
	  $iCurrentPoolHashrate > 0 ? $iEstTime = $statistics->getExpectedTimePerBlock('pool', $iCurrentPoolHashrate) : $iEstTime = 0;

	  // Time since last block
	  if (!empty($aBlockData)) {
		$dTimeSinceLast = (time() - $aBlockData['time']);
		if ($dTimeSinceLast < 0) $dTimeSinceLast = 0;
	  } else {
		$dTimeSinceLast = 0;
	  }
	  
  // Past blocks found, max 4 weeks back
  $iFoundBlocksByTime = $statistics->getLastBlocksbyTime();

	  $smarty->assign("LASTBLOCKSBYTIME", $iFoundBlocksByTime);
	   $smarty->assign("BLOCKSFOUND", $aBlocksFoundData);
	  $smarty->assign("CURRENTBLOCK", $iBlock);
	  $smarty->assign("DIFFICULTY", $dDifficulty);
	  $smarty->assign("ESTTIME", $iEstTime);
	  $smarty->assign("TIMESINCELAST", $dTimeSinceLast);
	  $smarty->assign("HIDEAUTHOR", $setting->getValue('acl_hide_news_author'));
	  $smarty->assign("NEWS", $aNews);
} else {
  $debug->append('Using cached page', 3);
}
// Load news entries for Desktop site and unauthenticated users
$smarty->assign("CONTENT", "default.tpl");
