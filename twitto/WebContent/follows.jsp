<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ついっと|フォロー</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style_flw.css">
<link rel="stylesheet" href="css/style_tw.css">
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<script src="js/jquery-3.5.1.min.js"></script>


</head>
<body>
	<!-- サイドメニュー -->
	<nav>
		<div class="menu">
			<p class="home"><button onClick="location.href='http://localhost:8080/D20201006_keiji/index.html'" class="homeBtn">
				<img src="img/airplane.png" alt="TOP">
			</button></p>
			<p>
				<a href="follow">
					<img src="img/account.png" alt="フォロー" class="menuImg">
					<span>ホーム</span>
				</a>
			</p>
			<p>
				<a href="account">
					<img src="img/follow.png" alt="アカウント" class="menuImg">
					<span>プロフィール</span>
				</a>
			</p>
			<p>
				<a href="#" data-toggle="modal" data-target="#Modal">
					<img src="img/mail.png" alt="メッセージ" class="menuImg">
					<span>メッセージ</span>
				</a>
			</p>
			<p>
				<a href="search">
					<img src="img/search.png" alt="検索" class="menuImg">
					<span>検索</span>
				</a>
			</p>
			<p>
				<a href="update">
					<img src="img/setting.png" alt="設定" class="menuImg">
					<span>設定</span>
				</a>
			</p>
			<p>
				<a href="logout">
				<img src="img/logout.png" alt="ログアウト" class="menuImg">
				<span>ログアウト</span>
				</a>
			</p>
		</div>
	</nav>

	<!-- フォロー、フォロワー一部表示 -->

	<div class="return">
		<div class="return_wa">
			<img src="img/return.png" alt="return" onClick="location.href='http://localhost:8080/D20201006_keiji/account'">
			<div class="rename">
				<span id="nm" class="nm"><%= request.getAttribute("name") %></span>
				<span id="userId" class="nm"><%= request.getAttribute("userId") %></span>
			</div>
		</div>
	</div>
	<nav>
		<div class="tab_wa">
			<div class="tab">
				<div class="flwtab" id="flwtab1">
					<a href="fdisp?id=0"><span>フォロー</span></a>
				</div>
				<div class="flwtab" id="flwtab2">
					<a href="fdisp?id=1"><span>フォロワー</span></a>
				</div>
			</div>
		</div>
	</nav>
	<div class="tab_screen">
		<% ArrayList<HashMap<String, String>> flw = (ArrayList<HashMap<String, String>>)request.getAttribute("flw"); %>
		<% for(HashMap<String, String> log: flw) { %>
		<div class="fl_list">
			<div class="fl_top">
				<div class="fl_img">
					<img src="img/top.png" alt="top">
				</div>
				<div class="fl_right">
					<div class="fl_top2">
						<div class="fl_name">
							<a href="otherac?other_uId=<%= log.get("userId") %>">
							<span id="name"><%= log.get("name") %></span>
							<span id="followId"><%= log.get("userId") %></span>
							</a>
						</div>
						<button class="follow_btn" data-id="<%= log.get("userId") %>">
							<span id="follow">フォロー</span>
							<span id="hover">解除</span>
						</button>
					</div>
					<div class="fl_self">
						<p id="self">
							<%= log.get("self") %>
						</p>
					</div>
				</div>
			</div>
		</div>
		<%} %>
	</div>

	<!-- モーダル・ダイアログ1 -->
	<div class="modal fade" id="Modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">誰へ送りますか？</h4>
				</div>
				<div class="modal-body">
					<!-- tab -->
					<div role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                        	<a href="#follow" aria-controls="follow" role="tab" data-toggle="tab">フォロー</a>
                        </li>
                        <li role="presentation">
                        	<a href="#follower" aria-controls="follower" role="tab" data-toggle="tab">フォロワー</a>
                        </li>
                    </ul>
					<!-- フォローリスト -->
					<div class="tab-content">
					<div id="follow" role="tabpanel" class="tab-pane active">
						<% ArrayList<HashMap<String, String>> flw3 = (ArrayList<HashMap<String, String>>)request.getAttribute("flw"); %>
						<% for(HashMap<String, String> log: flw3) { %>
						<div class="fl_list">
							<a href="mail?addressId=<%= log.get("userId") %>">
								<div class="fl_top">
									<div class="fl_img">
										<img src="img/top.png" alt="top">
									</div>
									<div class="fl_right">
										<div class="fl_top2">
											<div class="fl_name">
												<span id="name"><%= log.get("name") %></span>
												<span id="followId"><%= log.get("userId") %></span>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<%} %>
					</div>
					<!-- フォロワーリスト -->
					<div id="follower" role="tabpanel" class="tab-pane">
							<% ArrayList<HashMap<String, String>> flw4 = (ArrayList<HashMap<String, String>>)request.getAttribute("flwer"); %>
							<% for(HashMap<String, String> log: flw4) { %>
							<div class="fl_list">
								<a href="mail?addressId=<%= log.get("userId") %>">
									<div class="fl_top">
										<div class="fl_img">
											<img src="img/top.png" alt="top">
										</div>
										<div class="fl_right">
											<div class="fl_top2">
												<div class="fl_name">
													<span id="name"><%= log.get("name") %></span>
													<span id="followId"><%= log.get("userId") %></span>
												</div>
											</div>
										</div>
									</div>
								</a>
							</div>
							<%} %>
						</div>
					</div>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>


	<script src="js/follow_ajax.js"></script>
</body>
</html>