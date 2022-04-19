package model;

public class Member extends User {
    double point;
    int role;

    public Member() {
    }

    public Member(int userId) {
        super(userId);
    }

    public Member(int userId, String account) {
        super(userId, account);
    }

    public Member(String name, String email, String phone, String address, double point, int role) {
        super(name, email, phone, address);
        this.point = point;
        this.role = role;
    }

    public Member(int userId,
                  String name,
                  String email,
                  String phone,
                  String address,
                  String image,
                  String account,
                  double point,
                  int role) {
        super(userId, name, email, phone, address, image, account);
        this.point = point;
        this.role = role;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
