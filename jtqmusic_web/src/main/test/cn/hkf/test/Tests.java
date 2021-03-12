package cn.hkf.test;


import cn.hkf.domain.Classify;
import cn.hkf.domain.Singer;
import cn.hkf.service.IClassifyService;
import cn.hkf.service.ISingerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Tests {


    @Autowired
    private ISingerService singerService;

    @Autowired
    private IClassifyService classifyService;

    @Test
    public void testSpring() throws Exception {
        List<Singer> allAccount = singerService.findAll();
        for (Singer account : allAccount) {
            System.out.println(account);
        }
    }


    @Test
    public void testClassify() throws Exception {
        List<Classify> allAccount = classifyService.findAll();
        for (Classify account : allAccount) {
            System.out.println(account);
        }
    }

//    @Test
//    public void testSave() {
//        Account account = new Account(null, "老黑", 9898989.9789f);
//        accountService.saveAccount(account);
//    }

}
