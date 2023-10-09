<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Sign Up</title>

    <%@include file="inc/header-links.jsp" %>

</head>

<!-- Body -->
<body>

    <main class="page-wrapper" style="height:100vh">
		
	<%@include file="inc/spinner.jsp" %>
	<%@include file="inc/navbar.jsp"%>

      <!-- Page content -->
      <section class="position-relative h-100 pt-5 pb-4">

        <!-- Sign up form -->
        <div class="container d-flex flex-wrap justify-content-center justify-content-xl-end h-100 pt-5">
          <div class="w-100 align-self-end pt-1 pt-md-4 pb-4" style="max-width: 526px;">
            <h1 class="text-center text-xl-start">Create Account</h1>
            <p class="text-center text-xl-start pb-3 mb-3">Already have an account? <a href="login.jsp" class="text-warning">Sign in here.</a></p>
            <form class="needs-validation" action="/bsc/Register" method="POST" novalidate>
              <div class="row">
                <div class="col-sm-6">
                  <div class="position-relative mb-4">
                    <label for="name" class="form-label fs-base">Full name</label>
                    <input type="text" id="name" name="name" class="form-control form-control-lg" required>
                    <div class="invalid-feedback position-absolute start-0 top-100">Please enter your name!</div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="position-relative mb-4">
                    <label for="email" class="form-label fs-base">Email</label>
                    <input type="email" id="email" name="email" class="form-control form-control-lg" required>
                    <div class="invalid-feedback position-absolute start-0 top-100">Please enter a valid email address!</div>
                  </div>
                </div>
                <div class="col-12 mb-4">
                  <label for="password" class="form-label fs-base">Password</label>
                  <div class="password-toggle">
                    <input type="password" id="password" name="password" class="form-control form-control-lg" required>
                    <label class="password-toggle-btn" aria-label="Show/hide password">
                      <input class="password-toggle-check" type="checkbox">
                      <span class="password-toggle-indicator"></span>
                    </label>
                    <div class="invalid-feedback position-absolute start-0 top-100">Please enter a password!</div>
                  </div>
                </div>
                <div class="col-12 mb-4">
                  <label for="password-confirm" class="form-label fs-base">Confirm password</label>
                  <div class="password-toggle">
                    <input type="password" id="password-confirm" class="form-control form-control-lg" required>
                    <label class="password-toggle-btn" aria-label="Show/hide password">
                      <input class="password-toggle-check" type="checkbox">
                      <span class="password-toggle-indicator"></span>
                    </label>
                    <div class="invalid-feedback position-absolute start-0 top-100">Please enter a password!</div>
                  </div>
                </div>
              </div>
              
              <button type="submit" class="btn btn-warning shadow-warning btn-lg w-100">Sign up</button>
            </form>
            <hr class="my-4">
            
          </div>

        </div>
        
        <!-- Background -->
        <div class="position-absolute top-0 start-0 w-50 h-100 bg-position-center bg-repeat-0 bg-size-cover d-none d-xl-block" style="background-image: url(assets/img/account/signup.png);"></div>
      </section>
    </main>

	<%@include file="inc/top-btn.jsp"%>
	<%@include file="inc/footer.jsp"%>
	<%@ include file="inc/footer-links.jsp" %>
  </body>
</html>