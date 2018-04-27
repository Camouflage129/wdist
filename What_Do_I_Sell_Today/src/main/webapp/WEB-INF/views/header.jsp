<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header>
      <div class="container ">
        <!-- hidden top area toggle link -->
        <div id="header-hidden-link">
          <a href="#" class="toggle-link" title="Click me you'll get a surprise" data-target=".hidden-top"><i></i>Open</a>
        </div>
        <!-- end toggle link -->
        <div class="row nomargin">
          <div class="span12">
            <div class="headnav">
              <c:if test="${empty userid}">
              <ul>
                <li><a id="signUpA" href="/signUp.do" data-toggle="modal"><i class="icon-user"></i> 회원가입</a></li>
                <li><a id="loginA" href="/login.do">로그인</a></li>
              </ul>
              </c:if>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="span4">
            <div class="logo">
              <a href="/main.do"><img src="css/img/logo.png" alt="" class="logo" /></a>
              <!-- <h1>Flat and trendy bootstrap template</h1> -->
            </div>
          </div>
          <div class="span8">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                    <li>
                      <a href="/intro.do"> 소개 </a>
                    </li>
                    <li class="dropdown">
                      <a href="#">분석서비스 <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a class="nav-link" href="/foodArea.do">업종별 검색</a></li>
                        <li><a class="nav-link" href="/areaFood.do">지역별 검색</a></li>
<!--                         <li><a href="pricingbox.html">지역별 검색</a></li> -->
                       </ul>
                    </li>
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
      
    </header>
    <div class="container">
          <div class="row">
            
         
    
    
    
    
    
    