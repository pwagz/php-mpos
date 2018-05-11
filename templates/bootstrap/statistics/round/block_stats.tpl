<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-bar-chart fa-fw"></i> Block Statistics
      </div>
	  <div class="panel-body">
	  <form action="{$smarty.server.SCRIPT_NAME}" method="POST" id='search'>
            <input type="hidden" name="page" value="{$smarty.request.page|escape}">
            <input type="hidden" name="action" value="{$smarty.request.action|escape}">
            <p>Block # <input type="text" class="pin" style="width: 110px;" name="search" value="{$smarty.request.height|default:"%"|escape}">
            <input type="submit" value="Go" class="btn btn-xs btn-primary"></p>
          </form>
	
      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover" style="margin-bottom: 0;">
          <tbody>
			
            <tr>
              <th>ID</th>
			  <th>Height</th>
              <th>Amount</th>
			  <th>Confirmations</th>
			  <th>Difficulty</th>
			  <th>Time</th>
			  <th>Shares</th>
			  <th>Finder</th>
			  
			</tr>
			<tr>
			  <td>{$BLOCKDETAILS.id|number_format:"0"|default:"0"}</td>
                            
			  {if ! $GLOBAL.website.blockexplorer.disabled}
              <td><a href="{$GLOBAL.website.blockexplorer.url}{$BLOCKDETAILS.blockhash}" target="_new">{$BLOCKDETAILS.height|number_format:"0"|default:"0"}</a></td>
              {else}
              <td>{$BLOCKDETAILS.height|number_format:"0"|default:"0"}</td>
              {/if}
			  
              <td>{$BLOCKDETAILS.amount|number_format|default:"0"}</td>
			  
              
              <td>{if $BLOCKDETAILS.confirmations >= $GLOBAL.confirmations}
              <font color="green">Confirmed</font>
              {else if $BLOCKDETAILS.confirmations == -1}
              <font color="red">Orphan</font>
              {else if $BLOCKDETAILS.confirmations == 0}0
              {else}{($GLOBAL.confirmations - $BLOCKDETAILS.confirmations)|default:"0"} left{/if}</td>
           
              <td>{$BLOCKDETAILS.difficulty|default:"0"}</td>
             
              <td>{$BLOCKDETAILS.time|default:"0"}</td>
           
              <td>{$BLOCKDETAILS.shares|number_format:"0"|default:"0"}</td>
         
              <td>{$BLOCKDETAILS.finder|default:"unknown"}</td>
            </tr>
			
	

          </tbody>
        </table>
		
      </div>
	   </div>
      <div class="panel-footer">
          <a href="{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page}&action={$smarty.request.action}&height={$BLOCKDETAILS.height}&prev=1" class="btn btn-sm btn-primary"><i class="fa fa-chevron-left fa-fw"></i> Prev</a>
          <a href="{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page}&action={$smarty.request.action}&height={$BLOCKDETAILS.height}&next=1" class="btn btn-sm btn-primary pull-right">Next <i class="fa fa-chevron-right fa-fw"></i></a>

      </div>
    </div>
  </div>
</div>
