package com.neusoft.entity;

public class Equipment {
    private String equipmentNum;

    private String equipmentImgUrl;

    private String equipmentStatus;

    private String by1;

    private String by2;

    private String by3;

    public String getEquipmentNum() {
        return equipmentNum;
    }

    public void setEquipmentNum(String equipmentNum) {
        this.equipmentNum = equipmentNum == null ? null : equipmentNum.trim();
    }

    public String getEquipmentImgUrl() {
        return equipmentImgUrl;
    }

    public void setEquipmentImgUrl(String equipmentImgUrl) {
        this.equipmentImgUrl = equipmentImgUrl == null ? null : equipmentImgUrl.trim();
    }

    public String getEquipmentStatus() {
        return equipmentStatus;
    }

    public void setEquipmentStatus(String equipmentStatus) {
        this.equipmentStatus = equipmentStatus == null ? null : equipmentStatus.trim();
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