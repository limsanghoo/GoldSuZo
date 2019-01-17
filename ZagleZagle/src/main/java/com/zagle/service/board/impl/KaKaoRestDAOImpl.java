package com.zagle.service.board.impl;

import java.net.URI;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Repository;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.zagle.service.board.RestBoardDAO;

@Repository("kakaoRestDAOImpl")
public class KaKaoRestDAOImpl implements RestBoardDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void shareBoard(String boardNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String addBoardVisionTag(String link) throws Exception {
		
		RestTemplate restTemplate = new RestTemplate();

        //Body
        MultiValueMap<String,String> params = new LinkedMultiValueMap<String,String>();
        params.add("image_url",link);
        
        //Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization","KakaoAK "+"ad82a4d95c664fc2c5f0355fc6a70df7");
       
        HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<MultiValueMap<String,String>>(params, headers);
        Map response = restTemplate.postForObject(new URI("https://kapi.kakao.com/v1/vision/multitag/generate"), request, Map.class);
       
        System.out.println(response);
        
        String result=response.get("result").toString();
                
        String[] split=result.split("\\[");
		
		String aaa=split[2];
		
		String bbb=aaa.replace("]", "").replace("}", "").replace(", ", "#");
		
		String ddd="#"+bbb;
		
		String eee=URLEncoder.encode(ddd, "utf-8");
		
		System.out.println(ddd);
		
		return eee;
	}

	@Override
	public void addBoardDaumMap() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void listMap() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
