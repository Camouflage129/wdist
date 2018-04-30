<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="utf-8">
  <title>오늘 뭐 팔지?</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="css/jcarousel.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="skins/default.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />
  <link href="css/font-awesome.css" rel="stylesheet" />

  <!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
 
  <div id="wrapper">
    <!-- toggle top area -->
   
    <!-- end toggle top area -->
    <!-- start header -->
   <jsp:include page="header.jsp"></jsp:include>
    <!-- end header -->
    <section id="featured">
      <!-- start slider -->
      <!-- Slider -->
      <div id="nivo-slider">
        <div class="nivo-slider">
          <!-- Slide #1 image -->
          <img src="img/slides/nivo/plan_1900x600.jpg" alt="" title="#caption-1" />
          <!-- Slide #2 image -->
          <img src="img/slides/nivo/bar_1900x600.jpg" alt="" title="#caption-2" />
          <!-- Slide #3 image -->
          <img src="img/slides/nivo/brickwall_1900x600.jpg" alt="" title="#caption-3" />
        </div>
        <div class="container">
          <div class="row">
            <div class="span12">
              <!-- Slide #1 caption -->
              <div class="nivo-caption" id="caption-1">
                <div>
                  <h2>혹시, 새로운 창업을 준비중 이신가요?</h2>
                  <p>
<!--                     Lorem ipsum dolor sit amet nsectetuer nec Vivamus. Curabitu laoreet amet eget. Viurab oremd ellentesque ameteget. Lorem ipsum dolor sit amet nsectetuer nec vivamus. -->
					새로운 사업 및 창업 아이템으로는 수많은 종류가 있습니다. 그리고 어떤 지역으로 선택할 것인지도 쉽지 않은 문제입니다. 그것들 중에서 유망한 지역이나 서비스들을 선별해내기란 여간 어려운 것이 아닙니다.
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
              <!-- Slide #2 caption -->
              <div class="nivo-caption" id="caption-2">
                <div>
                  <h2>그렇다면 우리의 서비스를 주목해주세요.</h2>
                  <p>
<!--                     Lorem ipsum dolor sit amet nsectetuer nec Vivamus. Curabitu laoreet amet eget. Viurab oremd ellentesque ameteget. Lorem ipsum dolor sit amet nsectetuer nec vivamus. -->
					방대한 분량의 공공데이터와 사람들의 SNS(페이스북, 인스타그램, 트위터 등 )에서 자주 언급하는 키워드 및 해시태그(#)를 접목하여 빅데이터 기반으로 유망한 업종 및 지역을 알려줍니다.
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
              <!-- Slide #3 caption -->
              <div class="nivo-caption" id="caption-3">
                <div>
                  <h2>당신의 창업 준비에 큰 도움이 될 것입니다.</h2>
                  <p>
<!--                     Lorem ipsum dolor sit amet nsectetuer nec Vivamus. Curabitu laoreet amet eget. Viurab oremd ellentesque ameteget. Lorem ipsum dolor sit amet nsectetuer nec vivamus. -->
					이와 같은 우리의 서비스들을 잘 활용한다면, 상권 정보와 함께 사람들의 관심사 및 트렌드를 손쉽게 파악할 수 있기 때문에 시작과 동시에 사업이 망하는 확률은 확연히 줄어들게 될 것입니다.
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end slider -->
    </section>    
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                   <!--  <i class="icon-briefcase icon-circled icon-64 active"></i> -->
                    <i class="icon-home icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>서비스 소개</h6>
                    <p>
<!--                       Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis. -->
					우리가 어떤 서비스들을 제공하는지에 대해서 궁금하다면 아래의 버튼을 눌러주세요.
                    </p>
                    <a href="/intro.do">보러 가기</a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                   <!--  <i class="icon-desktop icon-circled icon-64 active"></i> -->
                   <i class="icon-food icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>업종별 검색</h6>
                    <p>
<!--                       Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis. -->
					업종별로 어떤 서비스가 유망한지에 대해서 궁금하다면 아래의 버튼을 눌러주세요.
                    </p>
                    <a href="/foodArea.do">보러 가기</a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                    <i class="icon-flag icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>지역별 검색</h6>
                    <p>
<!--                       Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis. -->
					지역별로 어떤 서비스가 유망한지에 대해서 궁금하다면 아래의 버튼을 눌러주세요.
                    </p>
                    <a href="/areaFood.do">보러 가기</a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                    <i class="icon-coffee icon-circled icon-64 active"></i>
                  
                  </div>
                  <div class="text">
                    <h6>고객지원센터</h6>
                    <p>
<!--                       Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis. -->
					궁금한 사항 및 문의사항이 있다면 <br>아래의 버튼을 눌러주세요.
                    </p>
                    <a href="/csBoard.do?num=1">보러 가기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        </section>
        <!-- divider -->
    <!--     <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div> -->
        <!-- end divider -->
        <!-- Portfolio Projects -->
       <!--  <div class="row">
          <div class="span12">
            <h4 class="heading">Some of recent <strong>works</strong></h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  Item Project and Filter Name
                  <li class="item-thumbs span3 design" data-id="id-0" data-type="web">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The City" href="img/works/full/image-01-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-01.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 design" data-id="id-1" data-type="icon">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Office" href="img/works/full/image-02-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-02.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-2" data-type="illustrator">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Mountains" href="img/works/full/image-03-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-03.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-2" data-type="illustrator">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Mountains" href="img/works/full/image-04-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-04.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-4" data-type="web">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Sea" href="img/works/full/image-05-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-05.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-5" data-type="icon">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Clouds" href="img/works/full/image-06-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-06.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-2" data-type="illustrator">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Mountains" href="img/works/full/image-07-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 design" data-id="id-0" data-type="web">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Dark" href="img/works/full/image-08-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="img/works/thumbs/image-08.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                </ul>
              </section>
            </div>
          </div>
        </div> -->
        <!-- End Portfolio Projects -->
        <!-- divider -->
<!--         <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div> -->
        <!-- end divider -->
 <!--        <div class="row">
          <div class="span12">
            <h4>Very satisfied <strong>clients</strong></h4>
            <ul id="mycarousel" class="jcarousel-skin-tango recent-jcarousel clients">
              <li>
                <a href="#">
					<img src="img/dummies/clients/client1.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client2.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client3.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client4.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client5.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client6.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client1.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client2.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client3.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client4.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client5.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="img/dummies/clients/client6.png" class="client-logo" alt="" />
					</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="bottom">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="aligncenter">
              <div id="twitter-wrapper">
                <div id="twitter">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->
	<jsp:include page="footer.jsp"></jsp:include> 
  </div>
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="js/jquery.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jcarousel/jquery.jcarousel.min.js"></script>
  <script src="js/jquery.fancybox.pack.js"></script>
  <script src="js/jquery.fancybox-media.js"></script>
  <script src="js/google-code-prettify/prettify.js"></script>
  <script src="js/portfolio/jquery.quicksand.js"></script>
  <script src="js/portfolio/setting.js"></script>
  <script src="js/jquery.flexslider.js"></script>
  <script src="js/jquery.nivo.slider.js"></script>
  <script src="js/modernizr.custom.js"></script>
  <script src="js/jquery.ba-cond.min.js"></script>
  <script src="js/jquery.slitslider.js"></script>
  <script src="js/animate.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="js/custom.js"></script>

</body>
</html>
