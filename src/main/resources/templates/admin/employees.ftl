<#import "../parts/common.ftl" as c>

<@c.page>





    <div class="main-content"  style="background: 0;">

        <!-- content -->
        <div class="container-fluid content-top-gap">

            <div class = "data-tables">
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="card card_border p-4">
                            <h3 class="card__title position-absolute">Employees</h3>
                            <div class="table-responsive">
                                <div id="example_wrapper_2" class="dataTables_wrapper no-footer"><div class="dataTables_length" id="example_length_1"><label></label></div><table id="example_1" class="display dataTable no-footer" style="width: 100%;" role="grid" aria-describedby="example_info">
                                        <thead>
                                        <tr role="row" style = "background-color: var(--light-bg-color);">
                                            <th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Emp. Name: activate to sort column descending" style="width: 296px;">Id</th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Designation: activate to sort column ascending" style="width: 456px;">UserName</th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Joining date: activate to sort column ascending" style="width: 222px;">Role</th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Emp. Status: activate to sort column ascending" style="width: 241px;">Created</th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Emp. Status: activate to sort column ascending" style="width: 241px;">Updated</th>
                                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Emp. Status: activate to sort column ascending" style="width: 241px;">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                         <#list employees as employee>
                                            <tr role="row" class="odd"  style = "border-bottom: 2px solid #E7EDF6;">
                                                <td class="sorting_1" style = "padding: 8px 10px;" text="${employee.getId()}">${employee.getId()}</td>
                                                <td style = "padding: 8px 10px;" text="${employee.getUsername()}">${employee.getUsername()}</td>
                                                <td style = "padding: 8px 10px;" text="<#list employee.getRole() as r>${r}</#list>"><#list employee.getRole() as r>${r}</#list></td>
                                                <td style = "padding: 8px 10px;" text="${employee.getCreated()}">${employee.getCreated()}</td>
                                                <td style = "padding: 8px 10px;" text="${employee.getUpdated()}">${employee.getUpdated()}</td>
                                                <td style = "padding: 8px 10px;"><#--<a href="/admin/empl/${employee.getId()}/update"   class="badge badge-success">Update</a>--><a href="/admin/empl/${employee.getId()}/delete" class="badge badge-danger">Delete</a></td>
                                            </tr>
                                         </#list>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- //content -->
        </div>
    </div>

    <footer class="dashboard">
        <p>&copy 2020 All Rights Reserved | Design by IV</p>
    </footer>


    <button onclick="topFunction()" id="movetop" class="bg-primary" title="Go to top">
        <span class="fa fa-angle-up"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- /move top -->


    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/js/jquery-1.10.2.min.js"></script>

    <script src="/static/js/jquery.nicescroll.js"></script>
    <script src="/static/js/scripts.js"></script>

    <!-- close script -->
    <script>
        var closebtns = document.getElementsByClassName("close-grid");
        var i;

        for (i = 0; i < closebtns.length; i++) {
            closebtns[i].addEventListener("click", function () {
                this.parentElement.style.display = 'none';
            });
        }
    </script>
    <!-- //close script -->

    <!-- disable body scroll when navbar is in active -->
    <script>
        $(function () {
            $('.sidebar-menu-collapsed').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- disable body scroll when navbar is in active -->

    <!-- loading-gif Js -->
    <script src="/static/js/modernizr.js"></script>
    <script>
        $(window).load(function () {
            // Animate loader off screen
            $(".se-pre-con").fadeOut("slow");
        });
    </script>
    <!--// loading-gif Js -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/js/bootstrap.min.js"></script>

</@c.page>