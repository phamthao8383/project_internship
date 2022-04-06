package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    public List<Customer>  getCustomerList();
    public Customer getIdCustomer(int id);
    public int getIdMax();
    public List<Customer> getCustomerListPage(int pageIndex, int pageSize);
    public void addCustomerList(Customer customer);
    public void updateCustomerId(Customer customer, int id);
    public int countSearch();
    public void deleteCustomer (int id);

}
