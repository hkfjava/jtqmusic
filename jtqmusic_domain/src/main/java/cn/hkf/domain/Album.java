package cn.hkf.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Album {

    private Integer album_id;
    private String album_info;
    private Integer album_collCount;
    private String album_imgUrl;
    private Integer album_state; // 0 已发布 1 未发布 3 没有版权
    private String album_name;
    private Integer album_songNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date album_issueDate;
    private String album_issueDate_str;
    private Integer singer_id;


    public Integer getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(Integer album_id) {
        this.album_id = album_id;
    }

    public String getAlbum_info() {
        return album_info;
    }

    public void setAlbum_info(String album_info) {
        this.album_info = album_info;
    }

    public Integer getAlbum_collCount() {
        return album_collCount;
    }

    public void setAlbum_collCount(Integer album_collCount) {
        this.album_collCount = album_collCount;
    }

    public String getAlbum_imgUrl() {
        return album_imgUrl;
    }

    public void setAlbum_imgUrl(String album_imgUrl) {
        this.album_imgUrl = album_imgUrl;
    }

    public Integer getAlbum_state() {
        return album_state;
    }

    public void setAlbum_state(Integer album_state) {
        this.album_state = album_state;
    }

    public String getAlbum_name() {
        return album_name;
    }

    public void setAlbum_name(String album_name) {
        this.album_name = album_name;
    }

    public Integer getAlbum_songNumber() {
        return album_songNumber;
    }

    public void setAlbum_songNumber(Integer album_songNumber) {
        this.album_songNumber = album_songNumber;
    }

    public Date getAlbum_issueDate() {
        return album_issueDate;
    }

    public void setAlbum_issueDate(Date album_issueDate) {
        this.album_issueDate = album_issueDate;
    }

    public String getAlbum_issueDate_str() {
        return album_issueDate_str;
    }

    public void setAlbum_issueDate_str(String album_issueDate_str) {
        this.album_issueDate_str = album_issueDate_str;
    }

    public Integer getSinger_id() {
        return singer_id;
    }

    public void setSinger_id(Integer singer_id) {
        this.singer_id = singer_id;
    }

    @Override
    public String toString() {
        return "Album{" +
                "album_id=" + album_id +
                ", album_info='" + album_info + '\'' +
                ", album_collCount=" + album_collCount +
                ", album_imgUrl='" + album_imgUrl + '\'' +
                ", album_state=" + album_state +
                ", album_name='" + album_name + '\'' +
                ", album_songNumber=" + album_songNumber +
                ", album_issueDate=" + album_issueDate +
                ", album_issueDate_str='" + album_issueDate_str + '\'' +
                ", singer_id=" + singer_id +
                '}';
    }
}
