<#import "../../parts/common.ftl" as c>

<@c.page>


    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Заказы</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <#list orders as order>
                <div class="col-12">
                    <p>${order}</p>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/admin/order/${order.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/admin/order/${order.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>
        </div>
    </div>


    <form action="/admin/order/add" method="post">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <select name="client">
                        <#list clients as client>
                            <option value="${client.getId()}">${client.getUsername()}</option>
                        </#list>
                    </select>
                    <select name="status">
                        <#list statuses as status>
                            <option value="${status.name()}"
                                    <#if status.name() == "NOT_PAID">selected</#if>>${status.getStatus()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="formService">
            <div class="row justify-content-center service-1">
                <div class="col-md-10">
                    <p>
                        <select name="service-1" class="service-input">
                            <#list services as service>
                                <option class="serviceOption" value="${service.getId()}">Имя:${service.getName()}, Цена:${service.getPrice()}</option>
                            </#list>
                        </select>
                    </p>
                </div>
                <div class="col-2">
<#--                    <a href="" class="btn btn-danger" onclick="deleteService('service-1');">Удалить</a>-->
                </div>
            </div>

            <div class="pointService"></div>
            </div>


            <div class="row justify-content-center">
                <div class="col-md-12">
                    <p><div class="add-service btn btn-primary">Добавить услугу</div></p>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </div>
            </div>
        </div>
    </form>


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