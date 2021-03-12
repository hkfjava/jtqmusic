package cn.hkf.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 歌手实体
 */
public class Singer {
    private Integer singer_id;
    private String singer_name;
    private Integer singer_sex; // 0 为男， 1为女
    private String singer_info;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date singer_birth;
    private String singer_birth_str;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date singer_timeOut;
    private String singer_timeOut_str;
    private Integer singer_collCount; // 默认 为0
    private Integer singer_heat;    // 默认 为0
    private String singer_imgUrl;
    private Integer region_id;
    private Integer classify_id;

    public String getSinger_birth_str() {
        return singer_birth_str;
    }

    public void setSinger_birth_str(String singer_birth_str) {
        this.singer_birth_str = singer_birth_str;
    }

    public String getSinger_timeOut_str() {
        return singer_timeOut_str;
    }

    public void setSinger_timeOut_str(String singer_timeOut_str) {
        this.singer_timeOut_str = singer_timeOut_str;
    }

    public Integer getClassify_id() {
        return classify_id;
    }

    public void setClassify_id(Integer classify_id) {
        this.classify_id = classify_id;
    }

    public Integer getSinger_id() {
        return singer_id;
    }

    public void setSinger_id(Integer singer_id) {
        this.singer_id = singer_id;
    }

    public String getSinger_name() {
        return singer_name;
    }

    public void setSinger_name(String singer_name) {
        this.singer_name = singer_name;
    }

    public Integer getSinger_sex() {
        return singer_sex;
    }

    public void setSinger_sex(Integer singer_sex) {
        this.singer_sex = singer_sex;
    }

    public String getSinger_info() {
        return singer_info;
    }

    public void setSinger_info(String singer_info) {
        this.singer_info = singer_info;
    }

    public Date getSinger_birth() {
        return singer_birth;
    }

    public void setSinger_birth(Date singer_birth) {
        this.singer_birth = singer_birth;
    }

    public Date getSinger_timeOut() {
        return singer_timeOut;
    }

    public void setSinger_timeOut(Date singer_timeOut) {
        this.singer_timeOut = singer_timeOut;
    }

    public Integer getSinger_collCount() {
        return singer_collCount;
    }

    public void setSinger_collCount(Integer singer_collCount) {
        this.singer_collCount = singer_collCount;
    }

    public Integer getSinger_heat() {
        return singer_heat;
    }

    public void setSinger_heat(Integer singer_heat) {
        this.singer_heat = singer_heat;
    }

    public String getSinger_imgUrl() {
        return singer_imgUrl;
    }

    public void setSinger_imgUrl(String singer_imgUrl) {
        this.singer_imgUrl = singer_imgUrl;
    }

    public Integer getRegion_id() {
        return region_id;
    }

    public void setRegion_id(Integer region_id) {
        this.region_id = region_id;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "singer_id=" + singer_id +
                ", singer_name='" + singer_name + '\'' +
                ", singer_sex=" + singer_sex +
                ", singer_info='" + singer_info + '\'' +
                ", singer_birth=" + singer_birth +
                ", singer_timeOut=" + singer_timeOut +
                ", singer_collCount=" + singer_collCount +
                ", singer_heat=" + singer_heat +
                ", singer_imgUrl='" + singer_imgUrl + '\'' +
                ", region_id=" + region_id +
                ", classify_id=" + classify_id +
                '}';
    }
}
