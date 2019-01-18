package com.zagle.service.chat.test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;


public class ChatServiceTest {

	public ChatServiceTest() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String text = ChatServiceTest.testTrans();
		System.out.println(text);
	}

	public static String testTrans() throws Exception {
		String clientId = "om5qIXJJtvBuRNBtOir8";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "aUe54sGqx8";//애플리케이션 클라이언트 시크릿값";
        String text = URLEncoder.encode("안녕하세요. 오늘 기분은 어떻습니까?", "UTF-8");
        StringBuffer response = new StringBuffer();
        String result="";
        try {
            
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source=ko&target=en&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            JSONObject jsonobj1 = (JSONObject)new JSONParser().parse(br);
            JSONObject jsonobj2 = (JSONObject)new JSONParser().parse(jsonobj1.get("message").toString());
            JSONObject jsonobj3 = (JSONObject)new JSONParser().parse(jsonobj2.get("result").toString());
    		
            String inputLine;
            result = (String)jsonobj3.get("translatedText");
            System.out.println(result);
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            

            br.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
	}
}
