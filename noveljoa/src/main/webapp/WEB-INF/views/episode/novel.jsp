<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charSet="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta name="next-head-count" content="2" />
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="anonymous" />
<link rel="stylesheet" data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&amp;display=swap" />
<link rel="preload"	href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" as="style" />
<link rel="stylesheet" href="https://pagestage-cdn.kakaoent.com/web/_next/static/css/6e5d8ba319c77348.css" data-n-g="" />
<link rel="stylesheet" type="text/css" href="/noveljoa/_next/static/css/font.css" />
<noscript data-n-css=""></noscript>
<!-- jQuery CDN설정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style data-href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700&display=swap"></style>

<script type="text/javascript">

$(function(){
	
	//좋아요
	 <%-- $.ajax({
		url : "/novelLike.do",
		data : "num_novel=<%=request.getParameter("num_novel")%>",
		type: "get",
		dataType : "json",
		error : function(xhr){
			alert("문제 발생.");
			console.log(xhr.status);
		},
		success : function(jsonObj){
			var len = jsonArr.length;
			var article="";
			let cnt=0;
			
			if(cnt == 0){
				article="종아요 설정";
			}//end if
			
			$("#empTab").append(article);
		}
	});//전체 리스트 출력 --%>
	
	
	
	
	// 조아요 공개
	$("#goodImg").click(function(){
		var good = "http://localhost/noveljoa/_next/static/images/good_on.png";
		var cancelGood = "http://localhost/noveljoa/_next/static/images/good_off.png";
		
		if($(this).attr("src") == cancelGood){	
			alert("좋아요");
			$("#good").val(1); // 좋아요?
		}else if($(this).attr("src") == good){	
			alert("좋아요 취소");
			$("#good").val(0);  // 좋아요 취소
		} 
		$("#likeFrm").submit();
	}); //private
	
	// 신고하기
	$("#reportImg").click(function(){
		alert("a");
		window.open("report_popup.do","popup","width=500,height=803,resizable=no,top="+(window.screenY+100) +",left="+(window.screenX+100));
	});
	
	// 첫화 보기
	$("#firstEp").click(function(){
		
	});
	
	
});//ready
</script>

</head>

