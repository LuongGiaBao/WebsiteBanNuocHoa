<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
  <!-- Start header section -->
  <jsp:include page = "./header/mainHeader.jsp" flush = "true" />
  
  
  
  <section id="aa-catg-head-banner">
   <img src="${pageContext.request.contextPath}/view/client/assets/images/banner-product.png" alt="banner sản phẩm">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Hình thức thanh toán</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>  
          <li style="color:#fff">Hình thức thanh toán</li>       
        </ol>
      </div>
     </div>
   </div>
  </section>
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
      	<div>
      		<h1 style ="text-align: center; color: red;">Các hình thức thanh toán của BLH Perfume</h1>
      		
			<strong>1.Tài khoản ngân hàng Vietcombank: </strong>
			<p style ="margin-left: 20px;">Tên: XXXXXXXXX<br>
			Ngân hàng: VietinBank chi nhánh XXX<br>
			Số tài khoản: XXXXXXXX</p>
			
			<i>Sau khi thanh toán, nếu gặp bất kì sự cố nào vui lòng liên hệ tới số Hotline 123456789</i><br><br>
      	</div>
      </div>
     </div>
    </section>
    
<!--  footer-->
 <jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->
      