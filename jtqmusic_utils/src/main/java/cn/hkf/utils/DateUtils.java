package cn.hkf.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {


    public static String date2String(Date date, String patt) {
        SimpleDateFormat df = new SimpleDateFormat(patt);
        String format = df.format(date);
        return format;
    }


    public static Date string2Date(String str, String patt) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat(patt);
        Date parse = df.parse(str);
        return parse;
    }


}
