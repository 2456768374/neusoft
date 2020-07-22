package com.neusoft.entity;

public class Factory {
    private String createUserid;

    private String factoryName;

    private String factoryImgUrl;

    private Integer factoryStatus;

    private String password;

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

    public Integer getFactoryStatus() {
        return factoryStatus;
    }

    public void setFactoryStatus(Integer factoryStatus) {
        this.factoryStatus = factoryStatus;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}