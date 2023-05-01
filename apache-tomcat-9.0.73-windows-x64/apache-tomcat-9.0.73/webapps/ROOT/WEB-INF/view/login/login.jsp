<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/24/2023
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Log in</title>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
    ></script>
</head>
<body>
<section class="vh-100"
         style="background-image: url('https://firebasestorage.googleapis.com/v0/b/lam-dep-trai-de1b4.appspot.com/o/107438939_p0.jpg?alt=media&token=e941ee28-d4c6-4a61-bac9-aa73d758ab02'); background-repeat: repeat; background-size: 50%;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img
                                    src="https://firebasestorage.googleapis.com/v0/b/lam-dep-trai-de1b4.appspot.com/o/107468322_p4.jpg?alt=media&token=615d49be-8486-4381-b602-1716a15a873f"
                                    alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;"/>
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form method="post" action="/user">

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <i class="fas fa-book-open-reader fa-2x me-3" style="color: firebrick;"></i>
                                        <a href="/home" class="text-black">
                                            <span class="h1 fw-bold mb-0">CREAD</span>
                                        </a>
                                    </div>

                                    <h6 class="fw-normal mb-3 pb-3 text-danger" style="letter-spacing: 1px;">
                                        <c:out value="${requestScope['message']}"/></h6>
                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your
                                        account</h5>

                                    <div class="form-outline mb-4">
                                        <input type="email" id="email" class="form-control form-control-lg" name="email"
                                               required/>
                                        <label class="form-label" for="email">Email address or phone number</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="password"
                                               class="form-control form-control-lg" name="password" required/>
                                        <label class="form-label" for="password">Password</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <input class="btn btn-dark btn-lg btn-block" type="submit" value="Log in">
                                    </div>

                                    <a class="small text-muted" href="#!">Forgot password?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a
                                            href="/signup"
                                            style="color: #393f81;">Register
                                        here</a></p>
                                    <a href="/term" class="small text-muted">Terms of use.</a>
                                    <a href="/term" class="small text-muted">Privacy policy</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
