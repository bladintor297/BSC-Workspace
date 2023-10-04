<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ page import="com.bsc.beans.Users"%>
<%@page import="com.bsc.beans.Notifications"%>
<%@page import="java.util.ArrayList"%>



   
<!DOCTYPE html>
<html>

<body>
</body>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Silicon | Account - Messages</title>

  <!-- SEO Meta Tags -->
  <meta name="description" content="Silicon - Multipurpose Technology Bootstrap Template">
  <meta name="keywords"
    content="bootstrap, business, creative agency, mobile app showcase, saas, fintech, finance, online courses, software, medical, conference landing, services, e-commerce, shopping cart, multipurpose, shop, ui kit, marketing, seo, landing, blog, portfolio, html5, css3, javascript, gallery, slider, touch, creative">
  <meta name="author" content="Createx Studio">

  <!-- Viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Favicon and Touch Icons -->
  <link rel="apple-touch-icon" sizes="180x180" href="assets/favicon/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
  <link rel="manifest" href="assets/favicon/site.webmanifest">
  <link rel="mask-icon" href="assets/favicon/safari-pinned-tab.svg" color="#6366f1">
  <link rel="shortcut icon" href="assets/favicon/favicon.ico">
  <meta name="msapplication-TileColor" content="#080032">
  <meta name="msapplication-config" content="assets/favicon/browserconfig.xml">
  <meta name="theme-color" content="#ffffff">

  <!-- Vendor Styles -->
  <link rel="stylesheet" media="screen" href="assets/vendor/boxicons/css/boxicons.min.css" />
  <link rel="stylesheet" media="screen" href="assets/vendor/swiper/swiper-bundle.min.css" />

  <!-- Main Theme Styles + Bootstrap -->
  <link rel="stylesheet" media="screen" href="assets/css/theme.min.css">

  <!-- Page loading styles -->
  <style>
    .page-loading {
      position: fixed;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 100%;
      -webkit-transition: all .4s .2s ease-in-out;
      transition: all .4s .2s ease-in-out;
      background-color: #fff;
      opacity: 0;
      visibility: hidden;
      z-index: 9999;
    }

    .dark-mode .page-loading {
      background-color: #0b0f19;
    }

    .page-loading.active {
      opacity: 1;
      visibility: visible;
    }

    .page-loading-inner {
      position: absolute;
      top: 50%;
      left: 0;
      width: 100%;
      text-align: center;
      -webkit-transform: translateY(-50%);
      transform: translateY(-50%);
      -webkit-transition: opacity .2s ease-in-out;
      transition: opacity .2s ease-in-out;
      opacity: 0;
    }

    .page-loading.active>.page-loading-inner {
      opacity: 1;
    }

    .page-loading-inner>span {
      display: block;
      font-size: 1rem;
      font-weight: normal;
      color: #9397ad;
    }

    .dark-mode .page-loading-inner>span {
      color: #fff;
      opacity: .6;
    }

    .page-spinner {
      display: inline-block;
      width: 2.75rem;
      height: 2.75rem;
      margin-bottom: .75rem;
      vertical-align: text-bottom;
      border: .15em solid #b4b7c9;
      border-right-color: transparent;
      border-radius: 50%;
      -webkit-animation: spinner .75s linear infinite;
      animation: spinner .75s linear infinite;
    }

    .dark-mode .page-spinner {
      border-color: rgba(255, 255, 255, .4);
      border-right-color: transparent;
    }

    @-webkit-keyframes spinner {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }

    @keyframes spinner {
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
  </style>

  <!-- Theme mode -->
  <script>
    let mode = window.localStorage.getItem('mode'),
      root = document.getElementsByTagName('html')[0];
    if (mode !== null && mode === 'dark') {
      root.classList.add('dark-mode');
    } else {
      root.classList.remove('dark-mode');
    }
  </script>

  <!-- Page loading scripts -->
  <script>
    (function () {
      window.onload = function () {
        const preloader = document.querySelector('.page-loading');
        preloader.classList.remove('active');
        setTimeout(function () {
          preloader.remove();
        }, 1000);
      };
    })();
  </script>
</head>


<!-- Body -->

<body>

  <!-- Page loading spinner -->
  <div class="page-loading active">
    <div class="page-loading-inner">
      <div class="page-spinner"></div><span>Loading...</span>
    </div>
  </div>


  <!-- Page wrapper for sticky footer -->
  <!-- Wraps everything except footer to push footer to the bottom of the page if there is little content -->
  <main class="page-wrapper">




    <!-- Page content -->
    <section class="container pt-5">
      <div class="row">


        <!-- Sidebar (User info + Account menu) -->
        <aside class="col-lg-3 col-md-4 border-end pb-5 mt-n5">
          <div class="position-sticky top-0">
            <div class="text-center pt-5">
              <div class="d-table position-relative mx-auto mt-2 mt-lg-4 pt-5 mb-3">
                <img src="assets/img/avatar/18.jpg" class="d-block rounded-circle" width="120" alt="John Doe">
                <button type="button"
                  class="btn btn-icon btn-light bg-white btn-sm border rounded-circle shadow-sm position-absolute bottom-0 end-0 mt-4"
                  data-bs-toggle="tooltip" data-bs-placement="bottom" title="Change picture">
                  <i class="bx bx-refresh"></i>
                </button>
              </div>
              <h2 class="h5 mb-1">John Doe</h2>
              <p class="mb-3 pb-3">jonny@email.com</p>
              <button type="button" class="btn btn-secondary w-100 d-md-none mt-n2 mb-3" data-bs-toggle="collapse"
                data-bs-target="#account-menu">
                <i class="bx bxs-user-detail fs-xl me-2"></i>

                Account menu
                <i class="bx bx-chevron-down fs-lg ms-1"></i>
              </button>
              <div id="account-menu" class="list-group list-group-flush collapse d-md-block">
                <a href="/bsc/profile.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                  <i class="bx bx-cog fs-xl opacity-60 me-2"></i>
                  Account Details
                </a>
                <a href="/bsc/change-password.jsp"
                  class="list-group-item list-group-item-action d-flex align-items-center">
                  <i class="bx bx-lock-alt fs-xl opacity-60 me-2"></i>
                  Password
                </a>
                <a href="/bsc/Notifications"
                  class="list-group-item list-group-item-action d-flex align-items-center active">
                  <i class="bx bx-bell fs-xl opacity-60 me-2"></i>
                  Notifications
                </a>
                <a href="account-signin.html" class="list-group-item list-group-item-action d-flex align-items-center">
                  <i class="bx bx-log-out fs-xl opacity-60 me-2"></i>
                  Sign Out
                </a>
              </div>
            </div>
          </div>
        </aside>



        <!-- Account messages -->
        <div class="col-md-8 col-lg-9 pb-5 mb-lg-2 mb-lg-4 pt-md-5 mt-n3 mt-md-0">
          <div class="ps-md-3 mt-md-2 pt-md-4 pb-md-2">
            <div class="row g-0 border rounded-3 shadow-sm position-relative overflow-hidden">

              <div id="contactsList" class="col-lg-12">
                <div
                  class="offcanvas-lg offcanvas-start position-absolute position-lg-relative h-100 bg-secondary shadow-none border-end"
                  data-bs-scroll="true" data-bs-backdrop="false" style="max-height: 712px;">
                  <div class="card-header w-100 border-0 p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                      <h1 class="h3 mb-0">Notifications</h1>
                      <button type="button"
                        class="btn btn-link nav-link bg-faded-primary-hover d-lg-none py-2 ps-2 pe-3 me-n3"
                        data-bs-dismiss="offcanvas" data-bs-target="#contactsList">
                        <i class="bx bx-x fs-xl me-1"></i>
                        Close
                      </button>
                    </div>

                  </div>


                  <!-- Notifications Here -->

                  <div class="list-group">
                  <!-- Loop here -->
                      <% ArrayList<Notifications> notificationlist = (ArrayList<Notifications>)request.getAttribute("notificationlist");

                          for (Notifications notification:notificationlist){

                          %>

		                    <a href="#" class="list-group-item list-group-item-action " aria-current="true">
		                      <div class="d-flex w-100 justify-content-between">
		                        <h5 class="mb-1"> <%= notification.getTitle() %></h5>
		                        <small><%= notification.getDateTime() %></small>
		                      </div>
		                      <p class="mb-1"> <%= notification.getContent() %></p>
		                    
		                    </a>
		                  <%} %>

                  </div>

       

                </div>
              </div>


            </div>
          </div>
        </div>

        <!-- Back to top button -->
        <a href="#top" class="btn-scroll-top" data-scroll>
          <span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span>
          <i class="btn-scroll-top-icon bx bx-chevron-up"></i>
        </a>


        <!-- Vendor Scripts -->
        <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Main Theme Script -->
        <script src="assets/js/theme.min.js"></script>
</body>

</html>