<body>
	
	<div id="__next" data-reactroot="">
	<div style="display: none; background-color: canvas; color-scheme: light"></div>
	<div class="lightMode h-full">
	<div class="flex flex-col h-full">
	<div class="z-1">
					
	<div>
		<jsp:include page="../../../_next/header_user_login_search.jsp"/>
	</div>		
	</div>
	
	<main class="flex-1">
		<div class="relative -z-1"></div>
		<div class="flex-1">

		<main class="flex-1">
			<div class="flex flex-col min-h-[100vh]">
			<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
				
				<header class="relative overflow-hidden">
					<div class="flex my-48">
					<div class="flex flex-[0_0_auto]">
						<div class="flex relative shrink-0 items-start overflow-hidden h-181 w-116" style="height: 181px;">
							<span style="box-sizing: border-box; display: inline-block; overflow: hidden; width: 116px; height: 181px; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;">
							<img src="http://localhost/noveljoa/_next/static/images/novel_thumb/${ searchNovel.photo }" decoding="async"
								data-nimg="fixed" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;">
							</span>
						</div>
					</div>
					<div class="flex flex-col ml-28 flex-1 items-start">
						<h1 class="typo-dp1 mb-8 flex items-center break-all">${searchNovel.novelTitle}</h1>
						<div class="flex typo-md3 items-center">
							<span>${searchNovel.id}</span><br><br>
							<span class="mx-4 text-10 mx-8 text-grey20">|</span>
							<div class="text-grey80">
								${searchNovel.age eq 1 ? '전체이용가':'15세 이용가'}
							</div>
							<span class="mx-4 text-10 mx-8 text-grey20">|</span>
							<div class="text-grey60">
								<c:choose>
									<c:when test="${searchNovel.genre eq 1}">판타지</c:when>
									<c:when test="${searchNovel.genre eq 8}">로맨스</c:when>
									<c:otherwise>자유	</c:otherwise>
								</c:choose> 
								
							</div>
						</div>
						<div>${searchNovel.intro}</div>
						<div class="flex mt-30 flex-1 items-end">
						
							<div class="flex items-center">
								<button class="flex items-center justify-center border-1 appearance-none bg-black border-black text-white disabled:border-grey20 disabled:bg-grey20 disabled:text-grey60 px-24 py-12 typo-md2-b mr-8"
									id="firstEp" type="button" >첫회 읽기</button>
									&nbsp;&nbsp;&nbsp;
									
								<!-- 좋아요 -->
								<label>${searchNovel.likeCnt}&nbsp;&nbsp;&nbsp;</label>
 								<img id="goodImg" src= " ${like eq 1 ? 'http://localhost/noveljoa/_next/static/images/good_on.png':'http://localhost/noveljoa/_next/static/images/good_off.png'}" alt="좋아요"/>

								<form action="like.do" id="likeFrm" method="post">
									<input type="hidden" id="num_member" name="num_member" value="${num_member}" />
									<input type="hidden" id="num_novel" name="num_novel" value="${ep.num_novel}"/>
								</form>	
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								
								<!-- 신고 버튼 -->
								
								<label>${searchNovel.reportCnt}&nbsp;&nbsp;&nbsp;</label>
								<c:choose>
									<c:when test="${report eq 1}"><label>신고완료</label></c:when>
									<c:otherwise><img id="reportImg" src="http://localhost/noveljoa/_next/static/images/report.png" style="width: 40px; height: 40px;" alt="신고"/></c:otherwise>
								</c:choose>
								<form action="report_popup.do" id="reportFrm" method="POST">
									<input type="hidden" id="num_member" name="num_member" value="${num_member}" />
									<input type="hidden" id="num_novel" name="num_novel" value="${ep.num_novel}" />
									<input type="hidden" id="id" name=id value="${id}"/>
								</form>
								
							</div>
						
						</div>
					</div>
					</div>
				</header>
			</div>
			
			<!-- 회차 개수 -->
			<div class="border-b-1 border-black/10">
				<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
					<div class="flex overflow-x-auto scrollbar-hide desktop:overflow-x-hidden">
						<a class="typo-md1-b mr-24 min-w-[fit-content] px-4 py-14 desktop:typo-lg3 border-b-2 !font-bold text-black">회차목록</a>
					</div>
				</div>
			</div>
			
			<div class="flex mx-auto w-full max-w-default flex-row flex-wrap desktop:px-22 px-18">
			<div class="grid grid-cols-12 grid-rows-[auto] gap-x-12  w-full mt-32 mb-80 flex-1 desktop:mt-48 desktop:mb-0">
			<div class="flex flex-col col-span-full">
			<div>
				<div class="flex items-center">
					<div class="typo-dp3 mr-6">회차</div>
					<span class="typo-g-sm2 -mb-[0.2em] !typo-g-lg1 text-grey60">(${fn:length(epList)})</span>
				</div>
				<div class="flex w-full items-center justify-between border-b-1 py-16">
					<div class="relative typo-sm1 rounded-full bg-grey20 py-6 pl-14 pr-8 desktop:bg-transparent desktop:px-0 ml-8">
						<path fill-rule="evenodd" clip-rule="evenodd"
							d="M7.99936 11L2.99872 6.06282L4.05259 4.99541L7.99936 8.8921L11.9461 4.99541L13 6.06282L7.99936 11Z"
							fill="currentColor"></path>
					</div>
				</div>
			</div>
				
			<!-- 회차 목록들 -->
			<div id="empTab">
				<c:if test="${empty epList }">
					<article class="flex items-start border-b-1 border-black/10 py-16 px-0 desktop:py-22 desktop:px-30">
						작성된 에피소드가 없습니다.
					</article><br>
				</c:if>
				
				<c:forEach var="ep" items="${epList}" varStatus="status">
					<article class="flex items-start border-b-1 border-black/10 py-16 px-0 desktop:py-22 desktop:px-30">
						<div class="flex typo-g-md2 mt-2 mr-12 desktop:mr-16 desktop:typo-g-lg2">${fn:length(epList)-status.index}</div>
						
						<div class="flex flex-1 flex-col desktop:flex-row">
						<a class="flex w-full shrink" href="read.do?num_novel=${ep.num_novel}&num_episode=${ep.num_episode}">
						<div class="flex flex-1 flex-col justify-start overflow-hidden desktop:mr-80">
						<h3 class="flex typo-md2 desktop:typo-lg2 mb-8 items-center desktop:mb-16">
						<div class="truncate after:inline-block after:w-0 shrink">${ep.title }</div></h3>
						<div class="flex typo-sm2 whitespace-pre-line text-grey60 desktop:whitespace-normal mb-14 desktop:mb-0">
						<div class="flex flex-wrap items-center text-grey60">
						<span>${ep.visit }</span>
						<span class="mx-4 text-10 !mx-6 mb-1 block text-black/10 desktop:!mx-8">|</span>
						<span class="typo-g-sm2 -mb-[0.2em]"><fmt:formatDate value="${ep.make }" pattern="yyyy.MM.dd"/></span>
					</div></div></div></a></div></article><br> 
				</c:forEach>
			</div>
			
		</div>
		</div>
		</main>
	<!-- footer -->
	<div>
		<jsp:include page="../../../_next/footer.jsp"/>
	</div>
</body>
</html>
