<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-qq"></i> Weibo Social Authentication</div>
			<div class="panel-body">
				<p>
					Register a new <strong>QQ Application</strong> via
					<a href="http://connect.qq.com//">connect.qq.com</a> and then paste
					your application details here. Your callback URL is yourdomain.com/auth/qq/callback
				</p>
				<br />
				<form class="sso-qq">
					<div class="form-group">
						<label for="id">App ID</label>
						<input type="text" name="id" title="App Key" class="form-control" placeholder="App ID"><br />
					</div>
					<div class="form-group">
						<label for="secret">App Key</label>
						<input type="text" name="secret" title="App Key" class="form-control" placeholder="App Key">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">QQ Control Panel</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">Save Settings</button>
			</div>
		</div>
	</div>
</div>

<script>
	require(['settings'], function(Settings) {
		Settings.load('sso-qq', $('.sso-qq'));

		$('#save').on('click', function() {
			Settings.save('sso-qq', $('.sso-qq'), function() {
				app.alert({
					type: 'success',
					alert_id: 'qq-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				});
			});
		});
	});
</script>