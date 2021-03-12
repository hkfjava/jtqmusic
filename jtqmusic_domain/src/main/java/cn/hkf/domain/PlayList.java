package cn.hkf.domain;

/**
 * 用于播放资源的存在
 */
public class PlayList {
    private Integer singer_id;
    private String singer_name;
    private String album_imgUrl;
    private Integer album_id;
    private String album_name;
    private Integer songs_id;
    private String songs_name;
    private String songs_url;

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

    public String getAlbum_imgUrl() {
        return album_imgUrl;
    }

    public void setAlbum_imgUrl(String album_imgUrl) {
        this.album_imgUrl = album_imgUrl;
    }

    public Integer getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(Integer album_id) {
        this.album_id = album_id;
    }

    public String getAlbum_name() {
        return album_name;
    }

    public void setAlbum_name(String album_name) {
        this.album_name = album_name;
    }

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

    public String getSongs_url() {
        return songs_url;
    }

    public void setSongs_url(String songs_url) {
        this.songs_url = songs_url;
    }
}
