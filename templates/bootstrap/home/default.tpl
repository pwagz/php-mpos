
  <img src="site_assets/bootstrap/images/welcome.png" alt="Welcome to GRLC GANG 2.0" class="img-responsive center-block" />
  <h2 class="text-center">We've been expecting you.</h2>
  

 <div class="row" style="margin-top: 40px">
	<div class="panel panel-primary">
		<div class="panel-body">
		
			<div class="col-md-4">
				<h3 class="text-right">Why Mine With The Gang?</h3>
				<table class="table table-striped table-bordered" style="font-size: 1.4em;">
					  <tbody>
					
						<tr><td style="padding: 10px;">✔ 99.9% Up-time</td></tr>					
						<tr><td style="padding: 10px;">✔ Low Fees (0.5%)</td></tr>
						<tr><td style="padding: 10px;">✔ Per-Worker Stats, Monitoring & Notifications</td></tr>
						<tr><td style="padding: 10px;">✔ Custom Payout Thresholds</td></tr>
						<tr><td style="padding: 10px;">✔ Bonus GRLC Randomly Sent To All Miners</td></tr>
						<tr><td style="padding: 10px;">✔ Awesome Community</th></tr>
					</tbody>
					</table>
						
				</ul>
			</div>
			
			<div class="col-md-4">
				<img src="site_assets/bootstrap/images/grlcsmash.gif" alt="MINE WITH THE GANG!" class="img-circle img-responsive center-block" style="max-height: 340px;" />
			</div>
			
			<div class="col-md-4">
				<h3>Quick Stats</h3>
				  
					<table class="table table-striped table-bordered table-hover" style="font-size: 1.4em;">
					  <tbody>
						<tr>
						  <td>Total Active Workers</td>
						  <td>{$GLOBAL.workers}</td>
						</tr>
						<tr>
						  <td>Total Hash</td>
						  <td>{$GLOBAL.hashrate|round:1} {$GLOBAL.hashunits.pool}</td>
						</tr>
						<tr>
						  <td>Efficiency</td>
						  <td>{if $GLOBAL.roundshares.valid > 0}{($GLOBAL.roundshares.valid / ($GLOBAL.roundshares.valid + $GLOBAL.roundshares.invalid) * 100)|number_format:"2"}%{else}0%{/if}</td>
						</tr>
						<tr>
						<td>Total Valid Blocks</td>
						<td>{$LASTBLOCKSBYTIME.TotalValid|number_format}</td>
						</tr>
						<tr>
						<td>Est. Time per Block</td>
						<td><small>{$ESTTIME|seconds_to_words}</small></td>
						</tr>
						<tr>
						<td>Time Since Last</td>
						<td><small>{$TIMESINCELAST|seconds_to_words}</small></td>
						</tr>	
						<tr>
						<td>Last Block Finder</td>
						<td>{if $BLOCKSFOUND[0].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$BLOCKSFOUND[0].finder|default:"unknown"|escape}{/if}</td>
						</tr>							
						<tr>
						<td colspan="2" class="text-right"><a href="{$smarty.server.SCRIPT_NAME}?page=statistics&action=pool">View More...</a></td>
						</tr>
					  </tbody>
					</table>
				  
			</div>
		</div>
	</div>
</div>

  
<div style="margin-top: 25px; text-align: center;">
	<p>
		
		<a class="btn btn-success btn-lg" href="{$smarty.server.SCRIPT_NAME}?page=gettingstarted" role="button">Start Mining Now!</a><br />
		<br />
		<!--<a class="btn btn-primary" href="{$smarty.server.SCRIPT_NAME}?page=statistics&action=pool" role="button">Pool Stats</a>&nbsp;
		<a class="btn btn-primary" href="{$smarty.server.SCRIPT_NAME}?page=discord" role="button">Our Discord</a>-->
	</p>
</div>


<div class="well">
	<h3>Donation Address <small>GRLCGANGEdTfKcx98Vw3BXyMK3YncbnhKm</small></h3>
</div>


{if $GLOBAL.website.newsstyle|default:"0" == 0}
  {include file="home/news_all.tpl"}
{else}
  {include file="home/news_accordion.tpl"}
{/if}


