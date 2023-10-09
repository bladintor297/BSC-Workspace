<aside class="col-lg-3 col-md-4 border-end pb-5 mt-n5" style="min-height:100vh;" >
	<div class="position-sticky top-0">
		<div class="text-center pt-5">
			<div class="d-table position-relative mx-auto mt-2 mt-lg-4 pt-5 mb-3">
				<img src="https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg" class="d-block rounded-circle"
					width="120" alt="John Doe">
				<button type="button"
					class="btn btn-icon btn-light bg-white btn-sm border rounded-circle shadow-sm position-absolute bottom-0 end-0 mt-4"
					data-bs-toggle="tooltip" data-bs-placement="bottom"
					title="Change picture">
					<i class="bx bx-refresh"></i>
				</button>
			</div>
			<h2 class="h5 mb-1"><%= session.getAttribute("name") %></h2>
			<p class="mb-3 pb-3"><%= session.getAttribute("email") %></p>
			<button type="button"
				class="btn btn-secondary w-100 d-md-none mt-n2 mb-3"
				data-bs-toggle="collapse" data-bs-target="#account-menu">
				<i class="bx bxs-user-detail fs-xl me-2"></i> Account menu <i
					class="bx bx-chevron-down fs-lg ms-1"></i>
			</button>
			<div id="account-menu"
				class="list-group list-group-flush collapse d-md-block">
				<a href="/bsc/Profile"
					class="list-group-item list-group-item-action d-flex align-items-center  active">
					<i class="bx bx-cog fs-xl opacity-60 me-2"></i> Account Details
				</a> 
				<a href="/bsc/ChangePassword"
					class="list-group-item list-group-item-action d-flex align-items-center">
					<i class="bx bx-lock-alt fs-xl opacity-60 me-2"></i> Password
				</a> 
				<a href="/bsc/Notification"
					class="list-group-item list-group-item-action d-flex align-items-center">
					<i class="bx bx-bell fs-xl opacity-60 me-2"></i> Notifications
				</a> 
				<a href="/bsc/Logout"
					class="list-group-item list-group-item-action d-flex align-items-center">
					<i class="bx bx-log-out fs-xl opacity-60 me-2"></i> Sign Out
				</a>
			</div>
		</div>
	</div>
</aside>
