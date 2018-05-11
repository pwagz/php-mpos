 <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-info">
        <div class="panel-heading">
          <i class="fa fa-question fa-fw"></i> Getting Started Guide
        </div>
        <div class="panel-body">
     <h1>Welcome to the GRLC GANG!</h1>   
	 <h4><strong>Please note:</strong> This guide assumes that you already have basic knowledge of what Garlicoin is and have a wallet set up. If you do not have a wallet or have never mined before, please start <a href="https://guide.garli.co.in"  target="_blank">here</a>.</h4>
	 <hr />
    <h4>1. <strong>Create an account</strong></h4>
      <ul>
        <li>Register <a href="{$smarty.server.SCRIPT_NAME}?page=register">here</a>, or login if you already have account</li>
      </ul>
	  
    <h4>2. <strong>Create a worker for each rig that you will mine from</strong></h4>	  
	   <ul>
	   <li>Our pool will show detailed info for each of your <a href="{$smarty.server.SCRIPT_NAME}?page=account&action=workers">workers</a></li>
	   <li>You will use a worker name & password to configure your miner(s) rather than using your Garlicoin address</li>
	   <li>You can configure email & push notifications in the event that one of your rigs goes down </li>
	</ul>
    <h4>3. <strong>Configure your miner</strong></h4>
      <ul>
		<li>If you do not yet have a miner, please download one <a href="https://www.grlc.life/miners/" target="_blank">here</a></li>
		<li>The pool stratum address is <em>stratum+tcp://{$SITESTRATUMURL|default:$smarty.server.SERVER_NAME}:{$SITESTRATUMPORT|default:"3333"}</em></li>
		<li>You must use <em>username.workername</em> as your username and <em>workerpassword</em> as the password</li>
      </ul>
	  
	  <p>For example, if you are using ccminer on windows, your batch file may look like this:</p>
	  <pre>ccminer-x64.exe --algo=allium -i 20 stratum+tcp://{$SITESTRATUMURL|default:$smarty.server.SERVER_NAME}:{$SITESTRATUMPORT|default:"3333"} -u <em>username</em>.<em>WorkerName</em> -p <em>WorkerPassword</em> --max-temp=85</pre>
	  
	  <p>If you are unsure where to put this code, please have a look at the general mining guides for your OS & hardware on <a href="https://guide.garli.co.in/" target="_blank">Garlic Recipes</a> or <a href="https://discord.gg/mQkNMjq">Join our Discord</a>, where we'll be happy to assist you! </p>
	  
    

    <h4>4. <strong>Set your payout address & prefrences on your Account page</strong></h4>
      <ul>
        <li>Enter the Garlicoin address you'd like to be paid at into your account settings</li>
		<li>You can specify an optional payment threshold (and other settings) from this page as well</li>
		<li>We recommend using a payment threshold of at <em>least</em> 0.5 GRLC. While low hashrates may take awhile to earn this much, it will cut down on the transaction inputs that your wallet has to deal with and improve usability</li> 
      </ul>

        </div>
      </div>
    </div>
    <!-- /.col-lg-12 -->
  </div>
