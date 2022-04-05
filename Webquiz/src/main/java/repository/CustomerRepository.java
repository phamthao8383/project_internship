package repository;

import model.Customer;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class
CustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();

    public List<Customer> getCustomerList() {
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT * FROM khach_hang");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                customerList.add(new Customer(  rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getString(5),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(2),
                        rs.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    public List<Customer> getCustomerListPage(int pageIndex, int pageSize) {
        List<Customer> customerList = new ArrayList<>();
        try {
            String queryListPage = "with x as(SELECT *, row_number() over (order by ma_khach_hang asc) as r  from khach_hang )\n" +
                    "select  * from x where  r between  ((? * ? ) - ? + 1) and ? * ?";
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(queryListPage);
            preparedStatement.setInt(1, pageIndex);
            preparedStatement.setInt(2 ,pageSize);
            preparedStatement.setInt(3, pageSize);
            preparedStatement.setInt(4, pageIndex);
            preparedStatement.setInt(5, pageSize);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                customerList.add(new Customer(  rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getString(5),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(2),
                        rs.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    public Integer getIdMax() {
        int id = 0;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT Max(ma_khach_hang) FROM khach_hang");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public Customer getIdCustomer(int id) {
        Customer customer = new Customer();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT * FROM khach_hang WHERE ma_khach_hang = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                customer = (new Customer(  rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(6),
                        rs.getString(5),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(2),
                        rs.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public void addCustomerList(Customer customer) {
        try {

            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection()
                    .prepareStatement("insert into khach_hang(ma_khach_hang, ma_loai_khach ,ho_ten, ngay_sinh, gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) value(?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1,customer.getId());
            preparedStatement.setInt(2,Integer.parseInt(customer.getCustomerType()));
            preparedStatement.setString(3,customer.getName());
            preparedStatement.setDate(4, Date.valueOf(customer.getDateOfBirth()));
            preparedStatement.setInt(5,Integer.parseInt(customer.getSex()));
            preparedStatement.setString(6,customer.getIdCard());
            preparedStatement.setString(7,customer.getSdt());
            preparedStatement.setString(8,customer.getEmail());
            preparedStatement.setString(9,customer.getAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCustomerId(Customer customer, int id) {
        try {
            String queryUpdate ="UPDATE khach_hang SET ma_loai_khach = ? , ho_ten = ?  , ngay_sinh = ? , gioi_tinh = ? , so_cmnd = ? , so_dien_thoai = ? , email = ? , dia_chi = ? WHERE ma_khach_hang = ?" ;
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement(queryUpdate);
            preparedStatement.setInt(1,Integer.parseInt(customer.getCustomerType()));
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setDate(3, Date.valueOf(customer.getDateOfBirth()));
            preparedStatement.setInt(4,Integer.parseInt(customer.getSex()));
            preparedStatement.setString(5,customer.getIdCard());
            preparedStatement.setString(6,customer.getSdt());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
            preparedStatement.setInt(9, id);
            int row = preparedStatement.executeUpdate();
            System.out.println("thành công rồi nè mấy cậu" + row);

        } catch (SQLException e) {
            System.out.println("lỗi rồi a ơiii");
            e.printStackTrace();

        }
    }

    public void deleteCustomer (int id) {
        try {
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement("Delete FROM khach_hang where ma_khach_hang = ? ");
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            System.out.println(row);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    phân trang
    public int countSearch() {
        try {
        PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT count(*) FROM khach_hang");
        ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
}
