package cn.hkf.controller;

import cn.hkf.domain.Songs;
import cn.hkf.service.ISongsService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/download")
public class downloadController {

    @Autowired
    private ISongsService songsService;

    @RequestMapping("downLoadFile.do")
    public ResponseEntity<byte[]> downFile(HttpServletRequest request, @RequestParam("fileName") Integer fileName) throws Exception {
        Songs songs = songsService.findById(fileName);
        String filenam = songs.getSongs_url();

        String path = request.getServletContext().getRealPath("/");
        File file = new File(path + filenam);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(filenam, "utf-8"));
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }



}
