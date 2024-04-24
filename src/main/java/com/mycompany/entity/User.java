package com.mycompany.entity;

public class User {
    private int user_id;
    private String username;
    private String email_id;
    private String userPassword;
    private String userPhone;
    private String userPic;
    private String userAddress;
    private String userType;

    public int getUser_id() {
        return user_id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail_id() {
        return email_id;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }



    public User(int user_id, String username, String email_id, String userPassword, String userPhone, String userPic, String userAddress,String userType) {
        this.user_id = user_id;
        this.username = username;
        this.email_id = email_id;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User(String username, String email_id, String userPassword, String userPhone, String userPic, String userAddress,String userType) {
        this.username = username;
        this.email_id = email_id;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", username=" + username + ", email_id=" + email_id + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + ", userType=" + userType + '}';
    }
    
}
