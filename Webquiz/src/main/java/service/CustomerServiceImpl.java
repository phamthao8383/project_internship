package service;

import model.Customer;
import repository.CustomerRepository;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> getCustomerList() {
        return customerRepository.getCustomerList();
    }

    @Override
    public Customer getIdCustomer(int id) {
        return customerRepository.getIdCustomer(id);
    }

    @Override
    public int getIdMax() {
        return customerRepository.getIdMax();
    }

    @Override
    public List<Customer> getCustomerListPage(int pageIndex, int pageSize) {
        return customerRepository.getCustomerListPage(pageIndex,pageSize);
    }


   /* @Override
    public void addCustomerIndex(int index, Customer customer) {
        customerRepository.addCustomerIndex(index,customer);

    }*/

    @Override
    public void addCustomerList(Customer customer) {
        customerRepository.addCustomerList(customer);
    }

    @Override
    public void updateCustomerId(Customer customer, int id) {
        customerRepository.updateCustomerId(customer, id);
    }

    @Override
    public int countSearch() {
        return customerRepository.countSearch();
    }

    @Override
    public void deleteCustomer(int id) {
        customerRepository.deleteCustomer(id);
    }

}
