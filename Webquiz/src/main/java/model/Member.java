package model;

public class Member extends User {
    double point;

    public Member() {
    }

    public Member(int userId,
                  String name,
                  String email,
                  String phone,
                  String address,
                  String image,
                  String account,
                  double point) {
        super(userId, name, email, phone, address, image, account);
        this.point = point;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }
}
