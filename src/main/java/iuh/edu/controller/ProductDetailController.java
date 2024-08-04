package iuh.edu.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import iuh.edu.entity.Catalog;
import iuh.edu.entity.Product;
import iuh.edu.entity.Review;
import iuh.edu.service.CategoryService;
import iuh.edu.service.ProductService;
import iuh.edu.service.ReviewService;
import iuh.edu.serviceImpl.CategoryServicesImpl;
import iuh.edu.serviceImpl.ProductServiceImpl;
import iuh.edu.serviceImpl.ReviewServicesImpl;

public class ProductDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServicesImpl();
    private ProductService productService = new ProductServiceImpl();
    private ReviewService reviewService = new ReviewServicesImpl();
    private DecimalFormat df = new DecimalFormat("#.000");

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            Product detail_product = productService.get(Integer.parseInt(id));
            req.setAttribute("detail_product", detail_product);

            List<Catalog> name_cate_of_product = cateService.getCateByProduct(Integer.parseInt(id));
            req.setAttribute("name_cate_of_product", name_cate_of_product);

            String idCate = detail_product.getCatalog_id();
            List<Product> productListCate = productService.getProductById(Integer.parseInt(idCate));
            req.setAttribute("productById", productListCate);

            List<Review> reviewById = reviewService.getReviewById(Integer.parseInt(id));
            req.setAttribute("reviewbyid", reviewById);

            List<Product> productList = productService.getAll();
            req.setAttribute("productlist", productList);

            // Giá giảm
            List<Product> productsList1 = new ArrayList<Product>();

            for (Product product : productList) {
                try {
                    double discount = Double.parseDouble(product.getDiscount());

                    // Chuyển đổi giá trị discount và tính giá mới
                    double discountedPrice = Double.parseDouble(product.getPrice()) * (1 - (discount / 100));

                    Product product1 = productService.get(Integer.parseInt(product.getId()));
                    product1.setPrice(String.valueOf(df.format(discountedPrice)));
                    productsList1.add(product1);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi số
                    e.printStackTrace(); // Hoặc log lỗi vào hệ thống log của ứng dụng
                    // Bạn có thể thêm xử lý khác tùy thuộc vào yêu cầu của ứng dụng
                }
            }

            req.setAttribute("productlist1", productsList1);

            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/product-detail.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            // Xử lý các ngoại lệ chung ở đây
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/");
        }
    }
}
