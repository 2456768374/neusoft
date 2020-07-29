package com.neusoft.entity;

public class Factory {
    private String createUserid;

    private String factoryName;

    private String factoryImgUrl;

    private String factoryStatus;

    private String password;

    private String by1;

    private String by2;

    private String by3;

    public String getCreateUserid() {
        return createUserid;
    }

    public void setCreateUserid(String createUserid) {
        this.createUserid = createUserid == null ? null : createUserid.trim();
    }

    public String getFactoryName() {
        return factoryName;
    }

    public void setFactoryName(String factoryName) {
        this.factoryName = factoryName == null ? null : factoryName.trim();
    }

    public String getFactoryImgUrl() {
        return factoryImgUrl;
    }

    public void setFactoryImgUrl(String factoryImgUrl) {
        this.factoryImgUrl = factoryImgUrl == null ? null : factoryImgUrl.trim();
    }

    public String getFactoryStatus() {
        return factoryStatus;
    }

    public void setFactoryStatus(String factoryStatus) {
        this.factoryStatus = factoryStatus == null ? null : factoryStatus.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getBy1() {
        return by1;
    }

    public void setBy1(String by1) {
        this.by1 = by1 == null ? null : by1.trim();
    }

    public String getBy2() {
        return by2;
    }

    public void setBy2(String by2) {
        this.by2 = by2 == null ? null : by2.trim();
    }

    public String getBy3() {
        return by3;
    }

    public void setBy3(String by3) {
        this.by3 = by3 == null ? null : by3.trim();
    }
}