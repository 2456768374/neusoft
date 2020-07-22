package com.neusoft.entity;

public class Equipment {
    private String equipmentNum;

    private String equipmentName;

    private String equipmentImgUrl;

    private Integer equipmentStatus;

    public String getEquipmentNum() {
        return equipmentNum;
    }

    public void setEquipmentNum(String equipmentNum) {
        this.equipmentNum = equipmentNum == null ? null : equipmentNum.trim();
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName == null ? null : equipmentName.trim();
    }

    public String getEquipmentImgUrl() {
        return equipmentImgUrl;
    }

    public void setEquipmentImgUrl(String equipmentImgUrl) {
        this.equipmentImgUrl = equipmentImgUrl == null ? null : equipmentImgUrl.trim();
    }

    public Integer getEquipmentStatus() {
        return equipmentStatus;
    }

    public void setEquipmentStatus(Integer equipmentStatus) {
        this.equipmentStatus = equipmentStatus;
    }
}