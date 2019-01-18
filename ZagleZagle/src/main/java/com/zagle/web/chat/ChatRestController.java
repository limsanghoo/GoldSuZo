package com.zagle.web.chat;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping("/chat/*")
public class ChatRestController {
	private String fileName;

	public ChatRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="json/uploadFile/",method=RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest multipartFile) throws Exception{
		String path = "C:\\Users\\Bit\\git\\GoldSuZo\\ZagleZagle\\WebContent\\common\\images\\chat\\";
		System.out.println("파일업로드하는곳");
//		Chat chat = new Chat();
//		File file = new File(temDir, multipartFile.getOriginalFilename());
//		multipartFile.transferTo(file);
//		chat.setImageFile(multipartFile.getOriginalFilename());
		
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        Iterator<String> files = multipartFile.getFileNames();
        System.out.println(files.hasNext());
        while(files.hasNext()){
            String uploadFile = files.next();
            MultipartFile mFile = multipartFile.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
           
            try {
                mFile.transferTo(new File(path,fileName));
               
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
				this.fileName = fileName;
			}
        }
        return fileName;
	}
	
	@RequestMapping(value="json/translate/",method=RequestMethod.POST)
	public @ResponseBody String transText(@RequestParam("text") String data) throws Exception {
		String clientId = "om5qIXJJtvBuRNBtOir8";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "aUe54sGqx8";//애플리케이션 클라이언트 시크릿값";
        System.out.println(data+"<<----컨트롤러안에데이터");
        String text = URLEncoder.encode(data, "UTF-8");
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
        System.out.println("리턴전에 값 : "+result);
        return result;
	}
}
