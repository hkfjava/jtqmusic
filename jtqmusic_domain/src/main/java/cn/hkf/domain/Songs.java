package cn.hkf.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 歌曲实体
 */
public class Songs {

    private Integer songs_id;
    private String songs_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date songs_issueDate;
    private String songs_issueDate_str;
    private Integer songs_language; // 0 英语 1 中文  2 其他
    private String songs_language_str;
    private String songs_url;
    private Integer songs_downloadCount;
    private Integer songs_collCount;
    private Integer songs_playCount;
    private Integer singer_id;
    private Integer album_id;
    private Integer classify_id;

    public Integer getSongs_id() {
        return songs_id;
    }

    public void setSongs_id(Integer songs_id) {
        this.songs_id = songs_id;
    }

    public String getSongs_name() {
        return songs_name;
    }

    public void setSongs_name(String songs_name) {
        this.songs_name = songs_name;
    }

    public Date getSongs_issueDate() {
        return songs_issueDate;
    }

    public void setSongs_issueDate(Date songs_issueDate) {
        this.songs_issueDate = songs_issueDate;
    }

    public String getSongs_issueDate_str() {
        return songs_issueDate_str;
    }

    public void setSongs_issueDate_str(String songs_issueDate_str) {
        this.songs_issueDate_str = songs_issueDate_str;
    }

    public Integer getSongs_language() {
        return songs_language;
    }

    public void setSongs_language(Integer songs_language) {
        this.songs_language = songs_language;
    }

    public String getSongs_language_str() {
        return songs_language_str;
    }

    public void setSongs_language_str(String songs_language_str) {
        this.songs_language_str = songs_language_str;
    }

    public String getSongs_url() {
        return songs_url;
    }

    public void setSongs_url(String songs_url) {
        this.songs_url = songs_url;
    }

    public Integer getSongs_downloadCount() {
        return songs_downloadCount;
    }

    public void setSongs_downloadCount(Integer songs_downloadCount) {
        this.songs_downloadCount = songs_downloadCount;
    }

    public Integer getSongs_collCount() {
        return songs_collCount;
    }

    public void setSongs_collCount(Integer songs_collCount) {
        this.songs_collCount = songs_collCount;
    }

    public Integer getSongs_playCount() {
        return songs_playCount;
    }

    public void setSongs_playCount(Integer songs_playCount) {
        this.songs_playCount = songs_playCount;
    }

    public Integer getSinger_id() {
        return singer_id;
    }

    public void setSinger_id(Integer singer_id) {
        this.singer_id = singer_id;
    }

    public Integer getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(Integer album_id) {
        this.album_id = album_id;
    }

    public Integer getClassify_id() {
        return classify_id;
    }

    public void setClassify_id(Integer classify_id) {
        this.classify_id = classify_id;
    }
}
