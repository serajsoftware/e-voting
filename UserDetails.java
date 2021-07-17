
package evoting.dto;

import java.util.Objects;

/**
 *
 * @author Keshri
 */
public class UserDetails {

    @Override
    public String toString() {
        return "UserDetails{" + "userid=" + userid + ", password=" + password + ", username=" + username + ", address=" + address + ", city=" + city + ", email=" + email + ", mobile=" + mobile + ", gender=" + gender + '}';
    }
    private String userid;
    private String password;
    private String username;
    private String address;
    private String city;
    private String email;
    private long mobile;
    private String gender;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getMobile() {
        return mobile;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public UserDetails() {
    }


    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + Objects.hashCode(this.userid);
        hash = 97 * hash + Objects.hashCode(this.password);
        hash = 97 * hash + Objects.hashCode(this.username);
        hash = 97 * hash + Objects.hashCode(this.address);
        hash = 97 * hash + Objects.hashCode(this.city);
        hash = 97 * hash + Objects.hashCode(this.email);
        hash = 97 * hash + (int) (this.mobile ^ (this.mobile >>> 32));
        hash = 97 * hash + Objects.hashCode(this.gender);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final UserDetails other = (UserDetails) obj;
        if (this.mobile != other.mobile) {
            return false;
        }
        if (!Objects.equals(this.userid, other.userid)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        if (!Objects.equals(this.username, other.username)) {
            return false;
        }
        if (!Objects.equals(this.address, other.address)) {
            return false;
        }
        if (!Objects.equals(this.city, other.city)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.gender, other.gender)) {
            return false;
        }
        return true;
    }

    public UserDetails(String userid, String password, String username, String address, String city, String email, long mobile, String gender) {
        this.userid = userid;
        this.password = password;
        this.username = username;
        this.address = address;
        this.city = city;
        this.email = email;
        this.mobile = mobile;
        this.gender = gender;
    }

   
}
