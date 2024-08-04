package iuh.edu.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import iuh.edu.entity.Item;
import iuh.edu.entity.Product;
import iuh.edu.entity.Order;
import iuh.edu.service.ProductService;
import iuh.edu.serviceImpl.ProductServiceImpl;

/**
 * Servlet implementation class AddtoCartController
 */
public class AddtoCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductServiceImpl();
    private DecimalFormat df = new DecimalFormat("#.000");

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int n = 0;
        int qty = 1;
        String id;

        if (request.getParameter("product-id") != null) {
            id = request.getParameter("product-id");
            Product product = productService.get(Integer.parseInt(id));

            if (product != null) {
                if (request.getParameter("qty") != null) {
                    qty = Integer.parseInt(request.getParameter("qty"));
                }

                try {
                    double productPrice = Double.parseDouble(product.getPrice());
                    double productDiscount = Double.parseDouble(product.getDiscount());

                    HttpSession session = request.getSession();

                    if (session.getAttribute("order") == null) {
                        Order order = new Order();
                        List<Item> listItems = new ArrayList<Item>();
                        Item item = new Item();
                        item.setQty(qty);
                        item.setProduct(product);
                        item.setPrice(productPrice - productPrice * (productDiscount / 100));
                        order.setSumPrice(0);
                        order.setSumPrice(order.getSumPrice() + item.getPrice());
                        listItems.add(item);
                        order.setItems(listItems);
                        n = listItems.size();
                        session.setAttribute("length_order", n);
                        session.setAttribute("order", order);
                        session.setAttribute("sumprice", df.format(order.getSumPrice()));
                    } else {
                        Order order = (Order) session.getAttribute("order");
                        List<Item> listItems = order.getItems();
                        boolean check = false;

                        for (Item item : listItems) {
                            if (Integer.parseInt(item.getProduct().getId()) == Integer.parseInt(product.getId())) {
                                item.setQty(item.getQty() + qty);
                                item.setPrice(item.getPrice()
                                        + (productPrice - productPrice * (productDiscount / 100)));
                                order.setSumPrice(order.getSumPrice() + item.getPrice());
                                check = true;
                            }
                        }

                        if (!check) {
                            Item item = new Item();
                            item.setQty(qty);
                            item.setProduct(product);
                            item.setPrice(productPrice - productPrice * (productDiscount / 100));
                            listItems.add(item);
                            order.setSumPrice(order.getSumPrice() + item.getPrice());
                        }

                        n = listItems.size();
                        session.setAttribute("length_order", n);
                        session.setAttribute("order", order);
                        session.setAttribute("sumprice", df.format(order.getSumPrice()));
                    }
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi số
                    e.printStackTrace(); // Hoặc log lỗi vào hệ thống log của ứng dụng
                    // Gửi về trang lỗi hoặc thông báo lỗi cho người dùng
                    response.sendRedirect(request.getContextPath() + "/view/client/cart");
                    return;
                }
            }
            response.sendRedirect(request.getContextPath() + "/view/client/cart");
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
