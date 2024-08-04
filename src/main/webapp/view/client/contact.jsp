

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url" />


<!-- Start header section -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
	<img
		src="${pageContext.request.contextPath}/view/client/assets/images/contact-banner.png"
		alt="banner liên hệ">
	<div class="aa-catg-head-banner-area">
		<div class="container">
			<div class="aa-catg-head-banner-content">
				<h2>Liên hệ</h2>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/">Trang
							chủ</a></li>
					<li style="color: #fff">Thông tin liên hệ</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<!-- / catg header banner section -->
<!-- start contact section -->
<section id="aa-contact">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="aa-contact-area">
					<div class="aa-contact-top">
						<h2>Chúng tôi đang chờ để hỗ trợ bạn..</h2>
						<p>Nếu bạn nó bất cứ thắc mắc hay ý kiến gì cứ tìm đến chúng
							tôi.</p>
					</div>

					<!-- Contact address -->
					<div class="aa-contact-address">
						<div class="row">
							<div class="col-md-7">
								<div class="aa-contact-map">
								
									<iframe
									src="https://www.google.com/maps/dir//truong+dai+hoc+cong+ngiep/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3174deb3ef536f31:0x8b7bb8b7c956157b?sa=X&ved=2ahUKEwiK_cuiwdWCAxUBMN4KHU9IBggQ9Rd6BAg4EAA";
										width="100%" height="450" frameborder="0" style="border: 0;"
										allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
								</div>
							</div>
							<div class="col-md-5">
								<div class="aa-contact-address-right">
									<address>
										<h4>BLH Perfume</h4>
										<p>Liên hệ cho chúng tôi bất cứ khi nào bạn cần.</p>
										<p>
											<span class="fa fa-home"></span>12 Nguyễn Văn Bảo, Phường 4, Gò Vấp, Thành phố Hồ Chí Minh
										</p>
										<p>
											<span class="fa fa-phone"></span>0932015536
										</p>
										<p>
											<span class="fa fa-envelope"></span>Email:
											iuh.com#gmail.com
										</p>
									</address>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--  end content-->

<!--  footer-->
<jsp:include page="./footer/footer.jsp" flush="true" />
<!-- end footer-->



