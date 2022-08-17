<!-- Footer -->
      <footer class=" sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; WAWASAN-RTS </span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

 <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/Login/vendor/jquery/jquery.min.js"> </script>
  <script src="${pageContext.request.contextPath}/Login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/Login/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages -->
  <script src="${pageContext.request.contextPath}/Login/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/Login/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/Login/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <script>
    $(document).ready(function() {
      $('#fileTable').DataTable({});
    });
    
    $(document).ready(function() {
      $('#fileTable2').DataTable({});
    });
    
    $(document).ready(function() {
      $('#fileTable3').DataTable({});
    });
  </script>
  
  
  <script>
    /** add active class and stay opened when selected */
    var url = window.location;

    // for sidebar menu entirely but not cover treeview
    $('ul.nav-sidebar a').filter(function() {
        return this.href == url;
    }).addClass('active');

    // for treeview
    $('ul.nav-treeview a').filter(function() {
        return this.href == url;
    }).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');
  </script>

</body>

</html>
