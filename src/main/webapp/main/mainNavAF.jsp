<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <div class="yj-main-menubox">
    <div class="yj-main-menu">
      <img alt="" src="main/imgFolder/yj-main-menu1.png" />
    </div>
    <div class="yj-main-nav nav-hidden">
      <div class="nav-fakeDiv"></div>
      <div class="nav-info">
        <div class="nav-welcome">
          ${sessionScope.m_name }様<br />✿ ようこそ ✿
        </div>
      </div>
      <div class="nav-myPage">
        <a href="MemberDetailC"><h3>マイページ</h3></a>
      </div>
      <div class="nav-myPageList">
        <a href="MemberDetailC"><h3>• 会員情報</h3></a>
        <a href="mytemplateController"><h3>• テンプレート</h3></a>
        <a href="MyMeetingC"><h3>• 会リスト</h3></a>
      </div>
      <div class="nav-invitation">
        <a href="ProductController"><h3>商品紹介</h3></a>
      </div>
      <form action="MemberLogoutC" method="post">
        <div class="nav-logout">
          <button>Logout</button>
        </div>
      </form>
      <div class="nav-topBtn">
        <a href="#"
          ><img src="main/imgFolder/yj-main-topBtn.png" alt="nav-topBtn"
        /></a>
      </div>
    </div>
  </div>
</html>
