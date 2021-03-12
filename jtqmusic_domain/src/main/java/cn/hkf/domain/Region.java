package cn.hkf.domain;

/**
 * 地区实体类，用来获取歌手的地区，数据库设置，页面只获取
 */
public class Region {

    private Integer region_id;
    private String region_name;

    public Integer getRegion_id() {
        return region_id;
    }

    public void setRegion_id(Integer region_id) {
        this.region_id = region_id;
    }

    public String getRegion_name() {
        return region_name;
    }

    public void setRegion_name(String region_name) {
        this.region_name = region_name;
    }

    @Override
    public String toString() {
        return "Region{" +
                "region_id=" + region_id +
                ", region_name='" + region_name + '\'' +
                '}';
    }
}

