package controller;
import model.Customer;
import service.CustomerService;
import service.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/showCustomer")
public class CustomerServlet extends HttpServlet {
    //  Triển khai Dependence Injection
    private CustomerService customerService = new CustomerServiceImpl();
    private int pageSize = 5;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addNewCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            case "search":
                getCustomerListPage(request,response);
                break;
            default:
                getCustomerList(request,response);
                break;
        }
    }



    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action ==null) {
            action = "";
        }
        switch (action) {
            case "create":
                response.sendRedirect("customerhdl.jsp");
                break;
            case "update":
                goUpdate(request,response);
                break;
            case "search":
                getCustomerListPage(request,response);
            default:
                getCustomerListPage(request,response);
                break;
        }
    }


    private void getCustomerList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("listp", customerService.getCustomerList());

        request.getRequestDispatcher("/customer.jsp").forward(request, response);

    }

    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = customerService.getIdMax() + 1;
        System.out.println(id);
        String name = request.getParameter("name");
        String sex =request.getParameter("sex");
        String idCard =request.getParameter("idCard");
        String email =request.getParameter("email");
        String dateOfBirth =request.getParameter("dateOfBirth");
        String sdt =request.getParameter("sdt");
        String typeCustomer =request.getParameter("typeCustomer");
        String address =request.getParameter("address");

        Customer customer = new Customer(id,name, dateOfBirth,idCard,sex,sdt,email,typeCustomer,address);
        customerService.addCustomerList(customer);
        request.setAttribute("message" , "Thêm thành công!");
//        tới trang list customer
        getCustomerListPage(request,response);

    }

    private void goUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int index = Integer.parseInt(request.getParameter("index"));
        request.setAttribute("indexPage" , index);
        request.setAttribute("customer", customerService.getIdCustomer(id));
        request.getRequestDispatcher("/customerEdit.jsp").forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name =request.getParameter("name");
        String sex =request.getParameter("sex");
        String idCard =request.getParameter("idCard");
        String email =request.getParameter("email");
        String dateOfBirth =request.getParameter("dateOfBirth");
        String sdt =request.getParameter("sdt");
        String typeCustomer =request.getParameter("typeCustomer");
        String address =request.getParameter("address");

        Customer customer = new Customer(id,name, dateOfBirth,idCard,sex,sdt,email,typeCustomer,address);
        customerService.updateCustomerId(customer, id);
        request.setAttribute("message" , "Sửa thành công!");

//        tới trang list customer
        getCustomerListPage(request,response);

    }


    private void getCustomerListPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index == 0) {
            index = 1;
        }
        int count = customerService.countSearch();
        int engPage = count / pageSize;
        if(count % pageSize != 0) {
            engPage++;
        }
        request.setAttribute("countPage", engPage);
        request.setAttribute("indexPage", index);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("listp", customerService.getCustomerListPage(index, pageSize));
        request.getRequestDispatcher("/customer.jsp").forward(request, response);
    }


    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        response.sendRedirect("/showCustomer");

    }
}
