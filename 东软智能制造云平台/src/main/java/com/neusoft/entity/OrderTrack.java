package com.neusoft.entity;

public class OrderTrack {
    private String scheduleNum;

    private String planNum;

    private String scheduleStatus;

    private String productNum;

    private String equmentNum;

    private String hegeCount;

    private String jiagongVount;

    private String by1;

    private String by2;

    private String by3;

    public String getScheduleNum() {
        return scheduleNum;
    }

    public void setScheduleNum(String scheduleNum) {
        this.scheduleNum = scheduleNum == null ? null : scheduleNum.trim();
    }

    public String getPlanNum() {
        return planNum;
    }

    public void setPlanNum(String planNum) {
        this.planNum = planNum == null ? null : planNum.trim();
    }

    public String getScheduleStatus() {
        return scheduleStatus;
    }

    public void setScheduleStatus(String scheduleStatus) {
        this.scheduleStatus = scheduleStatus == null ? null : scheduleStatus.trim();
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum == null ? null : productNum.trim();
    }

    public String getEqumentNum() {
        return equmentNum;
    }

    public void setEqumentNum(String equmentNum) {
        this.equmentNum = equmentNum == null ? null : equmentNum.trim();
    }

    public String getHegeCount() {
        return hegeCount;
    }

    public void setHegeCount(String hegeCount) {
        this.hegeCount = hegeCount == null ? null : hegeCount.trim();
    }

    public String getJiagongVount() {
        return jiagongVount;
    }

    public void setJiagongVount(String jiagongVount) {
        this.jiagongVount = jiagongVount == null ? null : jiagongVount.trim();
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