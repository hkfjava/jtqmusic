package cn.hkf.controller;


import cn.hkf.dao.ISingerDao;
import cn.hkf.domain.Classify;
import cn.hkf.domain.Region;
import cn.hkf.domain.Singer;
import cn.hkf.service.IClassifyService;
import cn.hkf.service.IRegionService;
import cn.hkf.service.ISingerService;
import cn.hkf.utils.DateUtils;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/singer")
public class SingerController {

    @Autowired
    private ISingerService singerService;

    @Autowired
    private IRegionService regionService;

    @Autowired
    private IClassifyService classifyService;

    @RequestMapping(value = "/findLikeSinger.do",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String findLikeSinger(@RequestParam(value = "singer_id",required = true) Integer singer_id,
                                 @RequestParam(value = "singer_sex",required = true) Integer singer_sex,
                                 @RequestParam(value = "classify_id",required = true) Integer classify_id) throws Exception {

        List<Singer> singers = singerService.findLikeSinger(singer_id,singer_sex,classify_id);
        Gson gson = new Gson();
        String jsonListString = gson.toJson(singers);

        return jsonListString;
    }

    /**
     * 根据id查找 歌手
     */
    @RequestMapping(value = "/findById.do",method = RequestMethod.GET)
    public ModelAndView findById(@RequestParam(value = "singer_id",required = true) Integer singer_id) throws Exception {
        ModelAndView mv = new ModelAndView();

        Singer singer = singerService.findById(singer_id);
        String str = "yyyy-MM-dd";
        singer.setSinger_birth_str(DateUtils.date2String(singer.getSinger_birth(), str));
        singer.setSinger_timeOut_str(DateUtils.date2String(singer.getSinger_timeOut(), str));
        Region region = regionService.findById(singer.getRegion_id());
        Classify classify = classifyService.findById(singer.getClassify_id());

        mv.addObject("singer", singer);
        mv.addObject("region", region);
        mv.addObject("classify", classify);

        mv.setViewName("genres-detail");
        return mv;
    }

    /**
     * 保存 歌手
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save.do",method = RequestMethod.POST)
    public String save(Singer singer) throws Exception {
        System.out.println("ajax");
        int res = singerService.save(singer);
        if( res == 1) {
            return "101";
        } else {
            return "100";
        }
    }


    /**
     * 上传歌手页面的 异步获取地区列表
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/findAllRegion.do", produces = {"application/json;charset=UTF-8"})
    public String findAllRegion() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Region> regions = regionService.findAll();
        Gson gson = new Gson();
        String jsonListString = gson.toJson(regions);
        return jsonListString;
    }

    /**
     * 上传歌手页面的 异步获取流派
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/findAllClassify.do", produces = {"application/json;charset=UTF-8"})
    public String findAllClassify() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Classify> classifies = classifyService.findAll();
        Gson gson = new Gson();
        String jsonListString = gson.toJson(classifies);
        return jsonListString;
    }

    /**
     * 上传歌曲页面的 异步根据歌手id获取流派
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/findClassifyBySinger_id.do", produces = {"application/json;charset=UTF-8"})
    public String findClassifyBySinger_id(@RequestParam(value = "singer_id" ,required = true) Integer singer_id) throws Exception {

        Classify classifies = classifyService.findClassifyBySinger_id(singer_id);
        Gson gson = new Gson();
        String jsonListString = gson.toJson(classifies);
        return jsonListString;
    }

    /**
     * 查找所有歌手 地区 和流派
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll.do",method = RequestMethod.GET)
    public ModelAndView findAll(@RequestParam(value = "classify_id",required = false) Integer classify_id,
                                @RequestParam(value = "region_id",required = false) Integer region_id) throws Exception {
        ModelAndView mv = new ModelAndView();

        List<Singer> singers = null;

        if (classify_id != null) {
            singers = singerService.findByClassify(classify_id);
        } else if (region_id != null) {
            singers = singerService.findByRegion(region_id);
        } else {
            singers = singerService.findAll();
        }


        List<Region> regions = regionService.findAll();
        List<Classify> classifies = classifyService.findAll();
        mv.addObject("singers", singers);
        mv.addObject("regions", regions);
        mv.addObject("classifies", classifies);
        mv.setViewName("genres");
        return mv;
    }


    /**
     * 上传专辑页面的 异步获取歌手
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/findAllSinger.do", produces = {"application/json;charset=UTF-8"})
    public String findAllSinger() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Singer> singers = singerService.findAll();
        Gson gson = new Gson();
        String jsonListString = gson.toJson(singers);
        return jsonListString;
    }








}
