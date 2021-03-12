package cn.hkf.test;


import cn.hkf.dao.IClassifyDao;
import cn.hkf.dao.ISingerDao;
import cn.hkf.domain.Classify;
import cn.hkf.domain.Singer;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class TestMybatis {
    SqlSessionFactory factory = null;
    SqlSession session = null;
    ISingerDao dao = null;
    InputStream in = null;
    IClassifyDao classifyDao = null;

    @Before
    @Test
    public void before() throws IOException {
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        factory = new SqlSessionFactoryBuilder().build(in);
        session = factory.openSession();
        dao = session.getMapper(ISingerDao.class);
        classifyDao = session.getMapper(IClassifyDao.class);
    }

    @After
    @Test
    public void after() throws IOException {
        session.commit();
        session.close();
        in.close();
    }

//    @Test
//    public void testSave() {
//        Account account = new Account(null, "改变健康红包", 500.9f);
//        dao.save(account);
//    }


    @Test
    public void testFindAll() throws Exception {
        List<Singer> singers = dao.findAll();
        for (Singer singer : singers) {
            System.out.println(singer);
        }
    }


    /**
     * 测试获取所有流派分裂
     * @throws Exception
     */
    @Test
    public void testClassify() throws Exception {
        List<Classify> classifies = classifyDao.findAll();
        for (Classify classify : classifies) {
            System.out.println(classifies);
        }
    }

}
