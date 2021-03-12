package cn.hkf.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {

    private Integer user_id;
    private String user_account;
    private String user_password;
    private String user_name;
    private Integer user_statu; // 0 可用 1 锁定不可用
    private String user_email;
    private Integer user_sex;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date user_signupTime;
    private String user_signupTime_str;
    private String user_imgUrl;
    private String user_signature;
    private Integer user_type; //  0 普通用户 1 vip用户
    private String user_phone;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_account() {
        return user_account;
    }

    public void setUser_account(String user_account) {
        this.user_account = user_account;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Integer getUser_statu() {
        return user_statu;
    }

    public void setUser_statu(Integer user_statu) {
        this.user_statu = user_statu;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public Integer getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(Integer user_sex) {
        this.user_sex = user_sex;
    }

    public Date getUser_signupTime() {
        return user_signupTime;
    }

    public void setUser_signupTime(Date user_signupTime) {
        this.user_signupTime = user_signupTime;
    }

    public String getUser_signupTime_str() {
        return user_signupTime_str;
    }

    public void setUser_signupTime_str(String user_signupTime_str) {
        this.user_signupTime_str = user_signupTime_str;
    }

    public String getUser_imgUrl() {
        return user_imgUrl;
    }

    public void setUser_imgUrl(String user_imgUrl) {
        this.user_imgUrl = user_imgUrl;
    }

    public String getUser_signature() {
        return user_signature;
    }

    public void setUser_signature(String user_signature) {
        this.user_signature = user_signature;
    }

    public Integer getUser_type() {
        return user_type;
    }

    public void setUser_type(Integer user_type) {
        this.user_type = user_type;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }
}
