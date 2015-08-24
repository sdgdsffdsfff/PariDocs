<?php
 include_once("stiePublic.php");
?>



<div class="ads-contuiter">


    <div id="header" class="move-aciton">
        <div class="set-width-tool">
            <div class="logo">
                <p><img src="images/logo.png" /> | 登录-注册</p>
                <p class="websit-name">亚洲现金制在线博彩服务娱乐公司</p>
            </div>
        </div>
    </div>

    <div id="arcle">
        <div class="h-login-banner banner blur"><img src="http://pic1.bbzhi.com/fengjingbizhi/gaoqingxiphotoshopshumafengjingbizhidiliuji/nature_photo_art_manipulation_3_1920x1200_43225_14.jpg" /></div>
        <div class="login-contruter">
            <div class="table">
                <div class="td">
                    <div class="input-box scale-action" >
                        <div class="ads-row t_menu">
                            <div class="ads-c-4 li"><a class="atice" href="javascript:;" >登   录</a></div>
                            <div class="ads-c-8 li"><a href="javascript:;" >快速注册</a></div>
                        </div>
                        <div class="ads-row i-box">
                            <div class="ads-row e-i">
                                <div class="inpput-group">
                                    <label>用户名：</label>
                                    <input class="form-control" type="text" />
                                </div>
                                <div class="inpput-group">
                                    <label>密   码：</label>
                                    <input class="form-control" type="password" />
                                </div>

                                <div class="inpput-group">
                                    <label>&nbsp;</label>
                                    <input type="checkbox" /> 自动登录 | <a href="javascript:;" >忘记密码</a>？
                                </div>

                                <div class="inpput-group">
                                    <label>&nbsp;</label>
                                    <div class="btn-control">
                                        <a id="ac-login" class="btn" href="javascript:;">登录</a>
                                    </div>
                                </div>

                            </div>


                            <div class="ads-row e-i">

                                <div class="inpput-group">
                                    <label>用户名：</label>
                                    <input class="form-control" type="text" />
                                </div>
                                <div class="inpput-group">
                                    <label>邮  箱：</label>
                                    <input class="form-control" type="text" />
                                </div>

                                <div class="inpput-group">
                                    <label>密   码：</label>
                                    <input class="form-control" type="password" />
                                </div>

                                <div class="inpput-group">
                                    <label>&nbsp;</label>
                                    <div class="btn-control">
                                        <a class="btn" href="javascript:;">快速注册</a>
                                    </div>
                                </div>


                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="footer" class="fixed move-aciton" >
        <div class="set-width-tool">
            <img class="logo"  src="images/parner-logo.jpg" />
            <div class="info">
                <h5>Winner Mayfair limited集团旗下</h5>
                <p>正式取得菲律宾政府卡格杨政府Cagayan leisure and Resort Corporation ( www.firstcagayan.com ) 在线博彩牌照授权。</p>
                <p>关于我们 | 集团简介 | 咨询帮助</p>
            </div>

        </div>
    </div>



</div>


<script type="text/javascript" >


    document.onreadystatechange = subSomething;//当页面加载状态改变的时候执行这个方法.
    function subSomething()
    {

        if(document.readyState == 'complete') //当页面加载状态
        {
            $('#header').CSS3Trans({
                inClassName :'move-down'
            },function(){});


            $('#footer').CSS3Trans({
                inClassName :'move-top'
            },function(){});
        }


    }

    function show(index){
        var other = index== 0 ? 1 : 0;
        $('.i-box .e-i').eq(other).stop().hide();
        $('.i-box .e-i').eq(index).stop().fadeIn();
    }

    function showLoadingImg(){
        $('.banner').html('图片加载中...');
    }
    function hideLoadingImg(){
        $('.banner').html('');
    }



    var banner=new Image();
    banner.src = $('.banner img').attr('src');
    showLoadingImg();

    banner.onload = function(){
        hideLoadingImg();
        $('.banner').css({background:'url("'+banner.src+'")'}).html('');
    };

    c.ready(function(){


        $('.t_menu .li').each(function(k){
            $(this).click(function(){
                if($(this).find('a').hasClass('atice')) return false;
                $(this).find('a').addClass('atice');
                $(this).siblings('.li').find('a').removeClass('atice');
                show(k);
            });
        });



        $('#ac-login').click(function(){

            c.API.ajax.request(
                'test.php?id=3' // URL
                , 'GET' // request type
                , {} // data
                ,'json' // datatype
                ,{
                    showIcon : true
                    ,theme:0
                    ,elem :$('#main')
                }
                , function(data){

                    //alert(data);

                });


        });
    })

</script>

</body>
</html>



