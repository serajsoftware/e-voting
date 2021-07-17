
package evoting.dto;

/**
 *
 * @author Keshri
 */
public class UserInfo {
    private String adharNo;
    private String password;
    private String userName;
    private String gender;
    private String emailId;
    private String mobileNo;
    private String address;
    private String city;
    private String userType;
    public UserInfo() {
    }

    public String getAdharNo() {
        return adharNo;
    }

    public void setAdharNo(String adharNo) {
        this.adharNo = adharNo;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "UserInfo{" + "adharNo=" + adharNo + ", password="+ password +", userName=" + userName + ", gender=" + gender + ", emailId=" + emailId + ", mobileNo=" + mobileNo + ", address=" + address + ", city=" + city + ", userType=" + userType + '}';
    }

    public UserInfo(String adharNo,String password, String userName, String gender, String emailId, String mobileNo, String address, String city, String userType) {
        this.adharNo = adharNo;
        this.password= password;
        this.userName = userName;
        this.gender = gender;
        this.emailId = emailId;
        this.mobileNo = mobileNo;
        this.address = address;
        this.city = city;
        this.userType = userType;
    }


}
