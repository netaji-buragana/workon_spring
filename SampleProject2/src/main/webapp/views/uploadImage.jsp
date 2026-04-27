<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">




<link rel="stylesheet"
	href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/dist/mdb5/standard/core.min.css">


<link rel="stylesheet" id="roboto-subset.css-css"
	href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/docs-app/css/mdb5/fonts/roboto-subset.css?ver=3.9.0-update.5"
	type="text/css" media="all">



<meta property="twitter:site" content="@MDBootstrap">
<meta property="twitter:creator" content="@MDBootstrap">
<meta property="twitter:image:src"
	content="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/pro/_main/assets/mdb5-about-v2.jpg">
<meta property="twitter:player"
	content="https://www.youtube.com/watch?v=rQryOSyfXmI&amp;ab_channel=Keepcoding">

<meta property="og:title"
	content="Bootstrap Menu with icons - free examples &amp; tutorial">
<meta property="og:description"
	content="Responsive Menu with icons built with Bootstrap 5. Simple examples of a few menus with icons. Easy to implement and customize.">
<meta property="og:image"
	content="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/content/en/_mdb5/standard/pro/_main/assets/mdb5-about-v2.jpg">
<meta property="og:url"
	content="https://mdbootstrap.com/docs/standard/extended/menu-with-icons/">
<meta property="og:site_name"
	content="MDB - Material Design for Bootstrap">
<meta property="og:locale" content="en_US">
<meta property="og:video"
	content="https://www.youtube.com/watch?v=rQryOSyfXmI&amp;ab_channel=Keepcoding">
<meta property="fb:admins" content="443467622524287">
<meta property="og:type" content="website">

<link rel="shortcut icon"
	href="https://mdbcdn.b-cdn.net/wp-content/themes/mdbootstrap4/favicon.ico">

<link rel="canonical"
	href="https://mdbootstrap.com/docs/standard/extended/menu-with-icons/">
<script async="" src="https://www.clarity.ms/eus-c/s/0.7.2/clarity.js"></script>
<script async="" src="https://www.clarity.ms/tag/f1su1ssihh"></script>
<script
	src="https://connect.facebook.net/signals/config/289867067833087?v=2.9.95&amp;r=stable"
	async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-E9PS2EVWYS&amp;l=dataLayer&amp;cx=c"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-W7MBMN"></script>
<script>
	window.dataLayer = window.dataLayer || [];
</script>




</head>
<body>
	







<form action="/saveImage1" method="POST" enctype="multipart/form-data">
    <input type="file" name="file" accept="image/*">
    <input type="submit" value="Upload">
</form>
<c:forEach var="image" items="${images}">
    <img   width="100" height="100" src="<c:url value='/image/${image.id}'/>" alt="${image.name}">
</c:forEach>



<img src="${pageContext.request.contextPath}/image/${id}" />

</body>



















</html>