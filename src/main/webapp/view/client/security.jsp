<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url" />
<!-- Start header section -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />

<section id="aa-catg-head-banner">
	<img
		src="${pageContext.request.contextPath}/view/client/assets/images/banner_tc.jpg"
		alt="banner sản phẩm">
	<div class="aa-catg-head-banner-area">
		<div class="container">
			<div class="aa-catg-head-banner-content">
				<h2>Chính sách bảo mật</h2>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/">Trang
							chủ</a></li>
					<li style="color: #fff">Chính sách</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section id="aa-product-category">
	<div class="container">
		<div class="row">
			<div>
				<h1 style="text-align: center; color: red;">Chính Sách Bảo Mật</h1>
				<strong>Cám ơn quý khách đã truy cập vào website BLH Perfume
					</strong><br>
				<br>
				<p>Hiện nay, vấn đề bảo mật thông tin đã trở thành vấn đề nóng
					trên tất cả các diễn đàn, điều này không chỉ gây khó khăn cho các
					tổ chức, cá nhân tham gia truy cập và giao dịch mà còn gây nên
					những phiền toái vượt ra ngoài tầm kiểm soát của hệ thống. Chính
					sách bảo mật và chia sẻ thông tin khách hàng của BLHperfume.net như
					một lời cam kết với mong muốn nâng cao chất lượng dịch vụ, bảo đảm
					an toàn thông tin của các cá nhân, tổ chức khi tham gia truy cập
					hoặc giao dịch trực tiếp trên website BLHperfume.net. Chúng tôi
					hiểu bảo vệ và sử dụng hợp lí thông tin của bạn cũng chính là bảo
					vệ lòng tin và sự yêu mến của bạn dành cho chúng tôi.
				</p>
			</div>
		</div>
	</div>
</section>

<!--  footer-->
<jsp:include page="./footer/footer.jsp" flush="true" />
<!-- end footer-->
