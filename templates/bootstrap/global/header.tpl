        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {if $GLOBAL.config.poolnav_enabled|default:"false"}
                <ul class="nav navbar-nav navbar-top-links">
                  <li class="dropdown">
                    <a href="#" class="navbar-brand dropdown-toggle" data-toggle="dropdown">{$GLOBAL.website.name} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      {assign var="PoolArray" value="\n"|explode:$GLOBAL.config.poolnav_pools}
                      {foreach from=$PoolArray item=pooldata}
                      {assign var="PoolURL" value="|"|explode:$pooldata}
                      {if $PoolURL|count > 1}
                      <li class="h4"><a href="{$PoolURL[1]}"><i class="fa fa-angle-double-right fa-fw"></i> {$PoolURL[0]}</a></li>
                      {/if}
                      {/foreach}
                    </ul>
                  </li>
                </ul>
                {else}
                <!--<a class="navbar-brand" href="{$smarty.server.SCRIPT_NAME}">{$GLOBAL.website.name}</a>-->
                <a class="navbar-brand" href="{$smarty.server.SCRIPT_NAME}">Home</a>
				<a class="navbar-brand" href="http://grlc.life">GRLC.Life</a>
				<a class="navbar-brand" href="http://garlicinsight.com">GarlicInsight</a>
                {/if}
            </div>

            <ul class="nav navbar-top-links navbar-right">
			
			<!--<li class="well well-sm" style="padding:5px; margin:0;">
				<b id="grlcPrice">$420.69</b> <small>USD</small>
			 </li>-->
			
			 <li class="well well-sm" style="padding:5px; margin:0;">
				<b id="navWorkers">{$GLOBAL.workers}</b> <small>workers</small> | <b id="navHash">{$GLOBAL.hashrate|round:1}</b> <small>{$GLOBAL.hashunits.pool}</small>
			 </li>
			 
			 
				{if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.lastnotifications|@count|default:"0" != 0}
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bullhorn fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                    

{section notification $GLOBAL.userdata.lastnotifications}
                        <li>
                            <a href="#">
                                <div>
                                    {if $GLOBAL.userdata.lastnotifications[notification].type == new_block}<i class="fa fa-th-large fa-fw"></i> New Block
                                    {else if $GLOBAL.userdata.lastnotifications[notification].type == payout}<i class="fa fa-money fa-fw"></i> Payout
                                    {else if $GLOBAL.userdata.lastnotifications[notification].type == idle_worker}<i class="fa fa-desktop fa-fw"></i> IDLE Worker
                                    {else if $GLOBAL.userdata.lastnotifications[notification].type == success_login}<i class="fa fa-sign-in fa-fw"></i> Successful Login
                                    {/if}
                                    <span class="pull-right text-muted small">{$GLOBAL.userdata.lastnotifications[notification].time|relative_date}</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
{/section}

                        <li>
                            <a class="text-center" href="{$smarty.server.SCRIPT_NAME}?page=account&action=notifications">
                                <strong>See All Notifications</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                {/if}
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> {if $GLOBAL.userdata.username|default}{$smarty.session.USERDATA.username|escape}{else}Guest{/if} <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    	{if $smarty.session.AUTHENTICATED|default:"0" == 1}
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=account&action=edit"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers"><i class="fa fa-desktop fa-fw"></i> Workers</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                        {else}
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=login"><i class="fa fa-sign-in fa-fw"></i> Login</a>
                        <li><a href="{$smarty.server.SCRIPT_NAME}?page=register"><i class="fa fa-pencil fa-fw"></i> Sign Up</a>
                        </li>
                        {/if}
                    </ul>
                </li>
            </ul>
        </nav>
		
		<script type="text/javascript" src="{$PATH}/../global/js/number_format.js"></script>

<script>

  // Ajax API URL
  var url_api = "{$smarty.server.SCRIPT_NAME}?page=api&action=getpoolstatus&api_key={$GLOBAL.userdata.api_key}";
  var price_api = "https://api.coinmarketcap.com/v2/ticker/2475/";
  
  {literal}
  function refreshStaticData(data) {
	$('#navWorkers').html(number_format(data.getpoolstatus.data.workers));
    $('#navHash').html((number_format(data.getpoolstatus.data.hashrate/1000, 1)));
  }
  
    function refreshPrice(data) {
	$('#grlcPrice').html(number_format(data.data.quotes.USD.price), 3);
  }
  
  (function navStats() {
    $.ajax({
      url: url_api,
      dataType: 'json',
      cache : false,
      contentType : 'application/json; charset=utf-8',
      type : 'GET',
      success: function(data) {
        refreshStaticData(data);
      },
      complete: function() {
        setTimeout(navStats, {/literal}{($GLOBAL.config.statistics_ajax_long_refresh_interval * 1000)|default:"10000"}{literal})
      }
    });
  })();
  /*
    (function navPrice() {
    $.ajax({
      url: price_api,
      dataType: 'json',
      cache : false,
      contentType : 'application/json; charset=utf-8',
      type : 'GET',
      success: function(data) {
        refreshPrice(data);
      },
      complete: function() {
        setTimeout(navPrice, {/literal}{($GLOBAL.config.statistics_ajax_long_refresh_interval * 1000)|default:"10000"}{literal})
      }
    });
  })();*/
  
		{/literal}
		</script>
