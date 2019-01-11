package com.zagle.service.stream.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.zagle.service.domain.Stream;
import com.zagle.service.domain.Board;
import com.zagle.service.domain.User;
import com.zagle.service.stream.StreamService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

 
public class StreamServiceTest {
	
	@Autowired
	 @Qualifier("streamServiceImpl")
	 private StreamService streamService;

	@Test
	public void testAddStream() throws Exception{
	String stringdate = "2018-01-11";
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(stringdate);
	User user=new User();
	user.setUserNo("US10001");
	user.setProfile("default.jpg");
	user.setUserName("user01");
	user.setUserNickname("user01");
	Stream stream = new Stream();
	stream.setStreamContent("오늘레전드");
	stream.setStreamDate(date);
	stream.setStreamLikeCount(0);
	stream.setStreamTitle("특집방송");
	stream.setStreamViewCount(0);
	stream.setUser(user);
	
	streamService.addStream(stream);
	
	}


}
