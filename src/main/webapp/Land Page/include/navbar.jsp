<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header content -->
<div class="container mt-5">
    <!-- Nav bar -->
    <header class="mb-3 fixed-top header" id="header">
        <nav class="navbar mb-3 navbar-expand-lg navbar-light shadow">
            <div class="container">
                <a href="#home" class="navbar-brand">
                    <img src="Land Page/media/img/Simple Logo.png" alt="logo"  class="d-inline-block align-top"/>
                </a>

                <button class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#toggleMobileMenu"
                        aria-controls="toggleMobileMenu"
                        aria-expanded="false"
                        aria-lable="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="toggleMobileMenu">
                    <ul class="navbar-nav ms-auto text-center ">
                        <li> 
                            <a href="#home" class="nav-link">Home</a>
                        </li>
                       
                        <li>
                            <a href="#contact" class="nav-link">Contact Us</a>
                        </li>
                        
                        <li>
                            <div class="btn-group">
                                <a class="btn btn-primary px-3" href="Login/Login.jsp"><i class="fas fa-user mx-2"></i><span>Login</span></a>
                            </div>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
    </header>
</div>      
