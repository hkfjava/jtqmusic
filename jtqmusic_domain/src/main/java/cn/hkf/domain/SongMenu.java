package cn.hkf.domain;

public class SongMenu {

    private Integer songmenu_id;
    private String songmenu_name;
    private String songmenu_label;
    private Integer songmenu_statu;
    private Integer songmenu_heat;
    private String songmenu_info;
    private Integer classify_id;
    private Integer user_id;

    public Integer getSongmenu_id() {
        return songmenu_id;
    }

    public void setSongmenu_id(Integer songmenu_id) {
        this.songmenu_id = songmenu_id;
    }

    public String getSongmenu_name() {
        return songmenu_name;
    }

    public void setSongmenu_name(String songmenu_name) {
        this.songmenu_name = songmenu_name;
    }

    public String getSongmenu_label() {
        return songmenu_label;
    }

    public void setSongmenu_label(String songmenu_label) {
        this.songmenu_label = songmenu_label;
    }

    public Integer getSongmenu_statu() {
        return songmenu_statu;
    }

    public void setSongmenu_statu(Integer songmenu_statu) {
        this.songmenu_statu = songmenu_statu;
    }

    public Integer getSongmenu_heat() {
        return songmenu_heat;
    }

    public void setSongmenu_heat(Integer songmenu_heat) {
        this.songmenu_heat = songmenu_heat;
    }

    public String getSongmenu_info() {
        return songmenu_info;
    }

    public void setSongmenu_info(String songmenu_info) {
        this.songmenu_info = songmenu_info;
    }

    public Integer getClassify_id() {
        return classify_id;
    }

    public void setClassify_id(Integer classify_id) {
        this.classify_id = classify_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
}
