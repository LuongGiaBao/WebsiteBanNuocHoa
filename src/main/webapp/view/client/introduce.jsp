<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/assets" var="url" />
<!-- Start header section -->
<jsp:include page="./header/mainHeader.jsp" flush="true" />


<section id="aa-catg-head-banner">
	<img
		src="${pageContext.request.contextPath}/view/client/assets/images/Banner1.jpg"
		alt="banner sản phẩm" width="100%">
	<div class="aa-catg-head-banner-area">
		<div class="container">
			<div class="aa-catg-head-banner-content">
				<h2>Giới thiệu</h2>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/">Trang
							chủ</a></li>
					<li style="color: #fff">Giới thiệu</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section id="aa-product-category">
	<div class="container">
		<div class="row">
			<div>
				<h1 style="text-align: center; color: red;">BLH PERFUME</h1>
				<p>Dịch vụ luôn là trọng tâm của BLHperfume trong việc phát
					triển công ty, với việc đơn giản hoá các thao tác mua hàng, cải
					thiện và đa dạng hoá các hình thức mua hàng như website, facebook,
					instagram, showroom đều được tối ưu, thay đổi để thân thiện và
					chuyên nghiệp hơn, mang tới những trải nghiệm mua sắm tốt hơn dành
					cho khách hàng. Chất lượng, uy tín là yếu tố then chốt để
					BLHperfume có thể duy trì và không ngừng phát triển trong vòng hơn
					6 năm qua, tất các các sản phẩm được cung cấp, bán tại namperfume
					đều là sản phẩm chính hãng, chúng tôi cam kết hoàn tiền 200% nếu
					khách hàng phát hiện hàng giả. BLHperfume coi sự thành công của
					khách hàng chính là thành công của chính mình, và mong muốn được
					nhận thêm nhiều góp ý, đóng góp và những lời động viện, tin tưởng
					của quý khách hàng để ngày càng hoàn thiện hơn nữa trong tương lai.
					Namperfume luôn tự hào là thương hiệu nước hoa nhận được nhiều phản
					hồi tốt nhất Việt Nam. Trân trọng cảm ơn.</p>
				<img src="${url}/images/banner5.jpg" alt="Thực phẩm sạch"
					/ width="100%"> <br /> <br> <br />
			</div>
		</div>
	</div>
</section>

<!--  footer-->
<jsp:include page="./footer/footer.jsp" flush="true" />
<!-- end footer-->
