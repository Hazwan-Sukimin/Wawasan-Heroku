<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wawasan Sales & Services</title>
        <!--SWEETALERT-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <jsp:include page="include/import-style.jsp"/>
        
        <style>
            a,ul,li{
                font-size: 20px;
                padding-right: 30px;
            }
            .btn-outline-primary {
                margin-top: 5px; 
                padding: 5px 10px;
                /* define values in pixels / Percentage or em. whatever suits 
                   your requirements */
            }
            .ptop{
                padding-top: 50px;
            }
            .ctop{
                padding-top: 150px;
            }
            body{
                /*background-color: lightgray;*/
            }
        </style>
        
        <script src="https://kit.fontawesome.com/5792396d29.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css"></link>

    </head>
    <body>
        <!-- Carousel + Navbar-->
        <jsp:include page="include/navbar.jsp"/>
        
        <!-- ## All content appear here ## -->
        <div class="container ptop" id='home'>
            <jsp:include page="include/carousel.jsp"/>
        </div>
        
        <div class="container my-5" id="contact">
            <div class="ctop"></div>
            
            <div class="row">
                <h2 class="text-center">Contact us</h2>
                <hr class="bg-muted" style="height: 5px; color: gray;">
                
                <p class=" text-center">For all enquiries, please email us using the form below.</p>
                <br><br>
                <p class='fw-bold h5'>How can we help you?</p>
                
                <div class="form-group mt-3">
                    <label>Description</label> <br>
                    <textarea style="resize: none;" class="form-control" rows="8"  name="description" placeholder="Description of inquiries"></textarea>
                </div>
                    
                <input type="submit" name="submit" value="Continue" class="btn text-white mt-5" style=' height: 60px; background-color: #6ECBA4'>
               
                
            </div>
        </div>
            
            <c:choose>
                <c:when test="${msgs.equals('Success')}">
                <script>
                    Swal.fire({
                        icon: 'success',
                        title: 'Logout',
                        text: 'You have successfully logout!',
                    }).then(function(){
                        location='${pageContext.request.contextPath}/';
                    });
                </script>
                </c:when>

            </c:choose>
          
        <!-- Footer Content -->
        <jsp:include page="include/footer.jsp"/>
        <script>

            var nav = document.querySelector('nav'); // get nav tag

            // make a listener to change navbar color when scrolling down
            window.addEventListener('scroll', function(){
                if(window.pageYOffset > 50){
                    nav.classList.add('bg-light', 'shadow');
                }else{
                    nav.classList.remove('bg-light', 'shadow');
                }
            });

        </script>
        <jsp:include page="include/import-script.jsp"/>
    </body>
</html>
